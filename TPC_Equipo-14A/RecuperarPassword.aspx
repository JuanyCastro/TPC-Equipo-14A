<%@ Page Title="Recuperar Contraseña" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecuperarPassword.aspx.cs" Inherits="TPC_Equipo_14A.RecuperarPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center align-items-center" style="min-height: 60vh;">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 420px; width: 100%;">
            <div class="card-header bg-dark text-white text-center py-4 rounded-top-4 border-0">
                <h3 class="mb-0 fw-bold"><i class="fa-solid fa-key text-info me-2"></i>Recuperar Clave</h3>
            </div>
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                <p class="text-center text-muted mb-4">Ingresá tu correo electrónico y te enviaremos una contraseña temporal.</p>

                <div class="mb-4">
                    <label class="form-label fw-bold text-dark ms-2 small">Email registrado</label>
                    <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-envelope"></i></span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Email" placeholder="tu@email.com"></asp:TextBox>
                    </div>
                </div>

                <asp:Label ID="lblMensaje" runat="server" CssClass="fw-bold mb-3 d-block text-center" Visible="false"></asp:Label>

                <div class="mt-4">
                    <asp:Button ID="btnRecuperar" runat="server" Text="Enviar nueva contraseña" CssClass="btn btn-primary btn-lg fw-bold rounded-pill shadow-sm w-100 btn-hover-scale" OnClick="btnRecuperar_Click" />
                </div>
                
                <div class="text-center mt-4">
                    <a href="Login.aspx" class="text-secondary fw-bold text-decoration-none small"><i class="fa-solid fa-arrow-left me-1"></i>Volver al Login</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>