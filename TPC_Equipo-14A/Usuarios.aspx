<%@ Page Title="Gestión de Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TPC_Equipo_14A.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Gestión de Usuarios</h2>
            <a href="AltaUsuario.aspx" class="btn btn-primary">
                <i class="fa-solid fa-plus"></i> Nuevo Usuario
            </a>
        </div>
        <p class="text-muted">Administración de clientes, administradores y estados de cuenta.</p>

        <div class="card shadow-sm mt-3">
            <div class="card-body p-0">
                <asp:GridView ID="dgvUsuarios" runat="server" CssClass="table table-striped table-hover mb-0" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="dgvUsuarios_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="10%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="20%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="20%" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="25%" HeaderStyle-CssClass="table-dark" />
                        <asp:CheckBoxField DataField="Activo" HeaderText="Activo" ItemStyle-Width="10%" HeaderStyle-CssClass="table-dark" />
                        <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark">
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