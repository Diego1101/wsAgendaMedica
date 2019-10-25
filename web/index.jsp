<%-- 
    Document   : index
    Created on : 15/10/2019, 05:32:46 PM
    Author     : diego
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String pagina = "jspAcceso.jsp";
    String rol="headers/jspPrincipalH.jsp";
    String dir="";
    
    if(request.getSession().getAttribute("rol")!=null){
        rol=request.getSession().getAttribute("rol").toString();
        if(rol.equals("2")){
            rol="headers/jspDoctorH.jsp";
            dir="doctor/";
            pagina = "jspCitasD.jsp";
        }
        else if(rol.equals("1")){
            rol="headers/jspPacienteH.jsp";
            dir="paciente/";
            pagina = "jspAgendarCita.jsp";
        }
        else{
            rol="headers/jspPrincipalH.jsp";
        }
    }
    
    if (request.getAttribute("pag") != null) {
        pagina = request.getAttribute("pag").toString();
    } else if (request.getParameter("pag") != null) {
        pagina = request.getParameter("pag").toString();
    }
    
    
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/styleC.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href='https://fonts.googleapis.com/css?family=Merienda' rel='stylesheet'>
        <link href="css/aos.css" rel="stylesheet">
        

        <title>Agenda medica</title>
        <link rel="icon" href="images/logo.png">
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">

        
        <jsp:include page="<%=rol%>"/>
        <jsp:include page="<%=dir+pagina%>"/>
        
        
        <div class="container">
            <div class="row footer bg-light">
                <div class="col">
                    <p class="text-center">Follow us: <a class="social-icon" href="https://www.facebook.com/rubiktechnologiesShpk/"><i class="fab fa-facebook"></i></a> <a class="social-icon" href="https://www.instagram.com/rubiktechnologies/"><i class="fab fa-instagram"></i></a></p>
                </div>
                <div class="col">
                    <p class="text-center">Copyright &copy; 2018</p>
                </div>
                <div class="col">
                    <p class="text-center">Powered by: <a href="https://rubik-technologies.com/">Rubik Technologies</a></p>
                </div>
            </div>
        </div>
        <footer class="container">
            <div class= "row only-mobile">
                <div class="col-6">
                    <a class="btn btn-primary btn-block text-center" href="tel:++390000000"><i class="fa fa-phone" aria-hidden="true"></i> Call</a>
                </div>
                <div class="col-6">
                    <a class="btn btn-success btn-block text-center" href="https://api.whatsapp.com/send?phone=+390000000"><i class="fab fa-whatsapp" aria-hidden="true"></i> Whatsapp</a>
                </div>
            </div>
        </footer>
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        <script type="text/javascript" src="js/map.js"></script>
        <script type="text/javascript" src="js/smooth-scroll.js"></script>
        <%//<script src="js/aos.js"></script>%>
        <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
        <script type="text/javascript" src="js/image-effect.js"></script>
        <script src="js/util.js"></script>
        <script src="js/main.js"></script>
        </script>

    </body>
</html>
