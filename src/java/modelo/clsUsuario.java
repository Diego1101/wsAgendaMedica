/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author diego
 */
public class clsUsuario {
    private String usuario;
    private String pwd;
    
    private int cve;
    private String nombre;
    private String rol;
    private String ap;
    private String correo;
    private String foto;
    private String estatus;
    private String fechaReg;
    private String alias;
    
    Connection cnn;
    ResultSet rs;
    String consultaSql="";
    Statement st;
    
    public clsUsuario(String usuario, String pwd){
        this.usuario=usuario;
        this.pwd=pwd; 
    }
    
    public clsUsuario(){
        
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    
    public String getAp() {
        return ap;
    }

    public void setAp(String ap) {
        this.ap = ap;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getFechaReg() {
        return fechaReg;
    }

    public void setFechaReg(String fechaReg) {
        this.fechaReg = fechaReg;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getCve() {
        return cve;
    }

    public void setCve(int cve) {
        this.cve = cve;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    //conexion a base de datos
    
    public final Connection conexion() throws SQLException{

	try{
		Class.forName("com.mysql.jdbc.Driver");
		cnn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/AGENDA","root", "kakabfiio13");
		System.out.println("Se hizo la conexion a la base de datos");
	}
	catch (ClassNotFoundException | SQLException e)
	{
		System.out.println("No se conecto: "+e.getMessage());
	}
        return cnn;
    }

    Statement createStatement(){
        throw new UnsupportedOperationException("No soporta la coneccion");
    }
    
    public ResultSet validarAcceso() throws SQLException{
        consultaSql="call tspIniciarSesion('"+usuario+"', '"+pwd+"')";
        //Establecer ejecucion de comando
        st=(Statement) cnn.createStatement();
        //ejecuta ek comando
        rs=st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet modUsuario() throws SQLException{
        System.out.println("CALL tspModificarUsuario("+this.getCve()+", '"+this.getNombre()+"', '"+this.getAp()+"', '"+this.getCorreo()+"', '"+this.getFoto()+"', '"+this.getAlias()+"')");
        consultaSql="CALL tspModificarUsuario("+this.getCve()+", '"+this.getNombre()+"', '"+this.getAp()+"', '"+this.getCorreo()+"', '"+this.getFoto()+"', '"+this.getAlias()+"')";
        //Establecer ejecucion de comando
        st=(Statement) cnn.createStatement();
        //ejecuta ek comando
        rs=st.executeQuery(consultaSql);
        return rs;
    }
    
    public ResultSet mostrarUsuarios() throws SQLException{
        consultaSql="call mostrarUsuarios()";
        //Establecer ejecucion de comando
        st=(Statement) cnn.createStatement();
        //ejecuta ek comando
        rs=st.executeQuery(consultaSql);
        return rs;
    }
    
}
