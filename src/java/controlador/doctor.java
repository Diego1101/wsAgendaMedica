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
import modelo.clsDoctor;

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

            default:
                break;

        }
    }

    private void listarCitas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            clsDoctor doc = new clsDoctor(Integer.parseInt(request.getSession().getAttribute("id").toString()));
            ResultSet dat = doc.listarCitas(0);
            List<String[]> citas = new ArrayList<>();
            while(dat.next()){
                String[] r =new String[5];
                r[0]=dat.getString(1);
                r[1]=dat.getString(2);
                r[2]=dat.getString(3);
                r[3]=dat.getString(4);
                r[4]=dat.getString(5);
                citas.add(r);
            }
            
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
