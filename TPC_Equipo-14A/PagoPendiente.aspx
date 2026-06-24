<%@ Page Title="Pago Pendiente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagoPendiente.aspx.cs" Inherits="TPC_Equipo_14A.PagoPendiente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card shadow-lg border-0 rounded-4 text-center" style="max-width: 500px; width: 100%;">
            
            <div class="card-body p-5">
                <div class="mb-4">
                    <i class="fa-solid fa-clock text-warning" style="font-size: 5rem;"></i>
                </div>
                
                <h2 class="fw-bold text-dark mb-3">Pago Pendiente</h2>
                <p class="text-muted fs-5">Tu pago se encuentra en proceso de validación por Mercado Pago o estás pendiente de abonar en efectivo.</p>
                
                <div class="bg-light rounded p-3 my-4 border text-start">
                    <p class="mb-1 text-muted">ID de Seguimiento:</p>
                    <asp:Label ID="lblPagoId" runat="server" CssClass="fw-bold text-dark fs-5"></asp:Label>
                </div>

                <div class="alert alert-warning mt-4 mb-4 text-start" role="alert">
                    <i class="fa-solid fa-circle-info me-2"></i>La reserva de la cancha se confirmará automáticamente en cuanto el dinero ingrese a nuestra cuenta.
                </div>

                <a href="Default.aspx" class="btn btn-warning text-dark btn-lg fw-bold rounded-pill shadow-sm px-5">Volver al Inicio</a>
            </div>

        </div>
    </div>
</asp:Content>