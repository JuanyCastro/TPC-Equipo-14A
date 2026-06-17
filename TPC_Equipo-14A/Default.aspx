<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_14A.Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container-fluid bg-dark text-white text-center py-5" style="border-radius: 0 0 20px 20px;">
        <div class="py-5">
            <h1 class="display-3 fw-bold text-uppercase" style="letter-spacing: 3px;">Complejo Deportivo</h1>
            <p class="lead mt-3 mx-auto text-light" style="max-width: 600px;">
                Las mejores instalaciones para tu equipo. Elegí tu deporte, reservá tu cancha en segundos y vení a jugar.
            </p>
            <div class="mt-4">
                <a href="Login.aspx" class="btn btn-primary btn-lg px-4 fw-bold">Reservar Ahora</a>
            </div>
        </div>
    </div>

    <div class="container mt-5 pt-4">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <i class="fa-solid fa-stopwatch fa-3x text-primary mb-3"></i>
                <h4 class="fw-bold">Reservas Rápidas</h4>
                <p class="text-muted">Gestioná tus turnos de forma 100% online, sin llamadas ni demoras.</p>
            </div>
            <div class="col-md-4 mb-4">
                <i class="fa-solid fa-futbol fa-3x text-success mb-3"></i>
                <h4 class="fw-bold">Múltiples Deportes</h4>
                <p class="text-muted">Canchas de primer nivel adaptadas para Fútbol, Tenis, Pádel y más.</p>
            </div>
            <div class="col-md-4 mb-4">
                <i class="fa-solid fa-map-location-dot fa-3x text-warning mb-3"></i>
                <h4 class="fw-bold">Excelente Ubicación</h4>
                <p class="text-muted">Instalaciones seguras, vestuarios equipados y estacionamiento privado.</p>
            </div>
        </div>
    </div>

</asp:Content>