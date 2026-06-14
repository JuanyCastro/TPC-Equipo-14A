<%@ Page Title="Gestión de Canchas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Canchas.aspx.cs" Inherits="TPC_Equipo_14A.Canchas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Gestión de Canchas</h2>
            <a href="AltaCancha.aspx" class="btn btn-primary">
                <i class="fa-solid fa-plus"></i> Nueva Cancha
            </a>
        </div>

        <div class="card shadow-sm mt-3">
            <div class="card-body p-0">
                <asp:GridView ID="dgvCanchas" runat="server" CssClass="table table-striped table-hover mb-0" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="dgvCanchas_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="25%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="Deporte.Id" HeaderText="ID Deporte" ItemStyle-Width="10%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="PrecioBase" HeaderText="Precio Base" DataFormatString="{0:C}" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark" />
                        <asp:CheckBoxField DataField="EnMantenimiento" HeaderText="En Mantenimiento" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark" />
                        <asp:CheckBoxField DataField="Activa" HeaderText="Activa" ItemStyle-Width="10%" HeaderStyle-CssClass="table-dark" />
                        <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="20%" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' Text="Editar" CssClass="btn btn-sm btn-warning" />
                                <asp:Button ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' Text="Eliminar" CssClass="btn btn-sm btn-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>