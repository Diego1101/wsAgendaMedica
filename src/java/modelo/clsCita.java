/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import com.mysql.jdbc.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author diego
 */
public class clsCita {
    
    private Connection cnn;
    private ResultSet rs;
    
    private int Id;
    private int Id_pa;
    private int Id_do;
    private int Id_ho;
    private Date Fecha;
    private float Peso;
    private float Altura;
    private float Presion;
    private String Notas;
    private String Diagnostico;
    private String Tratamiento;
    private int Estatus;

    public int getId() {
        return Id;
    }

    public int getId_pa() {
        return Id_pa;
    }

    public int getId_do() {
        return Id_do;
    }

    public int getId_ho() {
        return Id_ho;
    }

    public Date getFecha() {
        return Fecha;
    }

    public float getPeso() {
        return Peso;
    }

    public float getAltura() {
        return Altura;
    }

    public float getPresion() {
        return Presion;
    }

    public String getNotas() {
        return Notas;
    }

    public String getDiagnostico() {
        return Diagnostico;
    }

    public String getTratamiento() {
        return Tratamiento;
    }

    public int getEstatus() {
        return Estatus;
    }

    public clsCita(int id) throws SQLException {
        String consultaSql;
        Statement st;
        consultaSql = "select * from CITA where CI_ID="+id;
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        this.Id=id;
        while(rs.next()){
            this.Id_pa=Integer.parseInt(rs.getString(2));
            this.Id_do=Integer.parseInt(rs.getString(3));
            this.Id_ho=Integer.parseInt(rs.getString(4));
            //this.Fecha=new Date(rs.getString(5));
            this.Peso=Integer.parseInt(rs.getString(6));
            this.Altura=Integer.parseInt(rs.getString(7));
            this.Presion=Integer.parseInt(rs.getString(8));
            this.Notas=rs.getString(9);
            this.Diagnostico=rs.getString(10);
            this.Tratamiento=rs.getString(11);
            this.Estatus=Integer.parseInt(rs.getString(12));
           
        }
        rs.close();
        
    }
    
    public clsCita(){
        
    }
    
    public final Connection conexion() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/AGENDA", "root", "3209");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto: " + e.getMessage());
        }
        return cnn;
    }
    
    public ResultSet detallesCita(int id) throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "call tspDetallesCita("+id+")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
        
    }
    
    public String terminarCita(int id) throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "call tspTerminar("+id+")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        
        String resultado="";
        while(rs.next()){
            resultado=rs.getString(1);
        }
        rs.close();
        return resultado;
    }
    
    public String confirmarCita(int id) throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "call tspConfirmarCita("+id+")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        
        String resultado="";
        while(rs.next()){
            resultado=rs.getString(1);
        }
        rs.close();
        return resultado;
    }
    
    public String cancelarCita(int id) throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "call tspCancelarCita("+id+")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        
        String resultado="";
        while(rs.next()){
            resultado=rs.getString(1);
        }
        rs.close();
        return resultado;
    }

    public ResultSet mostrarCCanceladas(int id) throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "CALL stpCitasCanceladas("+id+")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet mostrarCConfirmadas(int id) throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "CALL stpCitasConfimadas("+id+")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet mostrarDoctores() throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "CALL stpReporteDoctor()";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet mostrarPacientes() throws SQLException{
        String consultaSql;
        Statement st;
        consultaSql = "CALL stpPacientes()";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }
    
}
