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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.clsUsuario;

/**
 *
 * @author diego
 */
public class paciente extends HttpServlet {

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
        
        String org=request.getParameter("origen");
        
        switch(org){
            case "acceso":
                 iniciarSesion(request, response);
                break;
                
            default:
                break;
            
        }
    }
    
    void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String usuario=request.getParameter("txtUsuario");
        String pwd=request.getParameter("txtContra");
        clsUsuario obj = new clsUsuario();
        try {
            obj.conexion();
        
            ResultSet rs=obj.validarAcceso(usuario, pwd);
            String estado="";
            while (rs.next()){
                if(!rs.getString(1).equals("0")){
                    estado="1";
                    request.getSession().setAttribute("id",rs.getString(1));
                    request.getSession().setAttribute("nombre",rs.getString(2)+" "+rs.getString(3));
                    request.getSession().setAttribute("rol",rs.getString(4));
                }
                else{
                    estado="Datos incorrectos";
                }
            }
            
            rs.close();
            if(!estado.equals("1")){
                request.setAttribute("es", estado);
                request.setAttribute("pag", "jspAcceso.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            else{
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(paciente.class.getName()).log(Level.SEVERE, null, ex);
        }
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
