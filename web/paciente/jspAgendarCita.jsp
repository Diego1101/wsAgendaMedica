<%-- 
    Document   : jspAgendarCita
    Created on : 20-oct-2019, 13:52:15
    Author     : volal
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<form action="doctor.do" method="post" id="citas" name="citas">
    <input type="hidden" id="org" name="org" value="agendarCitaIn">
</form>

<%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("citas").submit();
</script>

<%
    }
%>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <form action="doctor.do" method="post">
            <div class="carousel-item active">
                <img class="d-block w-100 img-fluid img-slider" src="images/banner1.jpg" alt="First slide">
                <div class="carousel-caption"  style="justify-content: center; background: #fff; border-radius: 20px; box-shadow: 0 5px #ccc; top: 20%;">

                    <%
                        if (request.getAttribute("es") != null) {
                    %>
                    <div id="error" style="text-align: center; color: red; font-size: 1.2rem; font-weight: bold;"><%=request.getAttribute("es")%></div>
                    <%
                        }
                    %>
                    <h2>Haz una cita</h2>
                    <div class="container mt-5" style="justify-content: center;">
                        <select class=" custom-select" id="dpEspecialidad" name="dpEspecialidad">
                            <option value="0">Selecciona la especialidad</option>
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
                        <div class="mt-5 listMedicos" style="color:black;justify-content: center;">
                        </div>

                        <div class="mt-5" style="justify-content: center;">
                            <div name="agendaCita">
                                <div class="form-row mb-3" name="dac" style="">

                                    <div class="col-md-4" name="dm1">
                                        <select name="m" id="m" onchange="cambiaDia()" class="custom-select">
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
                                    <div class="col-md-4" name="dd1" >
                                        <select name="d" id="d" class="custom-select">
                                            <option>Día</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4" name="horas" id="horas">
                                        <select name="h" id="h" class="custom-select">
                                            <option value="0" >Hora</option>
                                        </select>
                                    </div>

                                </div>
                            </div>
                            <input type="hidden" name="org" id="org" value="agendarCita">
                            <input type="submit" name="btnRegCita" id="btnRegCita" value="Agendar Cita">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    //Dias por mes
    var m1 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30");
    var m2 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28");
    var m3 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");
    //Función cambia días
    function cambiaDia() {
        var c;
        c = document.getElementById("m").selectedIndex;
        if (c != 0) {
            if (c === 4 || c === 6 || c === 9 || c === 11) {
                //Selecciona cada tipo de mes
                ops = eval("m1");
                num_op = ops.length;
                document.getElementById("d").length = num_op;
                for (var i = 0; i < num_op; i++) {
                    document.getElementById("d").options[i].value = ops[i];
                    document.getElementById("d").options[i].text = ops[i];
                }
            } else if (c === 1 || c === 3 || c === 5 || c === 7 || c === 8 || c === 10 || c === 12) {

                //Selecciona cada tipo de mes
                ops = eval("m3");
                num_op = ops.length;
                document.getElementById("d").length = num_op;
                for (var i = 0; i < num_op; i++) {
                    document.getElementById("d").options[i].value = ops[i];
                    document.getElementById("d").options[i].text = ops[i];
                }

            } else if (c === 2) {
                //Selecciona cada tipo de mes
                ops = eval("m2");
                num_op = ops.length;
                document.getElementById("d").length = num_op;
                for (var i = 0; i < num_op; i++) {
                    document.getElementById("d").options[i].value = ops[i];
                    document.getElementById("d").options[i].text = ops[i];
                }
            } else {
                //Sin seleccion
                document.getElementById("d").length = 1;
                document.getElementById("d").options[0].value = "0";
                document.getElementById("d").options[0].text = "Día";
            }
            document.getElementById("d").options[0].selected = true;
        }
    }


    document.getElementById("dpEspecialidad").addEventListener("change", function () {
        var self = this;
        var id = document.getElementById("dpEspecialidad").selectedIndex;
        //document.getElementById("dpEspecialidad").disabled="disabled";
        httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = function () {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    var div = document.createElement('div');
                    div.innerHTML = (httpRequest.responseText).trim();
                    document.getElementsByClassName('listMedicos')[0].innerHTML = div.getElementsByClassName('listMedicos')[0].innerHTML;
                }
            }
        };
        httpRequest.open('GET', 'http://localhost:8080/wsAgendaMedica/doctor.do?org=docxEsp&id=' + id);
        httpRequest.send();
    });


    document.getElementById("d").addEventListener("change", function () {
        var self = this;
        var dia = document.getElementById("d").selectedIndex;
        var m = document.getElementById("m").selectedIndex;
        var doc = document.getElementById("dpDoctor").value;
        //document.getElementById("dpEspecialidad").disabled="disabled";
        httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = function () {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    var div = document.createElement('div');
                    div.innerHTML = (httpRequest.responseText).trim();
                    //alert(div.getElementsByClassName('horas')[0].innerHTML);
                    document.getElementById('horas').innerHTML = div.getElementsByClassName('horas')[0].innerHTML;
                }
            }
        };
        httpRequest.open('GET', 'http://localhost:8080/wsAgendaMedica/doctor.do?org=listHoras&m=' + m + '&d=' + dia + '&id=' + doc);
        httpRequest.send();
    });


</script>