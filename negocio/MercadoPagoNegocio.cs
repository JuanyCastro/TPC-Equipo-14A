using System;
using System.Collections.Generic;
using System.Configuration;
using MercadoPago.Client.Preference;
using MercadoPago.Config;
using MercadoPago.Resource.Preference;
using dominio;

namespace negocio
{
    public class MercadoPagoNegocio
    {
        private PreferenceRequest request;
        private List<PreferenceItemRequest> listaPreferenceItemRequest;
        private Preference preference;
        private PreferenceClient client;
        private string success;
        private string failure;
        private string pending;

        public MercadoPagoNegocio(string urlBase)
        {
            MercadoPagoConfig.AccessToken = ConfigurationManager.AppSettings["MERCADO_PAGO_TOKEN"];
            string baseUrl = urlBase.TrimEnd('/').Replace("http://", "https://");

            success = baseUrl + "/PagoExitoso.aspx";
            failure = baseUrl + "/PagoFallido.aspx";
            pending = baseUrl + "/PagoPendiente.aspx";
        }
        private void CargarItemsPreferenceRequest(Reserva reserva, decimal montoSeña)
        {
            try
            {
                listaPreferenceItemRequest = new List<PreferenceItemRequest>();
                listaPreferenceItemRequest.Add(new PreferenceItemRequest
                {
                    Title = "Seña de Cancha - " + reserva.Cancha.Nombre,
                    Quantity = 1,
                    CurrencyId = "ARS",
                    UnitPrice = montoSeña
                });
            }
            catch (Exception ex)
            {
                throw new Exception("Error al cargar la seña a la Preferencia Mercado Pago", ex);
            }
        }
        private void CrearPreferenceRequest()
        {
            string externalReference = string.Concat("Reserva-", DateTime.Now.ToString("yyyyMMddHHmmss"));

            request = new PreferenceRequest
            {
                Items = listaPreferenceItemRequest,
                BackUrls = new PreferenceBackUrlsRequest
                {
                    Success = success,
                    Failure = failure,
                    Pending = pending
                },
                AutoReturn = "approved",
                ExternalReference = externalReference
            };
        }

        public string PagarMercadoPago(Reserva reserva, decimal montoSeña)
        {
            try
            {
                CargarItemsPreferenceRequest(reserva, montoSeña);
                CrearPreferenceRequest();

                client = new PreferenceClient();
                preference = client.Create(request);
                return preference.InitPoint;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al Pagar con Mercado Pago", ex);
            }
        }
    }
}