<%@ Page Title="Gestión de Deportes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Deportes.aspx.cs" Inherits="TPC_Equipo_14A.Deportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Gestión de Deportes</h2>
            <button type="button" class="btn btn-primary">
                <i class="fa-solid fa-plus"></i> Nuevo Deporte
            </button>
        </div>
        <p class="text-muted">Configuración de disciplinas, tiempos por bloque y estados del complejo.</p>

        <div class="card shadow-sm mt-3">
            <div class="card-body p-0">
                <asp:GridView ID="dgvDeportes" runat="server" CssClass="table table-striped table-hover mb-0" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="10%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="Nombre" HeaderText="Deporte" ItemStyle-Width="40%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="DuracionBloqueMinutos" HeaderText="Duración (Min)" ItemStyle-Width="30%" HeaderStyle-CssClass="table-dark" />
                        <asp:CheckBoxField DataField="Activo" HeaderText="Activo" ItemStyle-Width="20%" HeaderStyle-CssClass="table-dark" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>