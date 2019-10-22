<%-- 
    Document   : jspCerrarSesion
    Created on : 15/10/2019, 10:31:57 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.getSession().setAttribute("id", "");
    request.getSession().setAttribute("nombre", "");
    request.getSession().setAttribute("rol", "");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar sesion</title>
    </head>
    <body>
        <script>
            document.location.href="index.jsp";
        </script>
    </body>
</html>
