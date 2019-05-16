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

String genero = request.getParameter("nombreGeneroInsertar");
%>

<html>
<head>
<title>Inserta nuevos datos</title>
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
		margin-bottom: 3%;
		margin-right: 25%;
	}
</style>
</head>

<body>
<div>
	<h1>Inserta nuevos datos</h1>
	Además de poder listar numerosas consultas a la base de datos, también <b>es posible añadir nuevos proyectos.</b><br> Rellena el formulario e introduce un nuevo género musical a la discográfica.
	<br><hr>
	<a class="btn btn-warning" href="bienvenido.jsp">Volver</a>
	<a class="btn btn-danger" href="cerrarsesion.jsp">Cerrar sesión</a>
</div>

<div class="container">
	<form>
		<input type="hidden" name="update" />
			<div class="form-group" id="div2">
				<label for="nombreGeneroInsertar">Nombre del género</label>
				<input type="text" class="form-control" name="nombreGeneroInsertar" id="nombreGeneroInsertar" maxlength="49">
    			<small id="textoOrientativo" class="form-text text-muted">Introduce el nombre del nuevo género musical a introducir en la base de datos.</small>
      			<button type="submit" class="btn btn-primary" style="margin-top: 3%">Añadir género</button>
			</div>
	</form>
</div>

<%
String update = request.getParameter("update");
beanDB basededatos = new beanDB();

if(update != null){
	
	String queryAñadir = "INSERT INTO Generos (nombre) VALUES ('" + genero + "')";
	basededatos.conectarBD();
	basededatos.insert(queryAñadir);
	basededatos.desconectarBD();
}

if(genero != null)
response.sendRedirect("listageneros.jsp");
%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>