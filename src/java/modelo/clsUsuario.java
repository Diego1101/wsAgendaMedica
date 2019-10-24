/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author diego
 */
public class clsUsuario {

    protected Connection cnn;
    ResultSet rs;

    protected int Id;
    protected int Id_tp;
    protected String Usuario;
    protected String Correo;
    protected String Nombre;
    protected String Apellido;
    protected String Estatus;
    protected String Reg;
    protected String Foto;

    public int getId() {
        return Id;
    }

    public int getId_tp() {
        return Id_tp;
    }

    public String getUsuario() {
        return Usuario;
    }

    public String getCorreo() {
        return Correo;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public String getEstatus() {
        return Estatus;
    }

    public String getReg() {
        return Reg;
    }

    public String getFoto() {
        return Foto;
    }

    public clsUsuario() {

    }

    public final Connection conexion() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/AGENDA", "root", "3209");
            System.out.println("Se hizo la conexion a la base de datos");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto: " + e.getMessage());
        }
        return cnn;
    }

    Statement createStatement() {
        throw new UnsupportedOperationException("NO soporta la coneccion");
    }

    public ResultSet validarAcceso(String usuario, String pwd) throws SQLException {
        String consultaSql;
        Statement st;
        consultaSql = "call tspIniciarSesion('" + usuario + "', '" + pwd + "')";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }
    
  

}
