<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inicio de sesión</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style type="text/css">
	body{
		background-image: url(https://imgur.com/oJBzztC.png);
		background-repeat: no-repeat;
	}

	#login{
		margin-top: 20%;
		margin-left: 40%;
	}

	#titulo{
		color: white;
	}
</style>

<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}

function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('¡Sólo puedes introducir números!');
			return false;
		}
		else return true;
	}
	else return true;
}

function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('¡Sólo puedes introducir letras y números!');
			return false;
		}
		else return true;
	}
	else return true;
}
</script>
</head>

<body>
<div id="login">
	<h1 id="titulo">Inicia sesión</h1>
	<form action="bienvenido.jsp" method="post" name="iniciosesion"/>
		<table style="text-align: left; border: none;">
		<tr><td>
			<input type="hidden" name="varoculta" value="secreto"/>		</td><td><input type="text" name="usuario" maxlength="10" value="" class="form-control" size="15" placeholder="Introduce tu usuario..."/>
		</td></tr>
		<tr><td>
		</td>
		<td>
			<input type="password" name="pass" maxlength="20" value="" class="form-control" size="30" placeholder="Introduce tu clave..." style="margin-top: 2%; margin-bottom: 2%"/>
		</td></tr>
		<tr><td>
		</td>
		<td style="text-align: right;">
			<input type="button" name="send" value="Entrar" class="btn btn-info" onclick="compruebayenvia();"/>
		</td></tr>
		</table>
	</form>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>