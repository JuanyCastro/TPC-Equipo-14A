<%@ Page Title="Alta de Deporte" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaDeporte.aspx.cs" Inherits="TPC_Equipo_14A.AltaDeporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5 d-flex justify-content-center align-items-center">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 550px; width: 100%;">
            <div class="card-header bg-dark text-white text-center py-4 rounded-top-4 border-0">
                <h4 class="mb-0 fw-bold"><i class="fa-solid fa-trophy text-info me-2"></i>Gestión de Deporte</h4>
            </div>
            <div class="card-body p-4 p-md-5 bg-white rounded-bottom-4">
                
                <asp:Panel ID="pnlFormulario" runat="server" DefaultButton="btnAceptar">
                    <div class="mb-4">
                        <label class="form-label fw-bold text-dark ms-1 small">Nombre del Deporte</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-solid fa-tag"></i></span>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control border-0 bg-transparent" placeholder="Ej: Fútbol 5"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Obligatorio." CssClass="text-danger small ms-2" Display="Dynamic" />
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label fw-bold text-dark ms-1 small">Duración del Bloque (min)</label>
                        <div class="input-group rounded-pill input-wrapper px-2 py-1 shadow-sm">
                            <span class="input-group-text bg-transparent border-0 text-primary"><i class="fa-regular fa-clock"></i></span>
                            <asp:TextBox ID="txtDuracion" runat="server" TextMode="Number" CssClass="form-control border-0 bg-transparent" placeholder="Ej: 60"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvDuracion" runat="server" ControlToValidate="txtDuracion" ErrorMessage="Obligatorio." CssClass="text-danger small ms-2" Display="Dynamic" />
                    </div>

                    <div class="d-flex justify-content-center mb-4">
                        <asp:CheckBox ID="chkActivo" runat="server" Checked="true" Text="Deporte Activo" CssClass="custom-switch fw-bold text-dark" />
                    </div>

                    <asp:Label ID="lblError" runat="server" CssClass="text-danger small fw-bold mb-3 d-block text-center"></asp:Label>

                    <div class="d-flex gap-3 mt-4">
                        <a href="Deportes.aspx" class="btn btn-outline-secondary btn-lg fw-bold rounded-pill w-50 btn-hover-scale">Cancelar</a>
                        <asp:Button ID="btnAceptar" runat="server" Text="Guardar" CssClass="btn btn-primary btn-lg fw-bold rounded-pill w-50 shadow-sm btn-hover-scale" OnClick="btnAceptar_Click" />
                    </div>
                </asp:Panel>

            </div>
        </div>
    </div>
</asp:Content>