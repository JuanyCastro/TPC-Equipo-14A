<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Equipo_14A.Login" %>

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
                <h3 class="mb-0 fw-bold"><i class="fa-solid fa-futbol text-info me-2"></i>¡Bienvenido!</h3>
            </div>
            
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                <p class="text-center text-muted mb-4">Ingresá tus credenciales para acceder a tu cuenta.</p>

                <div class="mb-4">
                    <label class="form-label fw-bold text-dark ms-3">Email</label>
                    <div class="input-group input-group-lg rounded-pill border input-wrapper p-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary ms-2"><i class="fa-solid fa-envelope"></i></span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Email" placeholder="tu@email.com"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-2">
                    <label class="form-label fw-bold text-dark ms-3">Contraseña</label>
                    <div class="input-group input-group-lg rounded-pill border input-wrapper p-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary ms-2"><i class="fa-solid fa-lock"></i></span>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Password" placeholder="********"></asp:TextBox>
                        <button class="btn border-0 text-secondary me-2 shadow-none" type="button" id="btnTogglePassword" title="Mostrar/Ocultar contraseña">
                            <i class="fa-solid fa-eye" id="eyeIcon"></i>
                        </button>
                    </div>
                </div>
                 <div class="text-end mb-3 me-2">
                    <a href="RecuperarPassword.aspx" class="text-decoration-none small text-muted hover-primary">¿Olvidaste tu contraseña?</a>
                </div>

                <asp:Label ID="lblErrorLogin" runat="server" CssClass="text-danger fw-bold mb-3 d-block text-center" Visible="false"></asp:Label>

                <div class="d-flex justify-content-center mt-4 w-100">
                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-primary btn-lg fw-bold rounded-pill shadow-sm w-100" OnClick="btnLogin_Click" />
                    </div>
                <div class="text-center mt-4">
                    <span class="text-muted">¿No tenés cuenta?</span>
                    <a href="Registro.aspx" class="text-primary fw-bold text-decoration-none ms-1">Registrarme</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const btnToggle = document.getElementById("btnTogglePassword");
            const txtPassword = document.getElementById("<%= txtPassword.ClientID %>");
            const eyeIcon = document.getElementById("eyeIcon");

            btnToggle.addEventListener("click", function () {
                if (txtPassword.type === "password") {
                    txtPassword.type = "text";
                    eyeIcon.classList.remove("fa-eye");
                    eyeIcon.classList.add("fa-eye-slash");
                } else {
                    txtPassword.type = "password";
                    eyeIcon.classList.remove("fa-eye-slash");
                    eyeIcon.classList.add("fa-eye");
                }
            });
        });
    </script>
</asp:Content>