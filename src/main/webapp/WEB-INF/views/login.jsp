<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>-Curriculum Web-</title>
<!-- include librerias tags -->
<%@include file="include.jsp" %>
<style>

body{background-color:#6680DA !important}

.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 40%;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
<!-- CSS  -->
  <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="resources/css/flaticon.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

</head>
<body onload='document.loginForm.username.focus();'>
	<div id="login-box">

		<h3><s:message code="login.acceso"></s:message></h3>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
		  action="<c:url value='j_spring_security_check' />" method='POST'>

		  <table>
			<tr>
				<td><s:message code="login.usuario"></s:message></td>
				<td><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td><s:message code="login.contrasenya"></s:message></td>
				<td><input type='password' name='password' /></td>
			</tr>
			
			
		  </table>
<input name="submit" type="submit"
					value=<s:message code="login.boton"></s:message> />
		  <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		</form>
	</div>
</body>
</html>