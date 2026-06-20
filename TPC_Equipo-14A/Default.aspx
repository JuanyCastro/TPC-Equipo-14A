<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_14A.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .banner {
            border-radius: 20px; 
            overflow: hidden;
        }
        .carousel-item img {
            object-fit: cover;
            height: 450px;
        }
    </style>

    <div class="container mt-4">
        <div id="carruselPromos" class="carousel slide banner shadow" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carruselPromos" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carruselPromos" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carruselPromos" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://www.saltacomparativa.com.ar/public/images/noticias/68335-la-scaloneta-sigue-siendo-la-mejor-seleccion-del-mundo.webp" class="d-block w-100" alt="Promo Selección">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-75 rounded-3 p-3 mb-4 mx-auto" style="max-width: 600px;">
                        <h2 class="fw-bold text-white text-uppercase">Jugá como un Campeón</h2>
                        <p class="fs-6 text-light mb-0">Reservá tu cancha y sentite en la final del mundo.</p>
                    </div>
                </div>
                
                <div class="carousel-item">
                    <img src="https://statics.diariomendoza.com.ar/2022/12/63a9f718988b1.jpg" class="d-block w-100" alt="Promo Cumpleaños">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-75 rounded-3 p-3 mb-4 mx-auto" style="max-width: 600px;">
                        <h2 class="fw-bold text-warning text-uppercase">Promo Cumpleaños</h2>
                        <p class="fs-6 text-light mb-0">Alquilá 3 horas seguidas y el tercer tiempo va por nuestra cuenta.</p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img src="https://a2.espncdn.com/combiner/i?img=%2Fphoto%2F2025%2F0704%2Fr1514813_1000x563_16%2D9.jpg   " class="d-block w-100" alt="Reserva Rápida">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-75 rounded-3 p-3 mb-4 mx-auto" style="max-width: 600px;">
                        <h2 class="fw-bold text-info text-uppercase">Turnos Fijos Disponibles</h2>
                        <p class="fs-6 text-light mb-0">Asegurá tu partido de todas las semanas. Seña online en segundos.</p>
                    </div>
                </div>
            </div>
            
            <button class="carousel-control-prev" type="button" data-bs-target="#carruselPromos" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carruselPromos" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
        
        <div class="text-center mt-5 mb-5">
            <a href="Turnos.aspx" class="btn btn-primary btn-lg rounded-pill px-5 py-3 fw-bold shadow-sm" style="font-size: 1.2rem;">
                <i class="fa-regular fa-calendar-check me-2"></i> Reservar ahora
            </a>
        </div>
    </div>
</asp:Content>