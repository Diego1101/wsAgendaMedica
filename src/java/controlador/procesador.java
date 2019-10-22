/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package controlador;

import com.mysql.jdbc.Connection;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.clsUsuario;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 *
 * @author diego
 */
public class procesador extends HttpServlet {
    
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
            throws ServletException, IOException, SQLException {
        
        
        String pag=request.getParameter("pag");
        //if(pag==null) pag=request.getPart("pag").toString();
        //String pag="regPag";
        switch(pag){
            case "iSesion":
                inicioSesion(request, response);
                break;
                
            case "regP":
                registrarPerfil(request, response);
                break;
                
//            case "excel":
//                descargarExcel(request, response);
//                break;
                
            case "usuarios":
                mostrarUsuarios(request, response);
                break;  
            default:
                break;
                
        }
        
    }
    
     private void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException{
        
        clsUsuario obj=new clsUsuario();
        Connection cnn=obj.conexion();
        ResultSet tabla=obj.mostrarUsuarios();
        List<clsUsuario> entities = new ArrayList<clsUsuario>();

        while (tabla.next()) {
            clsUsuario entity = new clsUsuario();
            entity.setCve(Integer.parseInt(tabla.getString(1)));
            entity.setRol(tabla.getString(2));
            entity.setUsuario(tabla.getString(3));
            entity.setNombre(tabla.getString(4));
            entity.setAp(tabla.getString(5));
            entity.setCorreo(tabla.getString(6));
               
            entities.add(entity);
        }
        
        tabla.close();
        
        request.getSession().setAttribute("usuarios", entities);
        //request.setAttribute("usuarios", entities);
        request.getRequestDispatcher("jspUsuarios.jsp").forward(request, response);
        
     }
     
    
    
    private void registrarPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        request.getSession().setAttribute("edo", "err1");
        
        String nombre=request.getParameter("txtNombre");
        String apellido=request.getParameter("txtApellido");
        String alias=request.getParameter("txtAlias");
        String correo=request.getParameter("txtCorreo");
        
        
        
        clsUsuario usu=(clsUsuario)request.getSession().getAttribute("usuario");
        usu.setNombre(nombre);
        usu.setAp(apellido);
        usu.setAlias(alias);
        usu.setCorreo(correo);
        
        
        try {
            usu.conexion();
            ResultSet rsFrm=usu.modUsuario();
            String resultado="";
            while(rsFrm.next()){
                resultado=rsFrm.getString(1);
                
            }
            
            if("1".equals(resultado))request.getSession().setAttribute("edo", "true");
            if("0".equals(resultado))request.getSession().setAttribute("edo", "err1");
            
            rsFrm.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(procesador.class.getName()).log(Level.SEVERE, null, ex);
            
            request.getSession().setAttribute("edo", ex.getMessage());
        }
        
        request.getRequestDispatcher("jspRegistrarPerfil.jsp").forward(request, response);
        
    }
    
    private void inicioSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        //recibe parametros de la vista y se evaluan las acciones
        String usuario=request.getParameter("txtUsuario");
        String contra=request.getParameter("txtContra");
        
        if(!usuario.equals("") && !contra.equals("")){
            clsUsuario usu=new clsUsuario(usuario, contra);
            
            
            try{
                
                usu.conexion();
                ResultSet rsFrm=usu.validarAcceso();
                
                while(rsFrm.next()){
                    usu.setCve(Integer.parseInt(rsFrm.getString(1)));
                    
                    if(usu.getCve()!=0){
                        usu.setRol(rsFrm.getString(2));
                        usu.setFoto(rsFrm.getString(3));
                        usu.setNombre(rsFrm.getString(4));
                        usu.setAp(rsFrm.getString(5));
                        usu.setCorreo(rsFrm.getString(6));
                        usu.setAlias(rsFrm.getString(7));
                    }
                }
                
                rsFrm.close();
                
                
                if(usu.getCve()!=0){
                    //generar una variable de session
                    request.getSession().setAttribute("usuario", usu);
                    //enviar a la vista de acceso correcto
                    request.getRequestDispatcher("jspAccesoCorrecto.jsp").forward(request, response);
                }
                else{
                    request.getRequestDispatcher("jspAccesoDenegado.jsp").forward(request, response);
                    
                }
                
            }
            catch(SQLException ex){
                System.out.println("No se conecto: "+ex.getMessage());
                
            }
            
            
        }else{
            //envia la vista que corresponde
            request.getRequestDispatcher("jspErrorCampos.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(procesador.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(procesador.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
