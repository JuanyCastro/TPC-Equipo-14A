<%@ Page Title="Alta de Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TPC_Equipo_14A.AltaUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Gestión de Usuario</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="El apellido es obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="El correo electrónico es obligatorio." CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Formato de correo electrónico inválido." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3" id="divContrasena" runat="server">
                    <label class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Rol asignado</label>
                    <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Administrador" Value="1" />
                        <asp:ListItem Text="Cliente" Value="2" />
                    </asp:DropDownList>
                </div>

                <div class="mb-4 d-flex align-items-center">
                    <asp:CheckBox ID="chkActivo" runat="server" Checked="true" />
                    <label class="form-check-label ms-2" for="MainContent_chkActivo" style="cursor: pointer;">Usuario Activo</label>
                </div>

                <div class="mt-4">
                    <asp:Button ID="btnAceptar" runat="server" Text="Guardar Usuario" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                    <a href="Usuarios.aspx" class="btn btn-secondary">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>