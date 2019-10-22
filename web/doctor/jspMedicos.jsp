<%-- 
    Document   : jspMedicos
    Created on : 18/10/2019, 02:08:38 PM
    Author     : diego
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<form action="doctor.do" method="post" id="medicos" name="medicos">
    <input type="hidden" id="org" name="org" value="infoMedicos">
</form>

<%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("medicos").submit();
</script>

<%
    }
%>


<div>
    <img class="d-block w-100 img-fluid img-slider" src="images/banner1.jpg" alt="First slide">
    <div class="carousel-caption"  style="justify-content: center; right: 5%; left: 5%;">
        <%
            if (request.getAttribute("es") != null) {
        %>
        <div id="error" style="text-align: center; color: #cab913; font-size: 1.2rem; font-weight: bold;"><%=request.getAttribute("es")%></div>
        <%
            }
        %>
        <h2>Registro de doctores</h2>

        <form action="doctor.do" method="post">
            <div class="row">
                <div class="col-6">
                    <div class="container mt-5" style="justify-content: center;">

                        <div class="form-row mb-3">
                            <input type="text" id="txtNombre" name="txtNombre" value="" placeholder="Nombre(s)" class="form-control mr-1" style="width: 49%" required/>

                            <input type="text" id="txtApellidos" name="txtApellidos" value="" placeholder="Apellido(s)" class="form-control" style="width: 49%" required/>

                        </div>
                        <div class="form-row mb-3"> 
                            <input type="text" id="txtUser" name="txtUser" value="" placeholder="Usuario" class="form-control" required/>

                        </div>

                        <div class="form-row mb-3">
                            <input type="text" id="txtCorreo" name="txtCorreo" value="" placeholder="Correo electrónico" class="form-control" required/>

                        </div>
                        <div class="form-row mb-3">
                            <input type="password" id="txtPass" name="txtPass" value="" placeholder="Contraseña" class="form-control" required>

                        </div>
                        <div class="form-row mb-3">
                            <input type="textarea" style="height: 40px;" id="txtEstudios" name="txtEstudio" value="" placeholder="Estudios" class="form-control" required/>
                        </div>
                        <div class="form-row mb-3">
                            <select class=" custom-select" id="dpEspecialidad" name="dpEspecialidad" required>
                                <%
                                    if (request.getAttribute("esp") != null) {
                                        List<String[]> esp = (List<String[]>) request.getAttribute("esp");
                                        for (String[] aux : esp) {
                                %>
                                <option value="<%=aux[0]%>"><%=aux[1]%></option>
                                <%
                                        }
                                    }

                                %>

                            </select>
                        </div>
                    </div>

                </div>
                <div class="col-6">
                    <div class="container mt-5" style="justify-content: center;">
                        <h3>Horario</h3>
                        <div class="horario">
                            <table class="mb-2">
                                <tr>
                                    <td></td>
                                    <td>
                                        Lunes
                                    </td>
                                    <td>
                                        Martes
                                    </td>
                                    <td>
                                        Miercoles
                                    </td>
                                    <td>
                                        Jueves
                                    </td>
                                    <td>
                                        Viernes
                                    </td>
                                    <td>
                                        Sabado
                                    </td>
                                </tr>
                                <%                                    for (int i = 9; i <= 18; i++) {
                                %>

                                <tr>
                                    <td>
                                        <%=i%>:00
                                    </td>
                                    <td onclick="cambiar('l<%=i%>')" id="tl<%=i%>">
                                        <input type="hidden" id="l<%=i%>" name="l<%=i%>" value="0">
                                    </td>
                                    <td onclick="cambiar('m<%=i%>')" id="tm<%=i%>">
                                        <input type="hidden" id="m<%=i%>" name="m<%=i%>" value="0">
                                    </td>
                                    <td onclick="cambiar('i<%=i%>')" id="ti<%=i%>">
                                        <input type="hidden" id="i<%=i%>" name="i<%=i%>" value="0">
                                    </td>
                                    <td onclick="cambiar('j<%=i%>')" id="tj<%=i%>">
                                        <input type="hidden" id="j<%=i%>" name="j<%=i%>" value="0">
                                    </td>
                                    <td onclick="cambiar('v<%=i%>')" id="tv<%=i%>">
                                        <input type="hidden" id="v<%=i%>" name="v<%=i%>" value="0">
                                    </td>
                                    <td onclick="cambiar('s<%=i%>')" id="ts<%=i%>">
                                        <input type="hidden" id="s<%=i%>" name="s<%=i%>" value="0">
                                    </td>
                                </tr>
                                <%
                                    }
                                %>

                            </table>
                            <input type="submit" id="btnRegistrar" style="width: 100%; color: black;" name="btnRegistrar" value="Registrar" class="btn btn-primary">
                            <input type="hidden" id="org" name="org" value="regMedico">
                        </div>
                    </div>
                </div>           
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function cambiar(h) {
        if (document.getElementById("t" + h).className === "active") {
            document.getElementById("t" + h).className = "";
            document.getElementById(h).value = "0";
        } else {
            document.getElementById(h).value = "1";
            document.getElementById("t" + h).className = "active"
        }
        //alert(h);
    }
</script>




