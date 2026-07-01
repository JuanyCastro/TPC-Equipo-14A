<%@ Page Title="Mis Reservas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisReservas.aspx.cs" Inherits="TPC_Equipo_14A.MisReservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-dark"><i class="fa-solid fa-ticket text-primary me-2"></i>Mis Reservas</h2>
        </div>

        <div class="card shadow-sm border-0 rounded-4 overflow-hidden">
            <div class="table-responsive">
                <asp:GridView ID="dgvMisReservas" runat="server" CssClass="table table-hover table-borderless align-middle mb-0 text-center table-custom-row" 
                    AutoGenerateColumns="false" OnRowCommand="dgvMisReservas_RowCommand" GridLines="None" DataKeyNames="Id">
                    <HeaderStyle CssClass="table-custom-header text-center" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="#" ItemStyle-CssClass="fw-bold text-muted" />
                        <asp:BoundField DataField="FechaHoraInicio" HeaderText="Fecha y Hora" DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-CssClass="fw-bold text-dark" />
                        
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

                        <asp:TemplateField HeaderText="Acción">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="Pagar" CommandArgument='<%# Eval("Id") %>' 
                                    CssClass="btn btn-sm btn-success rounded-pill fw-bold px-3 shadow-sm btn-hover-scale" 
                                    Visible='<%# (int)Eval("Estado") == 1 %>'>
                                    <i class="fa-solid fa-money-bill-wave me-1"></i> Pagar Seña
                                </asp:LinkButton>
                                <asp:Label runat="server" CssClass="text-muted small" Visible='<%# (int)Eval("Estado") != 1 %>'>
                                    <i class="fa-solid fa-minus"></i>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblSinReservas" runat="server" Visible="false" CssClass="d-block text-center p-5 text-muted fw-bold">
                    <i class="fa-solid fa-folder-open fs-1 mb-3 d-block opacity-50"></i>
                    Todavía no tenés reservas realizadas. ¡Animate a reservar tu primer turno!
                </asp:Label>
            </div>
        </div>
    </div>
</asp:Content>