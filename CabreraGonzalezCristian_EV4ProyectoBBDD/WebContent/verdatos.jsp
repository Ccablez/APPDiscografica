<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>

<%
try {
	
	String aux=session.getAttribute("usuario").toString();
	
	} catch (Exception e) {
		
	response.sendRedirect("cerrarsesion.jsp");
}
%>

<html>
<head>
<title>Muestra de datos</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
	div{
		margin-top: 5%;
		margin-left: 20%;	
	}
	
	hr{
		margin-left: 0%;
		width: 75%;
	}
	
	#div2{
		margin-top: 3%;
		margin-right: 10%;
		margin-left: 10%;
		margin-bottom: 3%;
	}
</style>
</head>

<body>
<div>
	<h1>Listado de artistas</h1>
	Hemos listado <b>numerosos datos y consultas</b> a través de la base de datos de la discográfica.<br>A continuación, puedes echar un vistazo al listado de artistas pertenecientes a nuestra discográfica.
	<br><hr>
	<a class="btn btn-warning" href="bienvenido.jsp">Volver</a>
	<a class="btn btn-danger" href="cerrarsesion.jsp">Cerrar sesión</a>
	<a class="btn btn-primary" href="listageneros.jsp" style="margin-left: 30%;">Ver el listado de géneros</a>
	<br/>
</div>

<% 
String opcion = request.getParameter("enviar");
String query="SELECT idArtista, nombre, apellidos, pais FROM Artistas;";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
ArrayList<Artistas> listaArtistas = new ArrayList<Artistas>();

for (int i=0; i<tablares.length;i++) {
	listaArtistas.add(new Artistas(tablares[i][0],tablares[i][1],tablares[i][2],tablares[i][3]));
}
%>

<div id="div2">
	<table class="table">
  		<thead class="thead-dark">
    		<tr>
      		<th scope="col">ID</th>
      		<th scope="col">Nombre</th>
      		<th scope="col">Apellido</th>
      		<th scope="col">Procedencia</th>
    		</tr>
    		
<% for (Artistas a:listaArtistas) {
	%>
		<tr>
		<td> <%=a.getId() %> </td>
	 	<td> <%=a.getNombre() %> </td>
	 	<td> <%=a.getApellidos() %> </td>
	 	<td> <%=a.getProcedencia() %> </td>
	 	</tr> <% 
}
%>
	</table>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>