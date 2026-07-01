<%@ Page Title="Checkout - Confirmar Reserva" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="TPC_Equipo_14A.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 500px; width: 100%;">
            <div class="card-header bg-primary text-white text-center py-4 rounded-top-4 border-0">
                <h4 class="mb-0 fw-bold"><i class="fa-solid fa-file-invoice-dollar me-2 text-warning"></i>Confirmar Reserva</h4>
            </div>
            <div class="card-body p-4 p-md-5">
                <h5 class="card-title text-center mb-4 fw-bold text-dark">Detalle de tu turno</h5>
                
                <ul class="list-group list-group-flush mb-4">
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0 border-bottom border-light py-3">
                        <span class="text-muted"><i class="fa-solid fa-map-location-dot me-2 text-primary"></i>Cancha:</span>
                        <asp:Label ID="lblCancha" runat="server" CssClass="fw-bold text-dark"></asp:Label>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0 border-bottom border-light py-3">
                        <span class="text-muted"><i class="fa-regular fa-calendar me-2 text-primary"></i>Fecha y Hora:</span>
                        <asp:Label ID="lblFecha" runat="server" CssClass="fw-bold text-dark"></asp:Label>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0 border-bottom border-light py-3">
                        <span class="text-muted"><i class="fa-solid fa-money-bill-wave me-2 text-success"></i>Precio Total:</span>
                        <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold text-dark"></asp:Label>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center px-0 bg-success bg-opacity-10 rounded-3 mt-3 p-3 border border-success border-opacity-25 shadow-sm">
                        <span class="text-success fw-bold">Seña a pagar (2%):</span>
                        <asp:Label ID="lblSena" runat="server" CssClass="fw-bold text-success fs-5"></asp:Label>
                    </li>
                </ul>
                <asp:CheckBox ID="chkTurnoFijo" runat="server" Visible="false" />

                <div class="d-flex flex-column gap-3 mt-4">
                    <asp:Button ID="btnPagarMercadoPago" runat="server" Text="Pagar con Mercado Pago" CssClass="btn btn-success btn-lg fw-bold rounded-pill shadow-sm py-2 w-100 btn-hover-scale" OnClick="btnPagarMercadoPago_Click" />
                    <a href="Turnos.aspx" class="btn btn-outline-secondary fw-bold rounded-pill py-2 w-100 text-center btn-hover-scale">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>