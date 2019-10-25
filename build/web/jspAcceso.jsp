<%-- 
    Document   : jspAcceso
    Created on : 15/10/2019, 08:32:53 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="Welcome">
    <!--- Start Carousel -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100 img-fluid img-slider" src="images/slider1.jpg" alt="First slide">
                <div class="carousel-caption">
                    <%
                        if (request.getAttribute("es") != null) {
                    %>

                    <div id="error" style="text-align: center; color: red; font-size: 1.2rem; font-weight: bold;"><%=request.getAttribute("es")%></div>
                    <%
                        }
                    %>

                    <h2>Iniciar sesion</h2>
                    <div class="col-md-6" style="margin: auto">
                        <form action="paciente.do" method="post" id="acceso" name="acceso">
                            <div class="form-row mb-3">

                                <div class="col-md-6">
                                    <input type="text" id="txtUsuario" name="txtUsuario" value="" class="form-control" placeholder="Usuario" required/>

                                </div>
                                <div class="col-md-6">
                                    <input type="password" id="txtContra" name="txtContra" value="" class="form-control" placeholder="Contraseña" required>
                                </div>
                            </div>
                            <input type="submit" id="btnIniciar" name="btnIniciar" value="Aceptar" class="btn btn-secondary btn-block">
                            <input type="hidden" id="origen" name="origen" value="acceso">
                            <div>
                                No tienes cuenta? Crea una <a href="#">aquí</a>
                            </div> 
                        </form>
                    </div>

                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100 img-fluid img-slider" src="images/slider2.jpg" alt="Second slide">
                <div class="carousel-caption">
                    <h2>Traditional Italian Cuisine</h2>
                    <p>...</p>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100 img-fluid img-slider" src="images/slider3.jpg" alt="Third slide">
                <div class="carousel-caption">
                    <h2>Selected Products</h2>
                    <p>...</p>
                </div>
            </div>
        </div>

    </div>
</div>
<!--- End of Carousel -->
