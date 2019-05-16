<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mipk.Sesionok"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	
	#incorrecto{
		margin-top: 5%;
		margin-left: 27%;
	}
</style>

<% 
String usuario=request.getParameter("usuario");
String pass=request.getParameter("pass");
if (usuario == null)
	usuario="";

if (pass == null) 
	pass="";

boolean ok=false;

try {
	
	String aux=session.getAttribute("usuario").toString();
	ok=true;
	
	} catch (Exception e) {
		
	ok=false;
	
	}

if (!ok)
	if (usuario.equals("Profesor") && pass.equals("Altair2019$%")) {
		session.setAttribute("usuario",usuario);
		ok = true;
	}

%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página de inicio</title>
</head>

<body>
<% if (ok) { %>
	<div>
		<h1>Te has logeado correctamente...</h1>
		A continuación, puedes echar un vistazo a los datos que hay dentro de la base de datos del servidor.<br><b>Accede al listado completo</b> de Artistas, Canciones, Oficinas de la discográfica y otras tablas de la BBDD.
		<hr/>
		<a class="btn btn-warning" href="verdatos.jsp">Ver datos</a>
		<a class="btn btn-info" href="insertadatos.jsp">Añadir género</a>
		<a class="btn btn-danger" href="cerrarsesion.jsp">Cerrar sesión</a>
	</div>
<% } else { 
%>
	<div id="incorrecto">
		<h1>¡Credenciales incorrectas!</h1>
		El usuario y/o la contraseña introducida no es correcta.<br/>Puedes <b></b><a href="index.jsp"></a>volver al inicio</a></b> e introducir de nuevo las credenciales correctamente.
<% } %>
	</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>