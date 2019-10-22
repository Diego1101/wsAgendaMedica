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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author diego
 */
public class clsEspecialidad {
    
    
    Connection cnn;
    
    private int Id;
    private String Nombre;

    public int getId() {
        return Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public clsEspecialidad() {
    }

    public clsEspecialidad(int Id, String Nombre) {
        this.Id = Id;
        this.Nombre = Nombre;
    }
    
     public final Connection conexion() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/AGENDA", "root", "kakabfiio13");
            System.out.println("Se hizo la conexion a la base de datos");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto: " + e.getMessage());
        }
        return cnn;
    }

    Statement createStatement() {
        throw new UnsupportedOperationException("NO soporta la coneccion");
    }

    public ResultSet listarEsp() throws SQLException {
        String consultaSql;
        Statement st;
        ResultSet rs;
        consultaSql = "call tspListarEsp()";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    
}
