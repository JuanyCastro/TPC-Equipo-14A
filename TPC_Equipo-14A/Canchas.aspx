<%@ Page Title="Canchas" Language="C#" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Nuestras Canchas</h2>
        <p class="text-muted">Listado de instalaciones disponibles para Fútbol y Pádel.</p>
        
        <table class="table table-striped table-hover mt-3">
            <thead class="table-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Deporte</th>
                    <th>Precio Base</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Cancha Fútbol 5 - Sintético 1</td>
                    <td>Fútbol 5</td>
                    <td>$12000.00</td>
                    <td><span class="badge bg-success">Activa</span></td>
                </tr>
                <tr>
                    <td>Cancha Fútbol 7 - Césped Natural</td>
                    <td>Fútbol 7</td>
                    <td>$18000.00</td>
                    <td><span class="badge bg-success">Activa</span></td>
                </tr>
                <tr>
                    <td>Pádel Premium - Blindex 1</td>
                    <td>Pádel</td>
                    <td>$9000.00</td>
                    <td><span class="badge bg-success">Activa</span></td>
                </tr>
                <tr>
                    <td>Pádel Estándar - Muro 2</td>
                    <td>Pádel</td>
                    <td>$7500.00</td>
                    <td><span class="badge bg-warning text-dark">En Mantenimiento</span></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>