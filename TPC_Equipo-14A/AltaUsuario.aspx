<%@ Page Title="Alta de Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TPC_Equipo_14A.AltaUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center align-items-center">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 600px; width: 100%;">
            <div class="card-header bg-dark text-white text-center py-4 rounded-top-4 border-0">
                <h4 class="mb-0 fw-bold"><i class="fa-solid fa-user-pen text-info me-2"></i>Gestión de Usuario</h4>
            </div>
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                
                <asp:Panel ID="pnlFormulario" runat="server" DefaultButton="btnAceptar">
                    <div class="row gx-3 mb-3">
                        <div class="col-6">
                            <label class="form-label fw-bold text-dark ms-1 small">Nombre</label>
                            <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                                <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-user"></i></span>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control border-0 bg-transparent px-1" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Obligatorio." CssClass="text-danger small ms-2" Display="Dynamic" />
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-bold text-dark ms-1 small">Apellido</label>
                            <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control border-0 bg-transparent px-2" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Obligatorio." CssClass="text-danger small ms-2" Display="Dynamic" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-dark ms-1 small">Email</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-envelope"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-0 bg-transparent" TextMode="Email" />
                        </div>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Obligatorio." CssClass="text-danger small ms-2" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-dark ms-1 small">Teléfono</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-phone"></i></span>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control border-0 bg-transparent" />
                        </div>
                    </div>

                    <div class="mb-3" id="divContrasena" runat="server">
                        <label class="form-label fw-bold text-dark ms-1 small">Contraseña</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-lock"></i></span>
                            <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control border-0 bg-transparent" TextMode="Password" />
                        </div>
                    </div>

                    <div class="row gx-3 mb-4 align-items-center">
                        <div class="col-8">
                            <label class="form-label fw-bold text-dark ms-1 small">Rol asignado</label>
                            <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                                <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-id-badge"></i></span>
                                <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-select border-0 bg-transparent">
                                    <asp:ListItem Text="Administrador" Value="1" />
                                    <asp:ListItem Text="Cliente" Value="2" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-4 d-flex justify-content-center mt-4">
                            <asp:CheckBox ID="chkActivo" runat="server" Checked="true" Text="Activo" CssClass="custom-switch fw-bold text-dark" />
                        </div>
                    </div>

                    <asp:Label ID="lblError" runat="server" CssClass="text-danger small fw-bold mb-3 d-block text-center"></asp:Label>

                    <div class="d-flex gap-3 mt-4">
                        <a href="Usuarios.aspx" class="btn btn-outline-secondary btn-lg fw-bold rounded-pill w-50 btn-hover-scale">Cancelar</a>
                        <asp:Button ID="btnAceptar" runat="server" Text="Guardar" CssClass="btn btn-primary btn-lg fw-bold rounded-pill w-50 shadow-sm btn-hover-scale" OnClick="btnAceptar_Click" />
                    </div>
                </asp:Panel>

            </div>
        </div>
    </div>
</asp:Content>