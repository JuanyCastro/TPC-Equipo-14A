<%@ Page Title="Reservar Turno" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="TPC_Equipo_14A.Turnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .cancha-card {
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }
        .cancha-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 1rem 3rem rgba(0,0,0,.15) !important;
        }
        .img-wrapper {
            position: relative;
            height: 220px;
            overflow: hidden;
        }
        .img-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 60%;
            background: linear-gradient(to top, rgba(0,0,0,0.8) 0%, rgba(0,0,0,0) 100%);
            z-index: 1;
        }
        .cancha-title {
            position: absolute;
            bottom: 15px;
            left: 20px;
            color: white;
            z-index: 2;
            margin: 0;
            font-size: 1.25rem;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
        }
        .btn-hora {
            transition: all 0.2s ease-in-out;
        }
        .btn-hora:hover {
            transform: scale(1.05);
            background-color: #f8f9fa !important;
        }
        .btn-hora.btn-primary:hover {
            background-color: #0b5ed7 !important;
        }
    </style>

    <div class="container mt-4 mb-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold text-dark mb-2">Elegí tu turno</h2>
            <p class="text-muted">Seleccioná tu deporte favorito, encontrá la cancha ideal y reservá en segundos.</p>
        </div>

        <asp:UpdatePanel ID="upTurnos" runat="server">
            <ContentTemplate>
                <div class="d-flex justify-content-center mb-5">
                    <ul class="nav nav-pills gap-2 shadow-sm p-2 bg-white rounded-pill border">
                        <asp:Repeater ID="rptDeportes" runat="server" OnItemCommand="rptDeportes_ItemCommand">
                            <ItemTemplate>
                                <li class="nav-item">
                                    <asp:LinkButton ID="btnDeporte" runat="server" 
                                        CommandName="SeleccionarDeporte" 
                                        CommandArgument='<%# Eval("Id") %>' 
                                        CssClass='<%# Convert.ToInt32(Eval("Id")) == IdDeporteSeleccionado ? "nav-link active rounded-pill fw-bold px-4 shadow-sm" : "nav-link text-secondary rounded-pill fw-bold px-4 hover-primary" %>'>
                                        <i class="fa-solid fa-trophy me-2"></i><%# Eval("Nombre") %>
                                    </asp:LinkButton>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <div class="row g-4 mb-5 justify-content-center">
                    <asp:Repeater ID="rptCanchas" runat="server" OnItemCommand="rptCanchas_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-6 col-lg-4">
                                <div class='<%# Convert.ToInt32(Eval("Id")) == IdCanchaSeleccionada ? "card h-100 shadow border-primary border-2 rounded-4 cancha-card overflow-hidden" : "card h-100 shadow-sm border-0 rounded-4 cancha-card overflow-hidden" %>'>
                                    
                                    <div class="img-wrapper">
                                        <img src='<%# 
                                            Eval("Deporte.Nombre").ToString().ToLower().Contains("padel") ? "https://alquilatucancha-public.s3.sa-east-1.amazonaws.com/production/public/clubs/bg/90s-padel.jpeg?998869" : 
                                            (Eval("Deporte.Nombre").ToString().ToLower().Contains("5") && Eval("Superficie").ToString().ToLower().Contains("sintetico") ? "https://clubbenhur.com.ar/wp-content/uploads/2024/01/CanchaF5-bis.jpg" : 
                                            (Eval("Deporte.Nombre").ToString().ToLower().Contains("5") && Eval("Superficie").ToString().ToLower().Contains("cemento") ? "https://www.hoysejuega.com/uploads/Modules/ImagenesComplejos/1481.jpg" : 
                                            (Eval("Deporte.Nombre").ToString().ToLower().Contains("5") && Eval("Superficie").ToString().ToLower().Contains("natural") ? "https://www.hoysejuega.com/uploads/Modules/ImagenesComplejos/800_600_grama-sint%C3%A9tica-f%C3%BAtbol-5-civideportes-construcci%C3%B3n-de-campos-deportivos.png" : 
                                            (Eval("Deporte.Nombre").ToString().ToLower().Contains("7") && Eval("Superficie").ToString().ToLower().Contains("sintetico") ? "https://marcopark.mx/wp-content/uploads/2021/09/1.jpeg" : 
                                            (Eval("Deporte.Nombre").ToString().ToLower().Contains("7") && Eval("Superficie").ToString().ToLower().Contains("natural") ? "https://unimatmexico.com.mx/wp-content/uploads/2022/07/pasto-artificial-Futbol-7-851x576.jpg" : 
                                            "https://placehold.co/600x300/0d6efd/ffffff?text=" + Eval("Deporte.Nombre").ToString().Replace(" ", "+"))))))
                                        %>' class="w-100 h-100 object-fit-cover" alt="Cancha">
                                        
                                        <div class="img-overlay"></div>
                                        <h5 class="cancha-title fw-bold"><%# Eval("Nombre") %></h5>
                                    </div>
                                    
                                    <div class="card-body p-4 d-flex flex-column">
                                        <div class="d-flex flex-wrap gap-2 mb-4">
                                            <span class="badge bg-info bg-opacity-10 text-info border border-info-subtle rounded-pill px-3 py-2">
                                                <i class="fa-solid fa-layer-group me-1"></i><%# Eval("Superficie") %>
                                            </span>
                                            <span class="badge bg-success bg-opacity-10 text-success border border-success-subtle rounded-pill px-3 py-2">
                                                <i class="fa-solid fa-money-bill me-1"></i>$<%# Eval("PrecioBase", "{0:0}") %>
                                            </span>
                                        </div>
                                        
                                        <div class="mt-auto">
                                            <asp:LinkButton ID="btnSeleccionarCancha" runat="server" 
                                                CommandName="SeleccionarCancha" 
                                                CommandArgument='<%# Eval("Id") + "|" + Eval("PrecioBase") %>' 
                                                CssClass='<%# Convert.ToInt32(Eval("Id")) == IdCanchaSeleccionada ? "btn btn-primary w-100 fw-bold rounded-pill shadow-sm" : "btn btn-outline-primary w-100 fw-bold rounded-pill btn-hover-scale" %>'>
                                                <%# Convert.ToInt32(Eval("Id")) == IdCanchaSeleccionada ? "<i class='fa-solid fa-circle-check me-2'></i>Seleccionada" : "Elegir esta cancha" %>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <asp:Panel ID="pnlReserva" runat="server" Visible="false">
                    <div class="card shadow-lg border-0 rounded-4 p-4 p-md-5 mt-4 bg-white">
                        <h4 class="fw-bold mb-4 text-dark"><i class="fa-regular fa-calendar-check text-primary me-2"></i>Disponibilidad</h4>
                        
                        <div class="row gx-5">
                            <div class="col-md-4 mb-4 mb-md-0 border-end d-flex flex-column justify-content-center">
                                <label class="form-label fw-bold text-muted mb-3">1. Elegí la fecha</label>
                                <div class="input-group input-group-lg shadow-sm rounded-3">
                                    <span class="input-group-text bg-light border-end-0 text-primary"><i class="fa-solid fa-calendar-days"></i></span>
                                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control border-start-0 text-center fw-bold" AutoPostBack="true" OnTextChanged="txtFecha_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-8 pl-md-4">
                                <label class="form-label fw-bold text-muted mb-3">2. Horarios disponibles</label>
                                <div class="d-flex flex-wrap gap-2">
                                    <asp:Repeater ID="rptHorarios" runat="server" OnItemCommand="rptHorarios_ItemCommand">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnHora" runat="server" 
                                                CommandName="SeleccionarHora" 
                                                CommandArgument='<%# Container.DataItem %>' 
                                                CssClass='<%# HorasSeleccionadas.Contains(Container.DataItem.ToString()) ? "btn btn-primary fw-bold rounded-pill px-4 shadow-sm btn-hora" : "btn bg-white border border-secondary text-secondary fw-bold rounded-pill px-4 shadow-sm btn-hora" %>'>
                                                <%# Container.DataItem.ToString() %>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <asp:Label ID="lblSinHorarios" runat="server" Visible="false" CssClass="alert alert-warning d-block fw-bold mt-2 rounded-3 border-0"><i class="fa-solid fa-triangle-exclamation me-2"></i>No hay horarios disponibles para esta fecha.</asp:Label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlCheckout" runat="server" Visible="false">
                    <div class="card shadow-lg mt-4 border-0 rounded-4 overflow-hidden">
                        <div class="card-body bg-dark text-white p-4 p-md-5">
                            <div class="row align-items-center">
                                <div class="col-md-7 mb-4 mb-md-0">
                                    <h5 class="mb-3 fw-bold text-info"><i class="fa-solid fa-receipt me-2"></i>Resumen de tu reserva</h5>
                                    <div class="d-flex align-items-center mb-2">
                                        <span class="text-light me-2 opacity-75">Precio total de la cancha:</span>
                                        <span class="fs-5 fw-bold">$<asp:Label ID="lblPrecioTotal" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="d-flex align-items-center bg-white bg-opacity-10 p-3 rounded-3 mt-3 border border-secondary border-opacity-25">
                                        <span class="text-light me-auto fw-bold">Seña requerida para confirmar (2%):</span>
                                        <span class="fs-4 fw-bold text-success">$<asp:Label ID="lblPrecioSena" runat="server"></asp:Label></span>
                                    </div>
                                </div>
                                <div class="col-md-5 d-flex justify-content-md-end">
                                    <asp:Button ID="btnSeñar" runat="server" Text="Pagar Seña" CssClass="btn btn-primary btn-lg fw-bold rounded-pill px-5 py-3 shadow-lg w-100 text-center btn-hover-scale" OnClick="btnSeñar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>