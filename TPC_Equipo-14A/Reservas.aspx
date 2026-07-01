<%@ Page Title="Gestión de Reservas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservas.aspx.cs" Inherits="TPC_Equipo_14A.Reservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold"><i class="fa-solid fa-calendar-days text-primary me-2"></i>Gestión de Reservas</h2>
        </div>

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <asp:GridView ID="dgvReservas" runat="server" CssClass="table table-hover table-borderless align-middle mb-0" 
                        AutoGenerateColumns="false" OnRowCommand="dgvReservas_RowCommand" GridLines="None" DataKeyNames="Id">
                        
                        <HeaderStyle CssClass="bg-light text-dark text-uppercase small fw-bold" />
                        <RowStyle CssClass="border-bottom" />
                        
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="#" />
                            <asp:BoundField DataField="FechaHoraInicio" HeaderText="Fecha y Hora" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                            
                            <asp:TemplateField HeaderText="Cliente">
                                <ItemTemplate>
                                    <span class="fw-bold"><%# Eval("Usuario.Nombre") %> <%# Eval("Usuario.Apellido") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Cancha">
                                <ItemTemplate>
                                    <span class="badge bg-secondary"><%# Eval("Cancha.Deporte.Nombre") %></span>
                                    <span><%# Eval("Cancha.Superficie") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <span class='badge <%# (int)Eval("Estado") == 1 ? "bg-warning text-dark" : 
                                                         (int)Eval("Estado") == 2 ? "bg-success" : 
                                                         (int)Eval("Estado") == 4 ? "bg-danger" : "bg-primary" %>'>
                                        <%# Eval("Estado") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Turno Fijo">
                                <ItemTemplate>
                                    <%# (bool)Eval("EsTurnoFijo") ? "<i class='fa-solid fa-rotate text-info' title='Se repite todas las semanas'></i> Sí" : "No" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CommandName="Confirmar" CommandArgument='<%# Eval("Id") %>' 
                                        CssClass="btn btn-sm btn-outline-success rounded-pill fw-bold" 
                                        Visible='<%# (int)Eval("Estado") == 1 %>'>
                                        <i class="fa-solid fa-check"></i> Confirmar
                                    </asp:LinkButton>
                                    
                                    <asp:LinkButton runat="server" CommandName="Cancelar" CommandArgument='<%# Eval("Id") %>' 
                                        CssClass="btn btn-sm btn-outline-danger rounded-pill fw-bold"
                                        OnClientClick="return confirm('¿Estás seguro que querés cancelar esta reserva?');"
                                        Visible='<%# (int)Eval("Estado") != 4 && (int)Eval("Estado") != 5 %>'>
                                        <i class="fa-solid fa-xmark"></i> Cancelar
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