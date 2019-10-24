<%-- 
    Document   : jspExRP
    Created on : 24-oct-2019, 12:34:28
    Author     : volal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.clsCita"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<!DOCTYPE html>
<%  
    //copia de la clase
    clsCita con=new clsCita();
    //estableciendo la conexión con la bd
    Connection cnn=con.conexion();
    //va a recibir los resultados de la consulta
    ResultSet rsFrm;
    //ejecución del metodo de la clase
    rsFrm=con.mostrarPacientes();
    
    //crea un nuevo documento
    HSSFWorkbook wb=new HSSFWorkbook();
    HSSFSheet sheet=wb.createSheet();
    
    //ResultSet rsFrm1;
    int ban=0;
    try{
        HSSFRow row=sheet.createRow(0);
        //generar las columnas y el valor que tendrán asignado
        row.createCell(0).setCellValue("Clave");
        row.createCell(1).setCellValue("Nombre");
        row.createCell(2).setCellValue("Correo");
        row.createCell(3).setCellValue("Antecedentes");
        row.createCell(4).setCellValue("Alergias");
        int i=1;
        while(rsFrm.next()){
            HSSFRow row1=sheet.createRow(i);
            row1.createCell(0).setCellValue(rsFrm.getString(1));
            row1.createCell(1).setCellValue(rsFrm.getString(2));
            row1.createCell(2).setCellValue(rsFrm.getString(3));
            row1.createCell(3).setCellValue(rsFrm.getString(4));
            row1.createCell(4).setCellValue(rsFrm.getString(5));
            i=i+1;
            sheet.autoSizeColumn(1);
            sheet.autoSizeColumn(2);
            sheet.autoSizeColumn(3);
            sheet.autoSizeColumn(4);
            sheet.autoSizeColumn(5);
        }
    }catch(Exception e){
        out.println("Error"+e);
    }
    //prepara la generación del archivo
    ByteArrayOutputStream outByteStream=new ByteArrayOutputStream();
    //escribe los datos a exportar
    wb.write(outByteStream);
    byte[] outArray=outByteStream.toByteArray();
    //configura el archivo
    response.setContentType("application/vnd.ms-excel");
    response.setContentLength(outArray.length);
    response.setHeader("Expires:","0");
    response.setHeader("Content-Disposition", "attachment; filename=Cli_"+new Date().getTime()+".xls");
    System.out.println("");
    OutputStream outStream=response.getOutputStream();
    //escribe los datos
    outStream.write(outArray);
    //limpia los datos
    outStream.flush();
    //cierra el archivo
    outStream.close();
    //lo guarda en esta ruta
    FileOutputStream archivoExcel=new FileOutputStream("C:/");
    //CREA EL ARCHIVO CON LOS DATOS
    wb.write(outStream);
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

