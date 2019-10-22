<%-- 
    Document   : jspAgendarCita
    Created on : 20-oct-2019, 13:52:15
    Author     : volal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id").toString());
    } else {
        id = 0;
    }

    ResultSet res = (ResultSet)request.getAttribute("resSet");
%>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100 img-fluid img-slider" src="images/banner3.jpg" alt="First slide">
            <div class="carousel-caption"  style="justify-content: center; background: #fff; border-radius: 20px; box-shadow: 0 5px #ccc;">
                <%
                    if (request.getAttribute("es") != null) {
                %>
                <div id="error" style="text-align: center; color: red; font-size: 1.2rem; font-weight: bold;"><%=request.getAttribute("es")%></div>
                <%
                    }
                %>
                <h2>Haz una cita</h2>
                <div class="container mt-5" style="justify-content: center;">
                    <form  id="obtenerEsp" name="obtenerEsp">
                        <select class="form-control" name="selEspecialidad" id="selEspecialidad"><option value="0">Elige una especialidad</option>
                    <%  
                        int lel=0;
                        res.beforeFirst();
                        while (res.next()){
                            lel=lel+1;
                            out.println("<option value='"+res.getString(1)+"'>"+res.getString(2)+"</option>");
                        }
                    %>
                        </select>
                        <!--<input type="submit" class="btn btn-secondary btn-block" value="Ver especialidades">-->
                        <input type="hidden" id="origen" name="origen" value="obtenerEsp">
                    </form>
                    <div class="container mt-5" style="justify-content: center;">
                        <form action="espdoc.do" method="post" id="listarDoc" name="listarDoc">

                            <select name="selDoctores">
                                <option value="0">Selecciona el doctor</option>
                        <%  
                            res.beforeFirst();
                            while (res.next()){
                                out.println("<option value='"+res.getString(1)+"'>"+res.getString(2)+"</option>");
                            }
                        %>
                            </select>
                            <input type="submit" id="btnDoctor" name="btnDoctor" value="Ver doctores" class="btn btn-secondary">
                            <input type="hidden" id="origen" name="origen" value="listarDoc">
                        </form>
                    </div>
                    <div class="container mt-5" style="justify-content: center;">
                        <form action="paciente.do" method="post" id="agendaCita" name="agendaCita">
                            <div class="form-row mb-3" name="dac" style="margin-left: 35%">
                                <div class="col-md-6" name="dy1">
                                    <select name="y" id="y">
                                        <option value="0">Año</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                    </select>
                                </div>
                                <div class="col-md-6" name="dm1">
                                    <select name="m" id="m" onchange="cambiaDia()">
                                        <option value="0">Mes</option>
                                        <option value="1">Enero</option>
                                        <option value="2">Febrero</option>
                                        <option value="3">Marzo</option>
                                        <option value="4">Abril</option>
                                        <option value="5">Mayo</option>
                                        <option value="6">Junio</option>
                                        <option value="7">Julio</option>
                                        <option value="8">Agosto</option>
                                        <option value="9">Septiembre</option>
                                        <option value="10">Octubre</option>
                                        <option value="11">Noviembre</option>
                                        <option value="12">Diciembre</option>
                                    </select>
                                </div>
                                <div class="col-md-6" name="dd1">
                                    <select name="d" id="d">
                                        <option>Día</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row mb-3" name="dhc" style="margin-left: 35%">
                                <div class="col-md-6" name="dh">
                                    <select name="h" id="h">
                                        <option value="9" >09:00 a.m.</option>
                                        <option value="10">10:00 a.m.</option>
                                        <option value="11">11:00 a.m.</option>
                                        <option value="12">12:00 p.m.</option>
                                        <option value="13">01:00 p.m.</option>
                                        <option value="14">02:00 p.m.</option>
                                        <option value="15">03:00 p.m.</option>
                                        <option value="16">04:00 p.m.</option>
                                        <option value="17">05:00 p.m.</option>
                                        <option value="18">06:00 p.m.</option>
                                        
                                    </select>
                                </div>
                            </div>
                            
                            <input type="submit" name="btnRegCita" id="btnRegCita">
                            <input type="hidden" id="origen" name="origen" value="agendaCita">
                        </form>
                        <script>
                            //Dias por mes
                            var m1 = new Array("Día","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
                            var m2 = new Array("Día","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28");
                            var m3 = new Array("Día","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
                            //Función cambia días
                            function cambiaDia(){
                                var c;
                                //Se toma el valor correspondiente
                                c = document.agendaCita.dac.dm1.m[document.agendaCita.dac.dm1.m.selectedIndex].value;
                                //Se revisa si está definido el select
                                if(c!==0){
                                    if(c==4 || c==6 || c==9 || c==11)
                                    //Selecciona cada tipo de mes
                                    ops = eval("m1");
                                    num_op = ops.length;
                                    document.agendaCita.dac.dd1.d.length=num_op;
                                    for (var i = 0; i < max; i++) {
                                        document.agendaCita.dac.dd1.d.options[i].value=ops[i];
                                        document.agendaCita.dac.dd1.d.options[i].text=ops[i];
                                    }
                                    if(c==4 || c==6 || c==9 || c==11)
                                    //Selecciona cada tipo de mes
                                    ops = eval("m3");
                                    num_op = ops.length;
                                    document.agendaCita.dac.dd1.d.length=num_op;
                                    for (var i = 0; i < max; i++) {
                                        document.agendaCita.dac.dd1.d.options[i].value=ops[i];
                                        document.agendaCita.dac.dd1.d.options[i].text=ops[i];
                                    }
                                    if(c==2)
                                    //Selecciona cada tipo de mes
                                    ops = eval("m2");
                                    num_op = ops.length;
                                    document.agendaCita.dac.dd1.d.length=num_op;
                                    for (var i = 0; i < max; i++) {
                                        document.agendaCita.dac.dd1.d.options[i].value=ops[i];
                                        document.agendaCita.dac.dd1.d.options[i].text=ops[i];
                                    }
                                }
                                }
                                else{
                                        //Sin seleccion
                                        document.agendaCita.dac.dd1.d.length=1;
                                        document.agendaCita.dac.dd1.d.options[0].value="0";
                                        document.agendaCita.dac.dd1.d.options[0].text="Día";
                                    }
                                    document.agendaCita.dac.dd1.d.options[0].selected=true;
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                            
