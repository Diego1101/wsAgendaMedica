/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.clsCita;
import modelo.clsDoctor;
import modelo.clsEspecialidad;

/**
 *
 * @author diego
 */
public class doctor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String org = request.getParameter("org");

        switch (org) {
            case "listarCitas":
                listarCitas(request, response);
                break;

            case "detCita":
                verDetalle(request, response);
                break;

            case "confirmarCita":
                modEsCita(request, response);
                break;

            case "terminarCita":
                modEsCita(request, response);
                break;
            case "infoMedicos":
                listarEspecialidades(request, response);
                //listarMedicos();
                //
                request.setAttribute("ban", "1");
                request.setAttribute("pag", "jspMedicos.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);

                break;

            case "regMedico":
                regMedico(request, response);
                listarEspecialidades(request, response);
                request.setAttribute("ban", "1");
                request.setAttribute("pag", "jspMedicos.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            default:
                break;

        }
    }

    protected void listarEspecialidades(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            clsEspecialidad obj = new clsEspecialidad();
            obj.conexion();
            ResultSet rs = obj.listarEsp();

            List<String[]> esp = new ArrayList();

            while (rs.next()) {
                String[] aux = new String[2];
                aux[0] = rs.getString(1);
                aux[1] = rs.getString(2);
                esp.add(aux);
            }
            rs.close();
            request.setAttribute("esp", esp);
        } catch (SQLException ex) {
            Logger.getLogger(doctor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void regMedico(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String nombre = request.getParameter("txtNombre");
            String ap = request.getParameter("txtApellidos");
            String user = request.getParameter("txtUser");
            String correo = request.getParameter("txtCorreo");
            String pass = request.getParameter("txtPass");
            String estudios = request.getParameter("txtEstudios");
            String esp = request.getParameter("dpEspecialidad");

            String horario = "";
            for (int i = 9; i <= 18; i++) {
                horario += request.getParameter("l" + i);
            }
            for (int i = 9; i <= 18; i++) {
                horario += request.getParameter("m" + i);
            }
            for (int i = 9; i <= 18; i++) {
                horario += request.getParameter("i" + i);
            }
            for (int i = 9; i <= 18; i++) {
                horario += request.getParameter("j" + i);
            }
            for (int i = 9; i <= 18; i++) {
                horario += request.getParameter("v" + i);
            }
            for (int i = 9; i <= 18; i++) {
                horario += request.getParameter("s" + i);
            }

            clsDoctor doc = new clsDoctor();
            doc.conexion();
            String res = doc.regDoctor(nombre, ap, user, pass, correo, estudios, Integer.parseInt(esp), horario);
            System.out.println("es: " + res);
            if ("0".equals(res)) {
                request.setAttribute("es", "El usuario ya existe");
            }
            if ("1".equals(res)) {
                request.setAttribute("es", "Medico agregado");
            } else {
                request.setAttribute("es", "Error");
            }

        } catch (SQLException ex) {
            Logger.getLogger(doctor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void modEsCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            String resultado = "";
            clsCita obj = new clsCita();
            obj.conexion();
            if (request.getParameter("btnCancelar") != null) {
                if (obj.cancelarCita(id).equals("1")) {
                    resultado = "Cita cancelada";
                } else if (obj.cancelarCita(id).equals("2")) {
                    resultado = "No se puede cancelar el mismo dia";
                }
            } else if (request.getParameter("btnConfirmar") != null) {
                if (obj.confirmarCita(id).equals("1")) {
                    resultado = "Cita confirmada";
                }

            } else if (request.getParameter("btnTerminar") != null) {
                if (obj.terminarCita(id).equals("1")) {
                    resultado = "Cita terminada";
                }

            }

            request.setAttribute("res", resultado);
            listarCitas(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(doctor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void verDetalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            clsCita obj = new clsCita();
            obj.conexion();
            ResultSet rs = obj.detallesCita(id);

            response.setContentType("text/html;charset=UTF-8");

            while (rs.next()) {
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<div class='cd-schedule-modal__event-info'>");
                    out.println("<div>");
                    out.println("<h1 class='my-4'>");
                    out.println(rs.getString(1));
                    out.println("</h1>");
                    out.println("<h3 class='my-2'>");
                    out.println(rs.getString(2));
                    out.println("</h3>");

//                    out.println("<h3 class='my-2'>");
//                    out.println("Telefono");
//                    out.println("</h3>");
                    out.println("<p class='my-5'>");
                    out.println(rs.getString(3));
                    out.println("</p>");

                    out.println("<div style='position: absolute;bottom: 20px;width: 95%;'>");

                    if ("1".equals(rs.getString(4))) { //pendiente
                        out.println("<form action='doctor.do' method='post'>");
                        out.println("<input type='hidden' id='org' name='org' value='confirmarCita'>");
                        out.println("<input type='hidden' id='id' name='id' value='" + id + "'>");
                        out.println("<input type='submit' id='btnConfirmar' name='btnConfirmar' value='Confirmar' class='btn  btn-block btn-success' style='color: inherit;'>");
                        out.println("<input type='submit' id='btnCancelar' name='btnCancelar' value='Cancelar' class='btn  btn-block btn-danger' style='color: inherit;'>");
                        out.println("</form>");

                    } else if ("2".equals(rs.getString(4))) {//termianda
                        //mostrar resultados: peso, altura, diagnostico y tratamiento

                    } else if ("3".equals(rs.getString(4))) {//confirmada
                        out.println("<form action='doctor.do' method='post'>");
                        out.println("<input type='hidden' id='org' name='org' value='terminarCita' >");
                        out.println("<input type='hidden' id='id' name='id' value='" + id + "'>");
                        out.println("<input type='submit' id='btnTerminar' name='btnTerminar' value='Terminar' class='btn  btn-block btn-primary' style='color: inherit;'>");
                        out.println("<input type='submit' id='btnCancelar' name='btnCancelar' value='Cancelar' class='btn  btn-block btn-danger' style='color: inherit;'>");
                        out.println("</form>");

                    }

                    out.println("</div>");

                    out.println("</div>");
                    out.println("</div>");
                }
            }

            rs.close();

        } catch (Exception ex) {
            Logger.getLogger(doctor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void listarCitas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String sem = "0";
            if (request.getParameter("sem") != null) {
                sem = request.getParameter("sem");

            }
            clsDoctor doc = new clsDoctor(Integer.parseInt(request.getSession().getAttribute("id").toString()));
            ResultSet dat = doc.listarCitas(Integer.parseInt(sem));
            List<String[]> citas = new ArrayList<>();
            while (dat.next()) {
                String[] r = new String[5];
                r[0] = dat.getString(1);
                r[1] = dat.getString(2);
                r[2] = dat.getString(3);
                r[3] = dat.getString(4);
                r[4] = dat.getString(5);
                citas.add(r);
            }

            request.setAttribute("sem", sem);
            request.setAttribute("citas", citas);
            dat.close();

        } catch (SQLException ex) {
            Logger.getLogger(doctor.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("ban", "1");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
