<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<title>-Curriculum Web-</title>

<%@include file="include.jsp"%>
<%@ page import="com.rvidal.curriculumweb.modelos.*,com.rvidal.curriculumweb.dao.*" %>


<!-- CSS  -->
<link href="resources/css/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="resources/css/flaticon.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="resources/css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
</head>
<body>
	<sec:authorize var="loggedIn" access="hasRole('ROLE_USER')"/>
		<c:choose>
			<c:when test="${loggedIn}">
				<section id="top-bar">
					<div class="spinner-layer spinner-green">
						<div class="circle-clipper left">
							<div class="circle"></div>
						</div>
						<div class="gap-patch">
							<div class="circle"></div>
						</div>
						<div class="circle-clipper right">
							<div class="circle"></div>
						</div>
					</div>

				</section>
				<div class="container">
					<div class="section content">

						<!--   Icon Section   -->
						<div class="row">
							<div class="col s12 m12">
								<c:url value="/j_spring_security_logout" var="logoutUrl" />
								<!-- csrt for log out-->
								<form action="${logoutUrl}" method="post" id="logoutForm">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
								<script>
									function formSubmit() {
										document.getElementById("logoutForm")
												.submit();
									}
								</script>
								
								<div class="col s12 m4 left-side">
									<c:if test="${pageContext.request.userPrincipal.name != null}">
										<h5 class="col s12 m12 left-side">
											<s:message code="landing.bienvenida"></s:message>
 ${pageContext.request.userPrincipal.name} </h5>
 <h5 class="col s12 m6 left-side"> <a href="javascript:formSubmit()"> <s:message code="landing.salir"></s:message></a></h5>
										
										<h5 class="col s12 m6 left-side"id="edicion"><a href="javascript:makeEditable();"><s:message code="landing.edicion"></s:message></a></h5>
										<h5 class="col s12 m6 left-side"id="guardar" hidden><a style="color:red" href="javascript:save();"><s:message code="landing.guardar"></s:message></a>	</h5>
										
									</c:if>

								<!--<form:form commandName="fileUploadForm" method="post" id="a" enctype="multipart/form-data">
									<input type="file" name="file"  />
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
										<input type="submit" value="Submit">
								</form:form> -->

									
									<input type="file" style="visibility: hidden;" />
									<img id="imagen-edicion" hidden src="resources/images/editar.png" width="15%" height="15% alt="edicion"
										class="circle responsive-img" style="position: relative; float: left;margin-right: -16%;;margin-top: 4%;">
									<img src="resources/images/${usuario.photoroute}" alt="Photo user"
										class="circle user-img responsive-img" >
										
									<div class="block">
										<h5 id="name" class="center indigo-text" contenteditable="false">${usuario.name}</h5>
										<p id="position" class="light center" contenteditable="false">${usuario.position}</p>
									</div>
									<hr>

									<div class="block">
										<h5 class="left-align">
											<i class="mdi-action-account-box"></i> <s:message code="landing.sobre_mi"></s:message>
										</h5>
										<div id="aboutme" contenteditable="false">${usuario.aboutme}</div>
									</div>
									<div class="block center">
										<h5 class="left-align">
											<i class="mdi-action-perm-phone-msg"></i> <s:message code="landing.contacto"></s:message>
										</h5>
										<p>
											<div id="city" contenteditable="false"><i class="mdi-maps-pin-drop indigo-text"></i> ${usuario.city} <br/></div>
											<!--<i class="mdi-communication-phone indigo-text"></i> +92 0332 000 0000<br/>-->
											<div  id="email" contenteditable="false">
											<i class="mdi-communication-email indigo-text"></i> <a
												href="mailto:${usuario.email}" class="indigo-text"
												target="_blank">${usuario.email}</a><br /> </div>
											<div id="personalweb" contenteditable="false">
												<i
												class="mdi-content-link indigo-text"></i> <a href="${usuario.personalweb}"
												class="indigo-text" target="_blank">${usuario.personalweb}</a>
												</div>												
										</p>
									</div>
									<div class="block">
										<h5 class="left-align">
											<i class="mdi-action-stars"></i><s:message code="landing.aptitudes"></s:message>
										</h5>
										<c:forEach items="${usuario.aptitudesValor}" var="entrada">
    									<div class="aptValor">
    									<div class="aptitud" ><h6 contenteditable="false" class="col s10 m10 left">${entrada.key}</h6><img style="visibility:hidden;" class="eliminar imagen-eliminarAptitudValor" src="resources/images/eliminar.png" width="22rem" alt="eliminar"></div>
										<img style="visibility:hidden;" class="sumarRestarApt rest col s1 m1 left-side" id="imagen-arestarAptVal" src="resources/images/eliminar.png" width="8%" height="6% alt="añadir">
										<div class="progress col s10 m10 left" style="padding-left:0px;padding-right:0px;margin-bottom: 0.2rem;margin-top: 0.0rem;">
											<div class="progress-bar col s10 m10 center" style="width: ${entrada.value}%;"></div>
										</div>
										<img style="visibility:hidden;" class="sumarRestarApt sum" src="resources/images/anyadir.png" width="8%" height="6% alt="añadir">
										</div>
										</c:forEach>
									<img id="imagen-anyadirAptitud"  hidden src="resources/images/anyadir.png" width="8%" height="8% alt="edicion"
										class="circle responsive-img" style="margin-top:4%; margin-left: 50%;"></div>
									<!-- inicio idiomas-->
									<div class="block">
										<h5 class="left-align">
											<i class="mdi-action-language"></i> <s:message code="landing.idiomas"></s:message>
										</h5>
										<c:forEach items="${usuario.languages}" var="idioma">
											<div id=${idioma} class="idioma" ><h6 contenteditable="false" class="col s10 m10 center">${idioma}</h6> 
									<img  class="eliminar imagen-eliminarIdioma" style="visibility:hidden;" src="resources/images/eliminar.png" width="6%" height="6% alt="eliminar">
									</div>
									
										</c:forEach>
									<img id="imagen-anyadirIdioma"  hidden src="resources/images/anyadir.png" width="8%" height="8% alt="edicion"
										class="circle responsive-img" style="margin-top:4%; margin-left: 38%;">
										<!--fin idiomas-->
									</div>
									<div class="block social">
										<h5 class="left-align">
											<i class="mdi-social-share"></i> <s:message code="landing.sigueme"></s:message>
										</h5>
										<c:forEach items="${usuario.social}" var="social">
											<div class="col s4 center">
											<a href=${social.link}
												class="indigo-text" target="_blank">
												<c:choose> 
													<c:when test="${social.account.equals('LinkedIn')}">
														<i class="flaticon-linkedin"></i>
													</c:when>
													<c:when test="${social.account.equals('Facebook')}">
														<i class="flaticon-facebook"></i>
													</c:when>
													<c:when test="${social.account.equals('Twitter')}">
														<i class="flaticon-twitter"></i>
													</c:when>
													<c:otherwise>
														<i class="flaticon-twitter"></i>
    												</c:otherwise>
												</c:choose>
											</a>
											</div>
										</c:forEach>
										
										
									</div>

								</div>

								<div class="col s12 m8 right-side">
									<h4 class="left-align">
										<i class="mdi-hardware-laptop-windows"></i> <s:message code="landing.experiencia_laboral"></s:message>

									</h4>
									
									
									
									<div class="block">
										<c:forEach items="${usuario.profesionalExp}" var="experiencia">
										<div class="ExpPro">
										<div class="ExpProCargo" contenteditable="false"><h5>${experiencia.cargo}</h5></div>
										<h6 class="eliminarText"><em>(Eliminar experiencia)</em></h6>
										<p class="helping-text">
											<div class="ExpProEmpresa col m12 center" contenteditable="false"><i class="mdi-maps-place indigo-text"></i> ${experiencia.empresa}</div> 
											<div class="ExpProPeriodo col m12 center" contenteditable="false"><i class="mdi-action-today indigo-text"></i>${experiencia.periodo}</div>
										</p>
										<div class="ExpProDesc" contenteditable="false">${experiencia.descripcion}</div>
										</div>
										</c:forEach>	
										<img id="imagen-anyadirExperienciaProfesional"  hidden src="resources/images/anyadir.png" width="5%" height="5% alt="edicion"
										class="circle responsive-img" style="margin-top:4%; margin-left: 50%;">
									</div>
																		<h4 class="left-align">
										<i class="mdi-social-school"></i> <s:message code="landing.formacion"></s:message>

									</h4>
									<div class="block">
										<c:forEach items="${usuario.formacion.reglada}" var="formacion">
										<div class="formacionReg">
										<div class="formacionRegTitulo" contenteditable="false"><h5>${formacion.titulo}</h5></div>
										<h6 class="eliminarText"><em>(Eliminar formación)</em></h6>
										<p class="helping-text">
											<div class="formacionRegEntidad col m12 center" contenteditable="false"><i class="mdi-maps-place indigo-text"></i> ${formacion.entidad}</div>
											<div class="formacionRegPeriodo col m12 center" contenteditable="false"><i class="mdi-action-today indigo-text"></i> ${formacion.periodo}</div>
										</p>
										<div class="formacionRegDescripcion" contenteditable="false"><p>${formacion.descripcion}</p></div>
										</div>
										</c:forEach>
										<img id="imagen-anyadirFormacionReglada"  hidden src="resources/images/anyadir.png" width="5%" height="5% alt="edicion"
										class="circle responsive-img" style="margin-top:4%; margin-left: 50%;">
									</div>
									<h5 class="center">
										<i class="mdi-social-school"></i> <s:message code="landing.cursos"></s:message>
										
										</h4>
										<div class="block">
											<c:forEach items="${usuario.formacion.no_reglada}" var="formacion">
											<div class="formacionNReg">
											<div class="formacionNRegTitulo" contenteditable="false"><h5>${formacion.titulo}</h5></div>
											<h6 class="eliminarText"><em>(Eliminar curso)</em></h6>
											<p class="helping-text">
												<div class="formacionNRegEntidad col m12 center" contenteditable="false"><i class="mdi-maps-place indigo-text"></i> ${formacion.entidad}</div>
												<div class="formacionNRegPeriodo col m12 center" contenteditable="false"><i class="mdi-action-today indigo-text"></i> ${formacion.periodo}</div>
											</p>
											<div class="formacionNRegDescripcion" contenteditable="false"><p>${formacion.descripcion}</p></div>
										</div>
										</c:forEach>
										<img id="imagen-anyadirFormacionNoReglada"  hidden src="resources/images/anyadir.png" width="5%" height="5% alt="edicion"
										class="circle responsive-img" style="margin-top:4%; margin-left: 50%;">
										</div>
							</div>
						</div>
					</div>

					<!--  Scripts-->
					<script src="resources/js/jquery-2.1.1.min.js"></script>
					<script src="resources/js/materialize.js"></script>
					<script src="resources/js/slider.js"></script>
					<script src="resources/js/hammer.min.js"></script>
					<script src="resources/js/cards.js"></script>
					<script src="resources/js/init.js"></script>
					<script src="resources/js/funciones.js"></script>
	</c:when>
	<c:otherwise>
        <%@include file="forbidden.jsp"%>
    </c:otherwise>
	</c:choose>
	
	
</body>
</html>