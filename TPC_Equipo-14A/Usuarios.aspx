<%@ Page Title="Gestión de Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TPC_Equipo_14A.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">
        
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="fw-bold"><i class="fa-solid fa-users me-2 text-primary"></i>Gestión de Usuarios</h2>
            <a href="AltaUsuario.aspx" class="btn btn-primary fw-bold rounded-pill px-4 shadow-sm">
                <i class="fa-solid fa-plus me-2"></i>Nuevo Usuario
            </a>
        </div>
        <p class="text-muted mb-4">Administración de clientes, administradores y estados de cuenta.</p>

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0 overflow-hidden rounded-4">
                <div class="table-responsive">
                    <asp:GridView ID="dgvUsuarios" runat="server" CssClass="table table-striped table-hover mb-0 align-middle" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="dgvUsuarios_RowCommand" GridLines="None" BorderStyle="None">
                        <Columns>
                            
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark py-3" />
                            <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark py-3" />
                            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark py-3" />
                            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="20%" HeaderStyle-CssClass="table-dark py-3" />
                            
                            <asp:TemplateField HeaderText="Rol" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark py-3 text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <span class="badge bg-secondary fw-normal px-3 py-2 rounded-pill"><%# Eval("Rol") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Estado" ItemStyle-Width="10%" HeaderStyle-CssClass="table-dark py-3 text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <%# Convert.ToBoolean(Eval("Activo")) ? "<span class='badge bg-success bg-opacity-75 fw-normal px-3 py-2 rounded-pill'><i class='fa-solid fa-check me-1'></i>Activo</span>" : "<span class='badge bg-danger bg-opacity-75 fw-normal px-3 py-2 rounded-pill'><i class='fa-solid fa-xmark me-1'></i>Inactivo</span>" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="10%" HeaderStyle-CssClass="table-dark py-3 text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-warning text-dark shadow-sm me-1 rounded-3" ToolTip="Editar Usuario">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger shadow-sm rounded-3" ToolTip="Eliminar Usuario">
                                        <i class="fa-solid fa-trash"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        
    </div>
</asp:Content>