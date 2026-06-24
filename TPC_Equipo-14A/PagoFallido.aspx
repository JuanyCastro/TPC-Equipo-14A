<%@ Page Title="Pago Rechazado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagoFallido.aspx.cs" Inherits="TPC_Equipo_14A.PagoFallido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card shadow-lg border-0 rounded-4 text-center" style="max-width: 500px; width: 100%;">
            
            <div class="card-body p-5">
                <div class="mb-4">
                    <i class="fa-solid fa-circle-xmark text-danger" style="font-size: 5rem;"></i>
                </div>
                
                <h2 class="fw-bold text-dark mb-3">Pago Rechazado</h2>
                <p class="text-muted fs-5">Tuvimos un problema al procesar el pago de tu seña. Tu tarjeta pudo haber sido rechazada o no cuenta con fondos suficientes.</p>
                
                <div class="alert alert-danger mt-4 mb-4 text-start" role="alert">
                    <i class="fa-solid fa-triangle-exclamation me-2"></i><strong>Atención:</strong> Tu turno aún no está confirmado.
                </div>

                <div class="d-grid gap-3">
                    <a href="Checkout.aspx" class="btn btn-danger btn-lg fw-bold rounded-pill shadow-sm">Intentar con otro medio de pago</a>
                    <a href="Default.aspx" class="btn btn-outline-secondary rounded-pill">Volver al Inicio</a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>