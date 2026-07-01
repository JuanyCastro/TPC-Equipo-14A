<%@ Page Title="Gestión de Deportes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Deportes.aspx.cs" Inherits="TPC_Equipo_14A.Deportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="fw-bold text-dark"><i class="fa-solid fa-trophy me-2 text-primary"></i>Gestión de Deportes</h2>
            <a href="AltaDeporte.aspx" class="btn btn-primary fw-bold rounded-pill px-4 shadow-sm btn-hover-scale"><i class="fa-solid fa-plus me-2"></i>Nuevo Deporte</a>
        </div>
        
        <div class="card shadow-sm border-0 rounded-4 overflow-hidden">
            <div class="table-responsive">
                <asp:GridView ID="dgvDeportes" runat="server" CssClass="table table-hover table-borderless align-middle mb-0 text-center table-custom-row" 
                    AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="dgvDeportes_RowCommand" GridLines="None">
                    <HeaderStyle CssClass="table-custom-header text-center" />
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Deporte" ItemStyle-Width="40%" ItemStyle-CssClass="fw-bold text-dark" />
                        <asp:TemplateField HeaderText="Duración" ItemStyle-Width="25%">
                            <ItemTemplate>
                                <span class="badge bg-info bg-opacity-25 text-dark px-3 py-2 rounded-pill shadow-sm"><i class="fa-regular fa-clock me-1 text-primary"></i><%# Eval("DuracionBloqueMinutos") %> min</span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado" ItemStyle-Width="15%">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Activo")) ? "<span class='badge bg-success px-3 py-2 rounded-pill shadow-sm'><i class='fa-solid fa-check me-1'></i>Activo</span>" : "<span class='badge bg-danger px-3 py-2 rounded-pill shadow-sm'><i class='fa-solid fa-xmark me-1'></i>Inactivo</span>" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-warning fw-bold text-dark shadow-sm me-1 rounded-pill px-3 btn-hover-scale"><i class="fa-solid fa-pen-to-square"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger fw-bold shadow-sm rounded-pill px-3 btn-hover-scale" OnClientClick="return confirm('¿Eliminar deporte?');"><i class="fa-solid fa-trash"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>