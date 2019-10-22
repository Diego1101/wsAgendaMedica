<%-- 
    Document   : jspRegistrarPaciente
    Created on : 17-oct-2019, 15:42:56
    Author     : volal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String res=request.getParameter("x");
    String rut=request.getParameter("ruta");
    if(res!=null&&res!=""){
        out.println("<script>alert('entre')window.opener.document.getElementById('tvalor').value="+rut+";window.close();</script>");
        request.getSession().setAttribute("foto", rut);
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
                    <input type="file" name="archivo" accept="text/plain;image/png" class="form-control">
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