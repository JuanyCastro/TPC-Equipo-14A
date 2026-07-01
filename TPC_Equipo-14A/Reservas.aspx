<%@ Page Title="Gestión de Reservas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservas.aspx.cs" Inherits="TPC_Equipo_14A.Reservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-dark"><i class="fa-solid fa-calendar-days text-primary me-2"></i>Gestión de Reservas</h2>
        </div>

        <div class="card shadow-sm border-0 rounded-4 overflow-hidden">
            <div class="table-responsive">
                <asp:GridView ID="dgvReservas" runat="server" CssClass="table table-hover table-borderless align-middle mb-0 text-center table-custom-row" 
                    AutoGenerateColumns="false" OnRowCommand="dgvReservas_RowCommand" GridLines="None" DataKeyNames="Id">
                    <HeaderStyle CssClass="table-custom-header text-center" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="#" ItemStyle-CssClass="fw-bold text-muted" />
                        <asp:BoundField DataField="FechaHoraInicio" HeaderText="Fecha y Hora" DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-CssClass="fw-bold" />
                        
                        <asp:TemplateField HeaderText="Cliente">
                            <ItemTemplate>
                                <span class="fw-bold text-primary"><%# Eval("Usuario.Nombre") %> <%# Eval("Usuario.Apellido") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Cancha">
                            <ItemTemplate>
                                <span class="badge bg-secondary bg-opacity-25 text-dark px-3 py-2 rounded-pill shadow-sm"><i class="fa-solid fa-trophy text-primary me-1"></i><%# Eval("Cancha.Deporte.Nombre") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <span class='badge shadow-sm px-3 py-2 rounded-pill <%# (int)Eval("Estado") == 1 ? "bg-warning text-dark" : 
                                                     (int)Eval("Estado") == 2 ? "bg-success" : 
                                                     (int)Eval("Estado") == 4 ? "bg-danger" : "bg-primary" %>'>
                                    <%# Eval("Estado") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="Confirmar" CommandArgument='<%# Eval("Id") %>' 
                                    CssClass="btn btn-sm btn-success rounded-pill fw-bold px-3 shadow-sm me-1 btn-hover-scale" 
                                    Visible='<%# (int)Eval("Estado") == 1 %>'>
                                    <i class="fa-solid fa-check me-1"></i> Confirmar
                                </asp:LinkButton>
                                
                                <asp:LinkButton runat="server" CommandName="Cancelar" CommandArgument='<%# Eval("Id") %>' 
                                    CssClass="btn btn-sm btn-danger rounded-pill fw-bold px-3 shadow-sm btn-hover-scale"
                                    OnClientClick="return confirm('¿Estás seguro que querés cancelar esta reserva?');"
                                    Visible='<%# (int)Eval("Estado") != 4 && (int)Eval("Estado") != 5 %>'>
                                    <i class="fa-solid fa-xmark me-1"></i> Cancelar
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>