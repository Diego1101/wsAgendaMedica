<%-- 
    Document   : jspRegistro
    Created on : 15/10/2019, 09:00:13 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100 img-fluid img-slider" src="images/slider3.jpg" alt="First slide">
                <div class="carousel-caption"  style="justify-content: center; ">
                    <%
                        if (request.getAttribute("es") != null) {
                    %>
                    <div id="error" style="text-align: center; color: red; font-size: 1.2rem; font-weight: bold;"><%=request.getAttribute("es")%></div>
                    <%
                        }
                    %>
                    <h2>Registro de pacientes</h2>
                    <div class="container mt-5" style="justify-content: center;">
                            <form action="paciente.do" method="post" id="regPaciente" name="regPaciente">
                                <div class="form-row mb-3" style="margin-left: 35%"> 
                                    <div class="col-md-6">
                                        <input type="text" id="txtUser" name="txtUser" value="" placeholder="Usuario" class="form-control" required/>
                                    </div>
                                </div>
                                <div class="form-row mb-3" style="margin-left: 35%">
                                    <div class="col-md-6">
                                        <input type="password" id="txtPass" name="txtPass" value="" placeholder="Contraseña" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-row mb-3" style="margin-left: 35%">
                                     <div class="col-md-6">
                                        <input type="text" id="txtCorreo" name="txtCorreo" value="" placeholder="Correo electrónico" class="form-control" required/>
                                    </div>
                                </div>
                                <div class="form-row mb-3" style="margin-left: 35%">
                                     <div class="col-md-6">
                                        <input type="text" id="txtNombre" name="txtNombre" value="" placeholder="Nombre(s)" class="form-control" required/>
                                    </div>
                                </div>
                                <div class="form-row mb-3" style="margin-left: 35%">
                                    <div class="col-md-6">
                                        <input type="text" id="txtApellidos" name="txtApellidos" value="" placeholder="Apellidos" class="form-control" required/>
                                    </div>
                                </div>
                                <div class="form-row mb-3" style="margin-left: 35%">
                                    <div class="col-md-6">
                                        <input type="textarea" style="height: 40px;" id="txtAlergias" name="txtAlergias" value="" placeholder="Alergias" class="form-control" required/>
                                    </div>
                                </div>
                                <input type="submit" id="btnRegistrar" style="width: 20%" name="btnRegistrar" value="Registrar" class="btn btn-secondary">
                            <input type="hidden" id="origen" name="origen" value="regPaciente">
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>