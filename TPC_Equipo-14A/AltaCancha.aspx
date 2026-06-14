<%@ Page Title="Alta de Cancha" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaCancha.aspx.cs" Inherits="TPC_Equipo_14A.AltaCancha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Gestión de Cancha</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label">Nombre de la Cancha</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Deporte</label>
                    <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label class="form-label">Precio Base</label>
                    <asp:TextBox ID="txtPrecioBase" runat="server" CssClass="form-control" TextMode="Number" step="0.01" />
                    <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecioBase" ErrorMessage="El precio base es obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3 d-flex align-items-center">
                    <asp:CheckBox ID="chkMantenimiento" runat="server" />
                    <label class="form-check-label ms-2" for="MainContent_chkMantenimiento" style="cursor: pointer;">En Mantenimiento</label>
                </div>

                <div class="mb-4 d-flex align-items-center">
                    <asp:CheckBox ID="chkActiva" runat="server" Checked="true" />
                    <label class="form-check-label ms-2" for="MainContent_chkActiva" style="cursor: pointer;">Cancha Activa</label>
                </div>

                <div class="mt-4">
                    <asp:Button ID="btnAceptar" runat="server" Text="Guardar Cancha" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                    <a href="Canchas.aspx" class="btn btn-secondary">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>