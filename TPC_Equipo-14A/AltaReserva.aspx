<%@ Page Title="Alta de Reserva" Language="C#" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h3 class="card-title mb-0">Nueva Reserva</h3>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label for="ddlCliente" class="form-label">Cliente Registrado</label>
                                <select id="ddlCliente" class="form-select">
                                    <option selected>Seleccione un cliente...</option>
                                    <option>Juan Pérez (DNI: 12345678)</option>
                                    <option>María Gómez (DNI: 87654321)</option>
                                    <option>Ricardo Fort (DNI: 11111111)</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="ddlDeporte" class="form-label">Deporte</label>
                                <select id="ddlDeporte" class="form-select">
                                    <option>Fútbol 5</option>
                                    <option>Fútbol 7</option>
                                    <option>Pádel</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="ddlCancha" class="form-label">Cancha Disponible</label>
                                <select id="ddlCancha" class="form-select">
                                    <option>Cancha Fútbol 5 - Sintético 1</option>
                                    <option>Pádel Premium - Blindex 1</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="txtFecha" class="form-label">Fecha y Hora de Inicio</label>
                                <input type="datetime-local" id="txtFecha" class="form-control" />
                            </div>

                            <div class="col-md-6 d-flex align-items-end">
                                <div class="form-check mb-2">
                                    <input class="form-check-input" type="checkbox" id="chkTurnoFijo">
                                    <label class="form-check-label" for="chkTurnoFijo">
                                        ¿Es Turno Fijo? (Reserva Semanal)
                                    </label>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <label for="txtObservaciones" class="form-label">Observaciones / Pedidos especiales</label>
                                <textarea id="txtObservaciones" class="form-control" rows="3" placeholder="Ej: Necesitan pecheras..."></textarea>
                            </div>

                            <div class="col-md-12 text-end mt-4">
                                <hr />
                                <button type="button" class="btn btn-secondary">Cancelar</button>
                                <button type="button" class="btn btn-success">Guardar Reserva</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>