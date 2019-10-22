<%-- 
    Document   : jspRegistrarPerfil
    Created on : 24/09/2019, 05:19:39 PM
    Author     : diego
--%>

<%@page import="modelo.clsUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //obtener la instacia de la clase guardada en la session
clsUsuario usu=(clsUsuario)request.getSession().getAttribute("usuario");
String estado=(String)request.getSession().getAttribute("edo");
request.getSession().setAttribute("edo", "");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .grp{
                padding: 10px;
                
            }
            
            .grp span{
                display: flex;
            }
            
            .err{
                color: red;
            }
            
            .success{
                color: green;
            }
            
        </style>
    </head>
    <body>
        <h1>Modificar datos</h1>
        <div style="margin-left: 50px;">
            
            <div id="res">
            </div>
        <form action="procesador.do" method="post" id="frmEd" name="frmEd">
            
            <div class="grp">
                <div>
                    <img src="./IMG/<%= usu.getFoto()%>" width="150" heigth="150">
                </div>
                <input type="file" name="fluImage" id="fluImage"/>
            </div>
            
            <div class="grp">
                <span>Usuario</span>
                <input type="text" name="txtUsuario" id="txtUsuario" value="<%= usu.getUsuario()%>" readonly="readonly"/>
            </div>
            
            <div class="grp">
                <span>Nombre</span>
                <input type="text" name="txtNombre" id="txtNombre" value="<%=usu.getNombre()%>"/>
            </div>
            
            <div class="grp">
                <span>Apellido</span>
                <input type="text" name="txtApellido" id="txtApellido" value="<%=usu.getAp()%>"/>
            </div>
            
            <div class="grp">
                <span>Alias</span>
                <input type="text" name="txtAlias" id="txtAlais" value="<%=usu.getAlias()%>" required/>
            </div>
            
            <div class="grp">
                <span>Correo</span>
                <input type="email" name="txtCorreo" id="txtCorreo" value="<%=usu.getCorreo()%>" required/>
            </div>
            
            <div class="grp">
                <input type="hidden" value="<%= estado %>" id="edo" name="edo">                
                <input type="hidden" value="regP" id="pag" name="pag">
                <input type="submit" value="Actualizar" id="btnActualizar" name="btnActualizar">
            </div>
            
        </form>
        </div>        
        <a href="jspAccesoCorrecto.jsp">Regresar</a>
        <script>
            var edo = document.getElementById("edo").value;
            
            if(edo==="true"){
                document.getElementById("res").className="success";
                document.getElementById("res").innerHTML="Datos modificados";
            }
            else if(edo==="err1"){
                document.getElementById("res").className="err";
                document.getElementById("res").innerHTML="El alias ya existe";
                document.getElementById("txtAlias").value="";
            }
            else if(edo===""){
                document.getElementById("res").className="err";
            }
            else{
                //document.getElementById("res").className="err";
                //document.getElementById("res").innerHTML="Error";
            
            }
            </script>
        
    </body>
</html>
