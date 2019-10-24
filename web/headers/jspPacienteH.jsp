<%-- 
    Document   : jspPacienteH
    Created on : 15/10/2019, 10:22:51 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!---Start navigation Bar -->
<nav class="navbar navbar-expand-lg navbar fixed-top  navbar-light bg-light">
    <a class="navbar-brand" href="index.jsp">
        <img src="images/logo.png" width="50" height="50" class="d-inline-block" alt=""> <%=request.getSession().getAttribute("nombre")%>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Mis citas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.jsp?pag=jspAgendarCita.jsp">Agendar cita</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Mis datos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="jspCerrarSesion.jsp">Cerrar Sesion</a>
            </li>
        </ul>
    </div>
</nav>
<!--- End Navigation Bar -->
