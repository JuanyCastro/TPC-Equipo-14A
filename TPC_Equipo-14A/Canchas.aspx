<%@ Page Title="Gestión de Canchas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Canchas.aspx.cs" Inherits="TPC_Equipo_14A.Canchas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">
        
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="fw-bold"><i class="fa-solid fa-map-location-dot me-2 text-primary"></i>Gestión de Canchas</h2>
            <a href="AltaCancha.aspx" class="btn btn-primary fw-bold rounded-pill px-4 shadow-sm">
                <i class="fa-solid fa-plus me-2"></i>Nueva Cancha
            </a>
        </div>
        <p class="text-muted mb-4">Administración de canchas, precios y estado de mantenimiento.</p>

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0 overflow-hidden rounded-4">
                <div class="table-responsive">
                    <asp:GridView ID="dgvCanchas" runat="server" CssClass="table table-striped table-hover mb-0 align-middle text-center" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="dgvCanchas_RowCommand" GridLines="None" BorderStyle="None">
                        <Columns>
                            
                            <asp:BoundField DataField="Nombre" HeaderText="Cancha" ItemStyle-Width="25%" HeaderStyle-CssClass="table-dark py-3 text-start ps-4" ItemStyle-CssClass="text-start ps-4 fw-bold text-dark" />
                            
                            <asp:TemplateField HeaderText="Deporte" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark py-3">
                                <ItemTemplate>
                                    <span class="badge bg-primary text-white px-3 py-2 rounded-pill shadow-sm fw-normal">
                                        <i class="fa-solid fa-trophy me-1"></i><%# Eval("Deporte.Nombre") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="PrecioBase" HeaderText="Precio Base" DataFormatString="{0:C}" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark py-3" ItemStyle-CssClass="fw-bold text-success" />
                            
                            <asp:TemplateField HeaderText="Estado" ItemStyle-Width="25%" HeaderStyle-CssClass="table-dark py-3">
                                <ItemTemplate>
                                    <%# Convert.ToBoolean(Eval("Activa")) ? "<span class='badge bg-success bg-opacity-75 fw-normal px-3 py-2 rounded-pill me-1'><i class='fa-solid fa-check me-1'></i>Activa</span>" : "<span class='badge bg-danger bg-opacity-75 fw-normal px-3 py-2 rounded-pill me-1'><i class='fa-solid fa-xmark me-1'></i>Inactiva</span>" %>
                                    
                                    <%# Convert.ToBoolean(Eval("EnMantenimiento")) ? "<span class='badge bg-warning text-dark fw-normal px-3 py-2 rounded-pill shadow-sm'><i class='fa-solid fa-triangle-exclamation me-1'></i>Mantenimiento</span>" : "" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="20%" HeaderStyle-CssClass="table-dark py-3 text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-warning text-dark shadow-sm me-1 rounded-3" ToolTip="Editar Cancha">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger shadow-sm rounded-3" ToolTip="Eliminar Cancha" OnClientClick="return confirm('¿Estás seguro de eliminar esta cancha?');">
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