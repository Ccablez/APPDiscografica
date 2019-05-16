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

String idgen = request.getParameter("idgen");
if (idgen==null) idgen="";
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
		margin-bottom: 3%;
		margin-right: 22%;
	}
</style>
</head>

<body>
<div>
	<h1>Listado de canciones por género</h1>
	Hemos listado <b>numerosos datos y consultas</b> a través de la base de datos de la discográfica.<br>A continuación, puedes listar las canciones de nuestra discográfica clasificadas por su género musical.
	<br><hr>
	<a class="btn btn-warning" href="bienvenido.jsp">Volver</a>
	<a class="btn btn-danger" href="cerrarsesion.jsp">Cerrar sesión</a>
	
	<form action="./listageneros.jsp" style="margin-top: 2%;" method="post">
		<select class="browser-default custom-select" name="idgen" style="width: 25%; margin-left: 0%;">
  			<option selected disabled>Selecciona un género...</option>
  			
			<%
			beanDB basededatos = new beanDB();
			String query2 = "SELECT idGenero, nombre FROM Generos";
			String [][] tablaquery2 = basededatos.resConsultaSelectA3(query2);

			if (tablaquery2 != null) {
				for (int i=0; i<tablaquery2.length; i++) {
			%>
			<option value="<%=tablaquery2[i][0]%>"><%=tablaquery2[i][1] %></option>
			<%
				}
			}
			%>
		</select>
		
		<button type="submit" id="enviar" name="enviar" class="btn btn-primary">Seleccionar</a></button>
</div>

<%
String query3 = "SELECT Generos.idGenero, Canciones.titulo, Artistas.nombre, Artistas.apellidos FROM Generos JOIN Canciones ON (Canciones.idGenero = Generos.idGenero) JOIN Artistas ON (Canciones.idArtista = Artistas.idArtista) WHERE Generos.idGenero = " + idgen;
String [][] tablaquery3 = basededatos.resConsultaSelectA3(query3);%>

<div id="div2">
	<table class="table">
  		<thead class="thead-dark">
  			<tr><th>Canciones junto a su artista...</th>
  		</thead>
  		
		<%
		if(tablaquery3 != null)
			for(int i=0; i< tablaquery3.length;i++){
		%>
		
		<tr><td><%=tablaquery3[i][1]%></td><td><%=tablaquery3[i][2]%></td><td><%=tablaquery3[i][3]%></td></tr><%
		}
		%>
		</tr>
	</table>
</form>
<br/>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>