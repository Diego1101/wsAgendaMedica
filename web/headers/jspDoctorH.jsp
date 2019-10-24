<%-- 
    Document   : jspDoctorH
    Created on : 15/10/2019, 10:25:54 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!---Start navigation Bar -->
<style>
    
    .nav-item a{
        padding: 0px;
        color: #ccc;
    }
    
    .nav-item ul{
        display: none;
    }
    
    .nav-item:hover{
        background: #ddd;
        display: block;
        border-radius: 10px;
    }
    
    .nav-item:hover > ul{
        position: absolute;
        display: block;
    }
    
    .nav-item ul li{
        background: #fff;
        border-width: 1px;
        padding: 10px 10px 10px 5px;
        text-decoration: none;
        border-color: #cdcdcd;
        display: block;
    }
    
    .nav-item ul li a{
        text-decoration: none;
    }
    
    .nav-item ul li:hover{
        background: #fafafa;
    }
    
</style>
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
                            <a class="nav-link" href="index.jsp?pag=jspCitasD.jsp">Citas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp?pag=jspMedicos.jsp">Medicos</a>
                        </li>
                        <li class="nav-item"<a>Reportes</a>
                            <ul>
                                <li><a class="nav-link" href="index.jsp?pag=jspRepPaciente.jsp">Pacientes</a></li>
                                <li><a class="nav-link" href="index.jsp?pag=jspRepDoctores.jsp">Doctores</a></li>
                                <li><a class="nav-link" href="index.jsp?pag=jspRepCCancel.jsp">Citas canceladas</a></li>
                                <li><a class="nav-link" href="index.jsp?pag=jspRepCConf.jsp">Citas confirmadas</a></li>
                            </ul>
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
            