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
    
    private Connection cnn;
    ResultSet rs;
    
    private int Id;
    private int Id_tp;
    private String Usuario;
    private String Correo;
    private String Nombre;
    private String Apellido;
    private String Estatus;
    private String Reg;
    
   
    public clsUsuario(){
        
    }
    
    public final Connection conexion() throws SQLException{

	try{
		Class.forName("com.mysql.jdbc.Driver");
		cnn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/AGENDA","root", "3209");
		System.out.println("Se hizo la conexion a la base de datos");
	}
	catch (ClassNotFoundException | SQLException e)
	{
		System.out.println("No se conecto: "+e.getMessage());
	}
        return cnn;
    }

    Statement createStatement(){
        throw new UnsupportedOperationException("NO soporta la coneccion");
    }
    
    public ResultSet validarAcceso(String usuario, String pwd) throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql="call tspIniciarSesion('"+usuario+"', '"+pwd+"')";
        //Establecer ejecucion de comando
        st=(Statement) cnn.createStatement();
        //ejecuta ek comando
        rs=st.executeQuery(consultaSql);
        return rs;
    }
    
    
}
