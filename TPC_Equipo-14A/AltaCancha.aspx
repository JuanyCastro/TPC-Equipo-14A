<%@ Page Title="Alta de Cancha" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaCancha.aspx.cs" Inherits="TPC_Equipo_14A.AltaCancha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center align-items-center">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 550px; width: 100%;">
            <div class="card-header bg-dark text-white text-center py-4 rounded-top-4 border-0">
                <h4 class="mb-0 fw-bold"><i class="fa-solid fa-map-location-dot text-info me-2"></i>Gestión de Cancha</h4>
            </div>
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                
                <asp:Panel ID="pnlFormulario" runat="server" DefaultButton="btnAceptar">
                    <div class="mb-4">
                        <label class="form-label fw-bold text-dark ms-1 small">Deporte</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-trophy"></i></span>
                            <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="form-select border-0 bg-transparent" AutoPostBack="true" OnSelectedIndexChanged="ddlDeporte_SelectedIndexChanged" AppendDataBoundItems="true">
                                <asp:ListItem Text="-- Seleccione --" Value="0" />
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvDeporte" runat="server" ControlToValidate="ddlDeporte" InitialValue="0" ErrorMessage="Seleccione un deporte." CssClass="text-danger small ms-2" Display="Dynamic" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-dark ms-1 small">Superficie</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-layer-group"></i></span>
                            <asp:DropDownList ID="ddlSuperficie" runat="server" CssClass="form-select border-0 bg-transparent" Enabled="false">
                                <asp:ListItem Text="-- Seleccione primero un Deporte --" Value="0" />
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvSuperficie" runat="server" ControlToValidate="ddlSuperficie" InitialValue="0" ErrorMessage="Seleccione una superficie." CssClass="text-danger small ms-2" Display="Dynamic" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-dark ms-1 small">Precio Base</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-success"><i class="fa-solid fa-money-bill-wave"></i></span>
                            <asp:TextBox ID="txtPrecioBase" runat="server" CssClass="form-control border-0 bg-transparent" TextMode="Number" step="0.01" placeholder="Ej: 15000.00"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecioBase" ErrorMessage="Obligatorio." CssClass="text-danger small ms-2" Display="Dynamic" />
                    </div>

                    <div class="d-flex justify-content-center gap-4 mb-4">
                        <asp:CheckBox ID="chkActiva" runat="server" Checked="true" Text="Activa" CssClass="custom-switch fw-bold text-dark" />
                        <asp:CheckBox ID="chkMantenimiento" runat="server" Text="En Mantenimiento" CssClass="custom-switch fw-bold text-warning" />
                    </div>

                    <asp:Label ID="lblError" runat="server" CssClass="text-danger small fw-bold mb-3 d-block text-center"></asp:Label>

                    <div class="d-flex gap-3 mt-4">
                        <a href="Canchas.aspx" class="btn btn-outline-secondary btn-lg fw-bold rounded-pill w-50 btn-hover-scale">Cancelar</a>
                        <asp:Button ID="btnAceptar" runat="server" Text="Guardar" CssClass="btn btn-primary btn-lg fw-bold rounded-pill w-50 shadow-sm btn-hover-scale" OnClick="btnAceptar_Click" />
                    </div>
                </asp:Panel>

            </div>
        </div>
    </div>
</asp:Content>