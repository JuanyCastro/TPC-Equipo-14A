<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_14A._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container text-center mt-5">
            <h1>Bienvenido al Sistema del Complejo Deportivo</h1>
            <p class="lead">Gestión de reservas de Fútbol y Pádel</p>
            <hr />
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Reservas de Hoy</h5>
                            <p class="card-text fs-2">12</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Canchas Activas</h5>
                            <p class="card-text fs-2">4</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>