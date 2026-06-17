<%@ Page Title="Alta de Deporte" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaDeporte.aspx.cs" Inherits="TPC_Equipo_14A.AltaDeporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Gestión de Deporte</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label">Nombre del Deporte</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                        ControlToValidate="txtNombre" 
                        ErrorMessage="El nombre del deporte es obligatorio." 
                        CssClass="text-danger" Display="Dynamic" />
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Duración del Bloque (minutos)</label>
                    <asp:TextBox ID="txtDuracion" runat="server" TextMode="Number" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvDuracion" runat="server" 
                        ControlToValidate="txtDuracion" 
                        ErrorMessage="Ingresá una duración." 
                        CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-4 d-flex align-items-center">
                    <asp:CheckBox ID="chkActivo" runat="server" Checked="true" />
                    <label class="form-check-label ms-2" for="MainContent_chkActivo" style="cursor: pointer;">Deporte Activo</label>
                </div>

                <div class="mt-4">
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger fw-bold mb-3 d-block"></asp:Label>
                    <asp:Button ID="btnAceptar" runat="server" Text="Guardar Deporte" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                    <a href="Deportes.aspx" class="btn btn-secondary">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>