<%@ Page Title="Gestión de Canchas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Canchas.aspx.cs" Inherits="TPC_Equipo_14A.Canchas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">
        
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="fw-bold text-dark">Gestión de Canchas</h2>
            <a href="AltaCancha.aspx" class="btn btn-primary fw-bold shadow-sm rounded-pill px-4">
                <i class="fa-solid fa-plus me-1"></i> Nueva Cancha
            </a>
        </div>

        <div class="card shadow-sm mt-3 border-0 rounded-4 overflow-hidden">
            <div class="card-body p-0">
                <asp:GridView ID="dgvCanchas" runat="server" CssClass="table table-striped table-hover mb-0 align-middle text-center" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="dgvCanchas_RowCommand" GridLines="None">
                    <Columns>
                        
                        <asp:BoundField DataField="Nombre" HeaderText="Cancha" ItemStyle-Width="25%" HeaderStyle-CssClass="table-dark text-start ps-4" ItemStyle-CssClass="text-start ps-4 fw-bold" />
                        
                        <asp:TemplateField HeaderText="Deporte" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <span class="badge bg-primary text-white px-3 py-2 rounded-pill shadow-sm">
                                    <i class="fa-solid fa-trophy me-1"></i><%# Eval("Deporte.Nombre") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="PrecioBase" HeaderText="Precio Base" DataFormatString="{0:C}" ItemStyle-Width="15%" HeaderStyle-CssClass="table-dark" />
                        
                        <asp:TemplateField HeaderText="Estado" ItemStyle-Width="25%" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:Label ID="lblActiva" runat="server" 
                                    CssClass='<%# Convert.ToBoolean(Eval("Activa")) ? "badge bg-success" : "badge bg-danger" %>' 
                                    Text='<%# Convert.ToBoolean(Eval("Activa")) ? "Activa" : "Inactiva" %>'>
                                </asp:Label>
                                
                                <asp:Label ID="lblMantenimiento" runat="server" 
                                    Visible='<%# Convert.ToBoolean(Eval("EnMantenimiento")) %>'
                                    CssClass="badge bg-warning text-dark ms-1" 
                                    Text="Mantenimiento">
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="20%" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' Text="Editar" CssClass="btn btn-sm btn-warning fw-bold shadow-sm me-1 rounded-pill px-3" />
                                <asp:Button ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' Text="Eliminar" CssClass="btn btn-sm btn-danger fw-bold shadow-sm rounded-pill px-3" OnClientClick="return confirm('¿Estás seguro de eliminar esta cancha?');" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>