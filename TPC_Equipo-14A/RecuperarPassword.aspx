<%@ Page Title="Recuperar Contraseña" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecuperarPassword.aspx.cs" Inherits="TPC_Equipo_14A.RecuperarPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-control:focus {
            box-shadow: none !important;
            border-color: transparent !important;
        }
        .input-wrapper {
            background-color: #f8f9fa;
            transition: all 0.3s ease-in-out;
        }
        .input-wrapper:focus-within {
            background-color: #ffffff;
            border-color: #0d6efd !important;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15) !important;
        }
    </style>

    <div class="container mt-5 mb-5 d-flex justify-content-center align-items-center" style="min-height: 60vh;">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 420px; width: 100%;">
            
            <div class="card-header bg-dark text-white text-center py-4 rounded-top-4 border-0">
                <h3 class="mb-0 fw-bold"><i class="fa-solid fa-key text-info me-2"></i>Recuperar Clave</h3>
            </div>
            
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                <p class="text-center text-muted mb-4">Ingresá tu correo electrónico y te enviaremos una contraseña temporal para que puedas volver a entrar.</p>

                <div class="mb-4">
                    <label class="form-label fw-bold text-dark ms-3">Email registrado</label>
                    <div class="input-group input-group-lg rounded-pill border input-wrapper p-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary ms-2"><i class="fa-solid fa-envelope"></i></span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Email" placeholder="tu@email.com"></asp:TextBox>
                    </div>
                </div>

                <asp:Label ID="lblMensaje" runat="server" CssClass="fw-bold mb-3 d-block text-center" Visible="false"></asp:Label>

                <div class="d-flex justify-content-center mt-4 w-100">
                    <asp:Button ID="btnRecuperar" runat="server" Text="Enviar nueva contraseña" CssClass="btn btn-primary btn-lg fw-bold rounded-pill shadow-sm w-100" OnClick="btnRecuperar_Click" />
                </div>
                
                <div class="text-center mt-4">
                    <a href="Login.aspx" class="text-secondary fw-bold text-decoration-none"><i class="fa-solid fa-arrow-left me-1"></i>Volver al Login</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>