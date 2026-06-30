<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Equipo_14A.Registro" %>

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

    <div class="container mt-5 mb-5 d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 500px; width: 100%;">
            
            <div class="card-header bg-dark text-white text-center py-4 rounded-top-4 border-0">
                <h3 class="mb-0 fw-bold"><i class="fa-solid fa-user-plus text-info me-2"></i>Crear Cuenta</h3>
            </div>
            
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                <p class="text-center text-muted mb-4">Completá tus datos para empezar a reservar canchas.</p>

                <div class="row gx-2 mb-3">
                    <div class="col-6">
                        <label class="form-label fw-bold text-dark ms-2 small">Nombre</label>
                        <div class="input-group rounded-pill border input-wrapper p-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary ms-1"><i class="fa-solid fa-user"></i></span>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control border-0 bg-transparent px-2" placeholder="Juan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-bold text-dark ms-2 small">Apellido</label>
                        <div class="input-group rounded-pill border input-wrapper p-1 shadow-sm">
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control border-0 bg-transparent px-3" placeholder="Pérez"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold text-dark ms-3 small">Email</label>
                    <div class="input-group rounded-pill border input-wrapper p-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary ms-2"><i class="fa-solid fa-envelope"></i></span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Email" placeholder="tu@email.com"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold text-dark ms-3 small">Teléfono</label>
                    <div class="input-group rounded-pill border input-wrapper p-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary ms-2"><i class="fa-solid fa-phone"></i></span>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control border-0 bg-transparent px-2" placeholder="1123456789"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold text-dark ms-3 small">Contraseña</label>
                    <div class="input-group rounded-pill border input-wrapper p-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary ms-2"><i class="fa-solid fa-lock"></i></span>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Password" placeholder="********"></asp:TextBox>
                        <button class="btn border-0 text-secondary me-2 shadow-none toggle-pass" type="button" data-target="<%= txtPassword.ClientID %>">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold text-dark ms-3 small">Confirmar Contraseña</label>
                    <div class="input-group rounded-pill border input-wrapper p-1 shadow-sm">
                        <span class="input-group-text bg-transparent border-0 text-primary ms-2"><i class="fa-solid fa-lock-open"></i></span>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Password" placeholder="********"></asp:TextBox>
                        <button class="btn border-0 text-secondary me-2 shadow-none toggle-pass" type="button" data-target="<%= txtConfirmPassword.ClientID %>">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>

                <asp:Label ID="lblError" runat="server" CssClass="text-danger fw-bold mb-3 d-block text-center" Visible="false"></asp:Label>

                <div class="d-flex justify-content-center mt-3 w-100">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" CssClass="btn btn-primary btn-lg fw-bold rounded-pill shadow-sm w-100" OnClick="btnRegistrar_Click" />
                </div>
                
                <div class="text-center mt-4">
                    <span class="text-muted">¿Ya tenés cuenta?</span>
                    <a href="Login.aspx" class="text-primary fw-bold text-decoration-none ms-1">Iniciar Sesión</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toggleButtons = document.querySelectorAll(".toggle-pass");

            toggleButtons.forEach(btn => {
                btn.addEventListener("click", function () {
                    const targetId = this.getAttribute("data-target");
                    const inputField = document.getElementById(targetId);
                    const icon = this.querySelector("i");

                    if (inputField.type === "password") {
                        inputField.type = "text";
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");
                    } else {
                        inputField.type = "password";
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    }
                });
            });
        });
    </script>
</asp:Content>