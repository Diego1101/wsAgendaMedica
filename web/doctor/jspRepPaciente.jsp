<%-- 
    Document   : jspReportes
    Created on : 23-oct-2019, 20:36:45
    Author     : volal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100 img-fluid img-slider" src="images/banner3.jpg" alt="First slide">
                <div class="carousel-caption"  style="justify-content: center; background: #99ddff; border-radius: 20px; box-shadow: 0 5px #1188cc; padding-top: 60px;">
                    <%
                        if (request.getAttribute("es") != null) {
                    %>
                    <div id="error" style="text-align: center; color: red; font-size: 1.2rem; font-weight: bold;"><%=request.getAttribute("es")%></div>
                    <%
                        }
                    %>
                    <h2>Pacientes</h2>
                    <div class="container mt-5" style="justify-content: center;">
                        <form action="doctor.do" method="post" id="errepePacientes" name="errepePacientes">
                            <div class="form-row mb-3" style="margin-left: 35%"> 
                                <div class="col-md-6" style="justify-content: center; ">
                                    <table style="width: 500px; text-align: center; position: relative; transform: translateX(-100px); border-radius: 20px;">
                                        <tr>
                                            <td colspan="7" style="height: 20px">
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="text-align: right; background: #e4e4e4;">
                                                <hr style="color: #0f2778;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background: #0f2778; color: #e4e4e4 width: 10px;">Clave</td>
                                            <td style="background: #0f2778; color: #e4e4e4 width: 20px;">Nombre</td>
                                            <td style="background: #0f2778; color: #e4e4e4 width: 20px;">Correo</td>
                                            <td style="background: #0f2778; color: #e4e4e4 width: 20px;">Antecedentes</td>
                                            <td style="background: #0f2778; color: #e4e4e4 width: 20px;">Alergias</td>
                                        </tr>
                                        <%
                                            ResultSet rsDoc = (ResultSet)request.getAttribute("rsReporte");
                                            int g = 0;
                                            if(g==1){
                                            rsDoc.beforeFirst();
                                            while(rsDoc.next()){
                                                out.println("<tr>");
                                                out.println("<td style='text-align:center;'>"+rsDoc.getString(1)+"</td>");
                                                out.println("<td style='text-align:center;'>"+rsDoc.getString(2)+"</td>");
                                                out.println("<td style='text-align:center;'>"+rsDoc.getString(3)+"</td>");
                                                out.println("<td style='text-align:center;'>"+rsDoc.getString(4)+"</td>");
                                                out.println("<td style='text-align:center;'>"+rsDoc.getString(5)+"</td></tr>");
                                            }
                                            }
                                            g = 1;
                                        %>
                                        <tr>
                                            <td colspan="7" style="text-align: right; background: #e4e4e4;">
                                                <hr style="color: #0f2778;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="text-align: right; background: #e4e4e4;">
                                                <a href="jspExRP.jsp">
                                                    Exportar a Excel
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <input type="submit" id="btnVer" style="width: 20%; color: #555" name="btnVer" value="Ver" class="btn btn-secondary">
                            <input type="hidden" id="origen" name="origen" value="errepePacientes">
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>
