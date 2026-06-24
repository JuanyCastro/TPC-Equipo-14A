<%@ Page Title="Checkout - Confirmar Reserva" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="TPC_Equipo_14A.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 500px; width: 100%;">
            
            <div class="card-header bg-primary text-white text-center py-3">
                <h4 class="mb-0 fw-bold"><i class="fa-solid fa-file-invoice-dollar me-2"></i>Confirmar Reserva</h4>
            </div>
            
            <div class="card-body p-4">
                <h5 class="card-title text-center mb-4">Detalle de tu turno</h5>
                
                <ul class="list-group list-group-flush mb-4">
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                        <span class="text-muted">Cancha:</span>
                        <asp:Label ID="lblCancha" runat="server" CssClass="fw-bold text-dark"></asp:Label>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                        <span class="text-muted">Fecha y Hora:</span>
                        <asp:Label ID="lblFecha" runat="server" CssClass="fw-bold text-dark"></asp:Label>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                        <span class="text-muted">Precio Total:</span>
                        <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold text-dark"></asp:Label>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0 bg-light rounded mt-2 p-3 border">
                        <span class="text-primary fw-bold">Seña a pagar (20%):</span>
                        <asp:Label ID="lblSena" runat="server" CssClass="fw-bold text-primary fs-5"></asp:Label>
                    </li>
                </ul>

                <div class="d-grid gap-3">
                    <asp:Button ID="btnPagarMercadoPago" runat="server" Text="Pagar Seña con Mercado Pago" CssClass="btn btn-success btn-lg fw-bold rounded-pill shadow-sm" OnClick="btnPagarMercadoPago_Click" />
                    <a href="Default.aspx" class="btn btn-outline-secondary rounded-pill">Cancelar</a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>