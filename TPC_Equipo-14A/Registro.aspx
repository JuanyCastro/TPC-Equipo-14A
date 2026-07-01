<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Equipo_14A.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 500px; width: 100%;">
            <div class="card-header bg-dark text-white text-center py-4 rounded-top-4 border-0">
                <h3 class="mb-0 fw-bold"><i class="fa-solid fa-user-plus text-info me-2"></i>Crear Cuenta</h3>
            </div>
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                <p class="text-center text-muted mb-4">Completá tus datos para empezar a reservar canchas.</p>

                <asp:Panel ID="pnlFormulario" runat="server" DefaultButton="btnRegistrar">
                    
                    <div class="row gx-2 mb-3">
                        <div class="col-6">
                            <label class="form-label fw-bold text-dark ms-2 small">Nombre</label>
                            <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                                <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-user"></i></span>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control border-0 bg-transparent px-1" placeholder="Juan"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo requerido." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                            <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ErrorMessage="Solo letras." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-bold text-dark ms-2 small">Apellido</label>
                            <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control border-0 bg-transparent px-3" placeholder="Pérez"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Campo requerido." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                            <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ErrorMessage="Solo letras." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-dark ms-2 small">Email</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-envelope"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Email" placeholder="tu@email.com"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo requerido." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Email inválido." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-dark ms-2 small">Teléfono</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-phone"></i></span>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control border-0 bg-transparent px-2" placeholder="1123456789"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Campo requerido." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ValidationExpression="^[0-9]+$" ErrorMessage="Solo números." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-dark ms-2 small">Contraseña</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-lock"></i></span>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Password" placeholder="********"></asp:TextBox>
                            <button class="btn border-0 text-secondary shadow-none toggle-pass" type="button" data-target="<%= txtPassword.ClientID %>"><i class="fa-solid fa-eye"></i></button>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="La contraseña es obligatoria." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                        <asp:RegularExpressionValidator ID="revPass" runat="server" ControlToValidate="txtPassword" ValidationExpression="^.{6,}$" ErrorMessage="Mínimo 6 caracteres." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-dark ms-2 small">Confirmar Contraseña</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-lock-open"></i></span>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control border-0 bg-transparent px-2" TextMode="Password" placeholder="********"></asp:TextBox>
                            <button class="btn border-0 text-secondary shadow-none toggle-pass" type="button" data-target="<%= txtConfirmPassword.ClientID %>"><i class="fa-solid fa-eye"></i></button>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Debes confirmar tu contraseña." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                        <asp:CompareValidator ID="cvPass" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Las contraseñas no coinciden." CssClass="text-danger small ms-2" Display="Dynamic" ValidationGroup="vgRegistro" />
                    </div>
                    
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger small fw-bold mb-3 d-block text-center"></asp:Label>

                    <div class="mt-3">
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" CssClass="btn btn-primary btn-lg fw-bold rounded-pill shadow-sm w-100 btn-hover-scale" OnClick="btnRegistrar_Click" ValidationGroup="vgRegistro" />
                    </div>
                </asp:Panel>

                <div class="text-center mt-4">
                    <span class="text-muted small">¿Ya tenés cuenta?</span>
                    <a href="Login.aspx" class="text-primary fw-bold text-decoration-none ms-1 small">Iniciar Sesión</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".toggle-pass").forEach(btn => {
                btn.addEventListener("click", function () {
                    const inputField = document.getElementById(this.getAttribute("data-target"));
                    const icon = this.querySelector("i");
                    if (inputField.type === "password") { inputField.type = "text"; icon.classList.replace("fa-eye", "fa-eye-slash"); }
                    else { inputField.type = "password"; icon.classList.replace("fa-eye-slash", "fa-eye"); }
                });
            });
        });
    </script>
</asp:Content>