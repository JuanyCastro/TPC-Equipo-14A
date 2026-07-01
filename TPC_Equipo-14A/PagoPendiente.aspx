<%@ Page Title="Pago Pendiente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagoPendiente.aspx.cs" Inherits="TPC_Equipo_14A.PagoPendiente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card shadow-lg border-0 rounded-4 text-center" style="max-width: 500px; width: 100%;">
            <div class="card-body p-5">
                <div class="mb-4"><i class="fa-solid fa-clock text-warning" style="font-size: 5rem;"></i></div>
                <h2 class="fw-bold text-dark mb-3">Pago Pendiente</h2>
                <p class="text-muted fs-5">Tu pago se encuentra en proceso de validación por Mercado Pago.</p>
                <div class="bg-light rounded-4 p-4 my-4 border text-center shadow-sm">
                    <p class="mb-1 text-muted small text-uppercase fw-bold">ID de Seguimiento</p>
                    <asp:Label ID="lblPagoId" runat="server" CssClass="fw-bold text-warning fs-3"></asp:Label>
                </div>
                <div class="alert alert-warning mt-4 mb-4 text-start rounded-3 border-0 shadow-sm" role="alert">
                    <i class="fa-solid fa-circle-info me-2"></i>La reserva se confirmará automáticamente al acreditarse.
                </div>
                <a href="Default.aspx" class="btn btn-warning text-dark btn-lg fw-bold rounded-pill shadow-sm px-5 w-100 btn-hover-scale">Volver al Inicio</a>
            </div>
        </div>
    </div>
</asp:Content>