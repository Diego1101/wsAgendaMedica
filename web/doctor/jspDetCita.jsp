<%-- 
    Document   : jspDetCita
    Created on : 17/10/2019, 06:16:12 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id;
    if (request.getParameter("id") != null) {
        id = request.getParameter("id").toString();
    } else {
        id = "No se encontro";
    }

%>
<div class="cd-schedule-modal__event-info">
    <div>
        <h1 class="my-4">
            Nombre paciente
        </h1>
        <h3 class="my-2">
            Coreo electronico
        </h3>

        <h3 class="my-2">
            Telefono
        </h3>

        <p class="my-5">
            Lorem ipsum bla  bla bla
        </p>

        <div style="position: absolute;bottom: 20px;width: 95%;">
            <form action="doctor.do" method="post">
                <input type="hidden" id="org" name="org" value="cancelarCita">
                <input type="hidden" id="id" name="id" value="<%=id%>">
                <input type="submit" id="btnCancelar" name="btnCancelar" value="Cancelar Cita" class="btn  btn-block btn-danger">

            </form>
        </div>

    </div>
</div>