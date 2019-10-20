<%-- 
    Document   : jspCitasD
    Created on : 15/10/2019, 10:42:12 PM
    Author     : diego
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /*int numD;
    Calendar c = Calendar.getInstance(Locale.US);
    c.set(2019, 9, 13);
    numD = c.get(Calendar.DAY_OF_WEEK);
    System.out.println(numD);
     */

    String lunes = "", martes = "", miercoles = "", jueves = "", viernes = "", sabado = "";

    if (request.getAttribute("citas") != null) {

        List<String[]> citas = (List<String[]>) request.getAttribute("citas");


        for (String[] cita : citas) {
            if (cita[0].equals("2")) {
                lunes += "<li class='cd-schedule__event'>";
                lunes += "<a data-start='" + cita[1] + ":00' data-end='" + (Integer.parseInt(cita[1]) + 1) + ":00' data-content='" + cita[4] + "' data-event='event-" + cita[3] + "' href='#0'>";
                lunes += "<em class='cd-schedule__name'>" + cita[2] + "</em>";
                lunes += "</a>";
                lunes += "</li>";
            }
            else if (cita[0].equals("3")) {
                martes += "<li class='cd-schedule__event'>";
                martes += "<a data-start='" + cita[1] + ":00' data-end='" + (Integer.parseInt(cita[1]) + 1) + ":00' data-content='" + cita[4] + "' data-event='event-" + cita[3] + "' href='#0'>";
                martes += "<em class='cd-schedule__name'>" + cita[2] + "</em>";
                martes += "</a>";
                martes += "</li>";
            }
            else if (cita[0].equals("4")) {
                miercoles += "<li class='cd-schedule__event'>";
                miercoles += "<a data-start='" + cita[1] + ":00' data-end='" + (Integer.parseInt(cita[1]) + 1) + ":00' data-content='" + cita[4] + "' data-event='event-" + cita[3] + "' href='#0'>";
                miercoles += "<em class='cd-schedule__name'>" + cita[2] + "</em>";
                miercoles += "</a>";
                miercoles += "</li>";
            }
            else if (cita[0].equals("5")) {
                jueves += "<li class='cd-schedule__event'>";
                jueves += "<a data-start='" + cita[1] + ":00' data-end='" + (Integer.parseInt(cita[1]) + 1) + ":00' data-content='" + cita[4] + "' data-event='event-" + cita[3] + "' href='#0'>";
                jueves += "<em class='cd-schedule__name'>" + cita[2] + "</em>";
                jueves += "</a>";
                jueves += "</li>";
            }
            else if (cita[0].equals("6")) {
                viernes += "<li class='cd-schedule__event'>";
                viernes += "<a data-start='" + cita[1] + ":00' data-end='" + (Integer.parseInt(cita[1]) + 1) + ":00' data-content='" + cita[4] + "' data-event='event-" + cita[3] + "' href='#0'>";
                viernes += "<em class='cd-schedule__name'>" + cita[2] + "</em>";
                viernes += "</a>";
                viernes += "</li>";
            }
            else if (cita[0].equals("7")) {
                sabado += "<li class='cd-schedule__event'>";
                sabado += "<a data-start='" + cita[1] + ":00' data-end='" + (Integer.parseInt(cita[1]) + 1) + ":00' data-content='" + cita[4] + "' data-event='event-" + cita[3] + "' href='#0'>";
                sabado += "<em class='cd-schedule__name'>" + cita[2] + "</em>";
                sabado += "</a>";
                sabado += "</li>";
            }
        }
    }


%>

<form action="doctor.do" method="post" id="citas" name="citas">
    <input type="hidden" id="org" name="org" value="listarCitas">
</form>

<%    if (request.getAttribute("ban") == null || request.getAttribute("ban").equals("0")) {
%>
<script>
    document.getElementById("citas").submit();
</script>

<%
    }
%>


<script>document.getElementsByTagName("html")[0].className += " js";</script>

<div id="scheduleC">  
    <div align="center">
        <h2>Agenda</h2>
        <div class="mt-2" style="color: #412ecc;">
            <%
                if(request.getAttribute("res")!=null){
                    out.println(request.getAttribute("res"));
                }
            %>
        </div>
    </div>
    <div class="cd-schedule cd-schedule--loading margin-top-lg margin-bottom-lg js-cd-schedule">
        <div class="cd-schedule__timeline">
            <ul>
                <li><span>09:00</span></li>
                <li><span>09:30</span></li>
                <li><span>10:00</span></li>
                <li><span>10:30</span></li>
                <li><span>11:00</span></li>
                <li><span>11:30</span></li>
                <li><span>12:00</span></li>
                <li><span>12:30</span></li>
                <li><span>13:00</span></li>
                <li><span>13:30</span></li>
                <li><span>14:00</span></li>
                <li><span>14:30</span></li>
                <li><span>15:00</span></li>
                <li><span>15:30</span></li>
                <li><span>16:00</span></li>
                <li><span>16:30</span></li>
                <li><span>17:00</span></li>
                <li><span>17:30</span></li>
                <li><span>18:00</span></li>
                <li><span>18:30</span></li>
            </ul>
        </div> <!-- .cd-schedule__timeline -->

        <div class="cd-schedule__events">
            <ul>
                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Monday</span></div>
                    <ul>
                        <%=lunes%>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Tuesday</span></div>

                    <ul>
                        <%=martes%>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Wednesday</span></div>

                    <ul>
                        <%=miercoles%>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Thursday</span></div>

                    <ul>
                        <%=jueves%>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Friday</span></div>

                    <ul>
                        <%=viernes%>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Saturday</span></div>

                    <ul>
                        <%=sabado%>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="cd-schedule-modal">
            <header class="cd-schedule-modal__header">
                <div class="cd-schedule-modal__content">
                    <span class="cd-schedule-modal__date"></span>
                    <h3 class="cd-schedule-modal__name"></h3>
                </div>

                <div class="cd-schedule-modal__header-bg"></div>
            </header>

            <div class="cd-schedule-modal__body">
                <div class="cd-schedule-modal__event-info"></div>
                <div class="cd-schedule-modal__body-bg"></div>
            </div>

            <a href="#0" class="cd-schedule-modal__close text-replace">Close</a>
        </div>

        <div class="cd-schedule__cover-layer"></div>
    </div> <!-- .cd-schedule -->
</div>

