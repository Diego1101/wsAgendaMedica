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
public class clsDoctor extends clsUsuario {

    private int Id_do;
    private String Estudio;

    public int getId() {
        return Id_do;
    }

    public void setId(int Id) {
        this.Id_do = Id;
    }

    public String getEstudio() {
        return Estudio;
    }

    public void setEstudio(String Estudio) {
        this.Estudio = Estudio;
    }

    public clsDoctor(int us) throws SQLException {

        this.Id = us;
        conexion();
        ResultSet dat = obtenerDatos(us);

        while (dat.next()) {
            this.Usuario = rs.getString(1);
            this.Correo = rs.getString(2);
            this.Foto = rs.getString(3);
            this.Nombre = rs.getString(4);
            this.Apellido = rs.getString(5);
            this.Estatus = rs.getString(6);
            this.Reg = rs.getString(7);
            this.Id_do = Integer.parseInt(rs.getString(8));
            this.Estudio = rs.getString(9);

        }
        dat.close();

    }

    public clsDoctor() {

    }

    public final ResultSet obtenerDatos(int us) throws SQLException {
        String consultaSql;
        Statement st;
        consultaSql = "call tspDatosDoctor(" + us + ")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }

    public final ResultSet listarCitas(int sem) throws SQLException {
        String consultaSql;
        Statement st;
        consultaSql = "call tspMostrarSemana(" + this.Id_do + "," + sem + ")";
        st = (Statement) cnn.createStatement();
        rs = st.executeQuery(consultaSql);
        return rs;
    }

}
