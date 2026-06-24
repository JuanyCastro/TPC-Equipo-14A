<%@ Page Title="Pago Exitoso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagoExitoso.aspx.cs" Inherits="TPC_Equipo_14A.PagoExitoso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card shadow-lg border-0 rounded-4 text-center" style="max-width: 500px; width: 100%;">
            
            <div class="card-body p-5">
                <div class="mb-4">
                    <i class="fa-solid fa-circle-check text-success" style="font-size: 5rem;"></i>
                </div>
                
                <h2 class="fw-bold text-dark mb-3">¡Pago Confirmado!</h2>
                <p class="text-muted fs-5">Tu seña se procesó correctamente y la cancha ya quedó reservada.</p>
                
                <div class="bg-light rounded p-3 my-4 border text-start">
                    <p class="mb-1 text-muted">Número de Comprobante:</p>
                    <asp:Label ID="lblPagoId" runat="server" CssClass="fw-bold text-dark fs-5"></asp:Label>
                </div>

                <a href="Default.aspx" class="btn btn-primary btn-lg fw-bold rounded-pill shadow-sm px-5">Volver al Inicio</a>
            </div>

        </div>
    </div>
</asp:Content>