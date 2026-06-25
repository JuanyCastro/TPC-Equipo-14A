<%@ Page Title="Reservar Turno" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="TPC_Equipo_14A.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">
        <h2 class="fw-bold text-center mb-4">Elegí tu turno</h2>

        <asp:UpdatePanel ID="upTurnos" runat="server">
            <ContentTemplate>
                
                <div class="d-flex justify-content-center mb-5">
                    <ul class="nav nav-pills gap-2 shadow-sm p-2 bg-white rounded-pill">
                        <asp:Repeater ID="rptDeportes" runat="server" OnItemCommand="rptDeportes_ItemCommand">
                            <ItemTemplate>
                                <li class="nav-item">
                                    <asp:LinkButton ID="btnDeporte" runat="server" 
                                        CommandName="SeleccionarDeporte" 
                                        CommandArgument='<%# Eval("Id") %>' 
                                        CssClass='<%# Convert.ToInt32(Eval("Id")) == IdDeporteSeleccionado ? "nav-link active rounded-pill fw-bold px-4" : "nav-link text-dark rounded-pill fw-bold px-4" %>'>
                                        <i class="fa-solid fa-trophy me-2"></i><%# Eval("Nombre") %>
                                    </asp:LinkButton>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <div class="row g-4 mb-5">
                    <asp:Repeater ID="rptCanchas" runat="server" OnItemCommand="rptCanchas_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-4">
                                <div class='<%# Convert.ToInt32(Eval("Id")) == IdCanchaSeleccionada ? "card h-100 shadow border-primary border-2 rounded-4" : "card h-100 shadow-sm border-0 rounded-4" %>'>
                                    
                                    <img src='<%# "https://placehold.co/600x200/0f172a/ffffff?text=" + Eval("Nombre").ToString().Replace(" ", "+") %>' class="card-img-top rounded-top-4" alt="Cancha" style="height: 200px; object-fit: cover;">
                                    
                                    <div class="card-body">
                                        <h5 class="card-title fw-bold"><%# Eval("Nombre") %></h5>
                                        <div class="d-flex flex-wrap gap-2 mb-3 mt-2">
                                            <span class="badge bg-light text-dark border"><i class="fa-solid fa-layer-group text-info me-1"></i><%# Eval("Superficie") %></span>
                                            <span class="badge bg-light text-dark border"><i class="fa-solid fa-money-bill text-success me-1"></i>$<%# Eval("PrecioBase", "{0:0}") %></span>
                                        </div>
                                        
                                        <asp:LinkButton ID="btnSeleccionarCancha" runat="server" 
                                            CommandName="SeleccionarCancha" 
                                            CommandArgument='<%# Eval("Id") + "|" + Eval("PrecioBase") %>' 
                                            CssClass='<%# Convert.ToInt32(Eval("Id")) == IdCanchaSeleccionada ? "btn btn-primary w-100 fw-bold rounded-pill" : "btn btn-outline-primary w-100 fw-bold rounded-pill" %>'>
                                            <%# Convert.ToInt32(Eval("Id")) == IdCanchaSeleccionada ? "Cancha Seleccionada" : "Seleccionar Cancha" %>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <asp:Panel ID="pnlReserva" runat="server" Visible="false" CssClass="card shadow-sm border-0 rounded-4 p-4 mt-4 bg-light">
                    <h4 class="fw-bold mb-4 border-bottom pb-2">Disponibilidad</h4>
                    
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <label class="form-label fw-bold">Elegí la fecha:</label>
                            <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control form-control-lg rounded-3" AutoPostBack="true" OnTextChanged="txtFecha_TextChanged"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-8 mb-4">
                            <label class="form-label fw-bold">Horarios disponibles:</label>
                            <div class="d-flex flex-wrap gap-2">
                                <asp:Repeater ID="rptHorarios" runat="server" OnItemCommand="rptHorarios_ItemCommand">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnHora" runat="server" 
                                            CommandName="SeleccionarHora" 
                                            CommandArgument='<%# Container.DataItem %>' 
                                            CssClass='<%# HorasSeleccionadas.Contains(Container.DataItem.ToString()) ? "btn btn-primary fw-bold rounded-pill px-4 shadow-sm" : "btn btn-outline-secondary bg-white fw-bold rounded-pill px-4" %>'>
                                            <%# Container.DataItem.ToString() %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Label ID="lblSinHorarios" runat="server" Visible="false" CssClass="text-danger fw-bold mt-2">No hay horarios disponibles para esta fecha.</asp:Label>
                            </div>
                        </div>
                    </div>

                    <asp:Panel ID="pnlCheckout" runat="server" Visible="false" CssClass="alert alert-info mt-4 p-4 rounded-4 shadow-sm border-0">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h5 class="mb-2 fw-bold text-dark"><i class="fa-solid fa-receipt me-2"></i>Resumen de tu reserva</h5>
                                <p class="mb-1 text-dark fs-6">Precio total de la cancha: <strong>$<asp:Label ID="lblPrecioTotal" runat="server"></asp:Label></strong></p>
                                <p class="mb-0 text-primary fs-5 fw-bold">Seña requerida (20%): <strong>$<asp:Label ID="lblPrecioSena" runat="server"></asp:Label></strong></p>
                            </div>
                            <div class="col-md-4 d-flex justify-content-md-end mt-3 mt-md-0">
                                <asp:Button ID="btnSeñar" runat="server" Text="Señar con MercadoPago" CssClass="btn btn-primary btn-lg fw-bold rounded-pill px-4 shadow" OnClick="btnSeñar_Click" />
                            </div>
                        </div>
                    </asp:Panel>

                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>