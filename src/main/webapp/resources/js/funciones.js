
function makeEditable() {
	var editable_elements = document.querySelectorAll("[contenteditable=false]");
	for(var i=0; i<editable_elements.length; i++)
	    editable_elements[i].setAttribute("contentEditable", true);
	$("#edicion").hide();
	$("#guardar").css({ 'color': 'red'});
	$("#guardar").show();
	$("#imagen-anyadirAptitud").show();
	$("#imagen-anyadirIdioma").show();
	$("#imagen-edicion").show();
	$("#imagen-anyadirExperienciaProfesional").show();
	$("#imagen-anyadirFormacionNoReglada").show();
	$("#imagen-anyadirFormacionReglada").show();
	$('.imagen-eliminarIdioma').show();
	$('.sumarRestarApt').show();
	$('.imagen-eliminarIdioma').show();
	$('.imagen-eliminarIdioma').attr('style','visibility: visible');
	$('.sumarRestarApt').attr('style','visibility: visible');
	$('.imagen-eliminarAptitudValor').attr('style','visibility: visible');
	$('.eliminarText').attr('style','visibility: visible');
}

function save() {
	var editable_elements = document.querySelectorAll("[contenteditable=true]");
	for(var i=0; i<editable_elements.length; i++)
	    editable_elements[i].setAttribute("contentEditable", false);
	$("#guardar").hide();
	$("#edicion").show();
	$("#imagen-anyadirAptitud").hide();
	$("#imagen-anyadirIdioma").hide();
	$("#imagen-edicion").hide();
	$("#imagen-anyadirExperienciaProfesional").hide();
	$("#imagen-anyadirFormacionNoReglada").show();
	$("#imagen-anyadirFormacionReglada").show();
	$('.sumarRestarApt').attr('style','visibility: visible');
	$('.imagen-eliminarIdioma').attr('style','visibility: hidden');
	$('.imagen-eliminarAptitudValor').attr('style','visibility: hidden');
	$('.eliminarText').attr('style','visibility: hidden');
	sendPersona();
}

$('#imagen-edicion').click(function() {
    $('input[type=file]').click();
});

$(document).on("click", ".imagen-eliminarIdioma", function() {
	 $(this).parent().remove();
});

$('#imagen-anyadirIdioma').click(function() {
	$('#imagen-anyadirIdioma').before('<div class="idioma" ><h6 contenteditable="true" class="col s10 m10 center">Idioma</h6> <img  class="eliminar imagen-eliminarIdioma" style="visibility:visible;" src="resources/images/eliminar.png" width="6%" height="6% alt="eliminar"></div>');
});

$('#imagen-anyadirFormacionReglada').click(function() {
	$('#imagen-anyadirFormacionReglada').before('<div class="formacionReg"><div class="formacionRegTitulo" contenteditable="true"><h5>Nombre formacion</h5></div><h6 style="visibility:visible;" class="eliminarText"><em>(Eliminar formacion)</em></h6><p class="helping-text"><div class="formacionRegEntidad col m12 center" contenteditable="true"><i class="mdi-maps-place indigo-text"></i> Entidad</div><div class="formacionRegPeriodo col m12 center" contenteditable="true"><i class="mdi-action-today indigo-text"></i> Periodo formativo</div></p><div class="formacionRegDescripcion" contenteditable="true"><p>Descripcion</p></div></div>');	
});

$('#imagen-anyadirFormacionNoReglada').click(function() {
	$('#imagen-anyadirFormacionNoReglada').before('<div class="formacionReg"><div class="formacionNRegTitulo" contenteditable="true"><h5>Nombre formacion</h5></div><h6 style="visibility:visible;" class="eliminarText"><em>(Eliminar formacion)</em></h6><p class="helping-text"><div class="formacionNRegEntidad col m12 center" contenteditable="true"><i class="mdi-maps-place indigo-text"></i> Entidad</div><div class="formacionNRegPeriodo col m12 center" contenteditable="true"><i class="mdi-action-today indigo-text"></i> Periodo</div></p><div class="formacionNRegDescripcion" contenteditable="true"><p>Descripcion</p></div></div>');	
});

$('#imagen-anyadirExperienciaProfesional').click(function() {
	$('#imagen-anyadirExperienciaProfesional').before('<div class="ExpPro"><div class="ExpProCargo" contenteditable="true"><h5>Cargo</h5></div><h6 style="visibility:visible;" class="eliminarText"><em>(Eliminar experiencia)</em></h6><p class="helping-text"><div class="ExpProEmpresa col m12 center" contenteditable="true"><i class="mdi-maps-place indigo-text"></i> Empresa</div> <div class="ExpProPeriodo col m12 center" contenteditable="true"><i class="mdi-action-today indigo-text"></i>Periodo</div></p><div class="ExpProDesc" contenteditable="true">Descripcion</div></div>');		
});


$('#imagen-anyadirAptitud').click(function() {
	$('#imagen-anyadirAptitud').before('<div class="aptValor"><div class="aptitud" ><h6 contenteditable="false" class="col s10 m10 left">Aptitud</h6><img style="visibility:visible;" class="eliminar imagen-eliminarAptitudValor" src="resources/images/eliminar.png" width="22rem" alt="eliminar"></div><img style="visibility:visible;" class="sumarRestarApt rest col s1 m1 left-side" id="imagen-arestarAptVal" src="resources/images/eliminar.png" width="8%" height="6% alt="añadir"><div class="progress col s10 m10 left" style="padding-left:0px;padding-right:0px;margin-bottom: 0.2rem;margin-top: 0.0rem;"><div class="progress-bar col s10 m10 center" style="width: 50%;"></div></div><img style="visibility:visible;" class="sumarRestarApt sum" src="resources/images/anyadir.png" width="8%" height="6% alt="añadir"></div>');
});

$(document).on("click", ".sum", function() {
	valor=$(this).parent().children('.progress').children('.progress-bar').attr("style");
	valor=parseInt(valor.slice(0, -2).replace(" ","").split(":")[1]);
	console.log(valor);
	if(valor<100){
		valor=valor+parseInt(5.0);
		$(this).parent().children('.progress').children('.progress-bar').attr("style","width:"+valor+"%;")
	}else {alert("Alto vaquero!")}
});



$(document).on("click", ".imagen-eliminarAptitudValor", function() {
	 $(this).parent().parent().remove();
});

$(document).on("click", ".eliminarText", function() {
	 $(this).parent().remove();
});

$(document).on("click", ".rest", function() {
	console.log($(this).parent().children('.progress').children('.progress-bar').attr("style"));
	valor=$(this).parent().children('.progress').children('.progress-bar').attr("style");
	valor=parseInt(valor.slice(0, -2).replace(" ","").split(":")[1]);
	console.log(valor);
	if(valor>0){
		valor=valor-parseInt(5.0);
		$(this).parent().children('.progress').children('.progress-bar').attr("style","width:"+valor+"%;")
	}else {alert("Estas bajando mucho el nivel, seguro que no deseas eliminar esta aptitud?")}
});

function sendPersona() {
	var name=$("#name").text();
	var surname=$("#surname").text();
	var position=$("#position").text();
	var aboutme=$("#aboutme").text();
	var email=$("#email").text();
	var city=$("#city").text();
	var personalweb=$("#personalweb").text();
	
	var aptitudes = document.querySelectorAll(".aptitud");
	var aptValor = document.querySelectorAll(".progress-bar");
	var aptVal=[];
	var aptitudesValor={};
	for(var i=0; i<aptitudes.length; i++){
		var nodeApt = aptitudes[i];
		var textApt  = nodeApt.textContent || nodeApt.innerText;
		var textVal = aptValor[i].style.width;
		console.log(textApt);
		console.log(textVal);
		var valor=textVal.substring(0, textVal.length - 1)
	var objeto=[textApt,parseInt(valor)];	
		aptVal.push(aptitudesValor[textApt] = valor);
	}
	var langs = document.querySelectorAll(".idioma");
	
	var idiomas=[];
	for(var i=0; i<langs.length; i++){
		var nodeIdioma = langs[i];
		var textIdioma  = nodeIdioma.textContent || nodeIdioma.innerText;
		console.log(textIdioma);
		idiomas.push(textIdioma);
	}
	
	var expProfCargo = document.querySelectorAll(".ExpProCargo");
	var expProfEmpresa = document.querySelectorAll(".ExpProEmpresa");
	var expProfPeriodo = document.querySelectorAll(".ExpProPeriodo");
	var expProfDesc = document.querySelectorAll(".ExpProDesc");
	
	var experienciasProfesionales=[];
	for(var i=0; i<expProfCargo.length; i++){
		var nodeProfCargo = expProfCargo[i];
		var textProfCargo  = nodeProfCargo.textContent || nodeProfCargo.innerText;

		var nodeProfEmpresa = expProfEmpresa[i];
		var textProfEmpresa  = nodeProfEmpresa.textContent || nodeProfEmpresa.innerText;

		var nodeProfPeriodo = expProfPeriodo[i];
		var textProfPeriodo  = nodeProfPeriodo.textContent || nodeProfPeriodo.innerText;

		var nodeProfDesc = expProfDesc[i];
		var textProfDesc  = nodeProfDesc.textContent || nodeProfDesc.innerText;
		var datosExpProf={"cargo":textProfCargo,"empresa":textProfEmpresa,"periodo":textProfPeriodo,"descripcion":textProfDesc};
		experienciasProfesionales.push(datosExpProf);
	}
	
	
	var formacionRegTitulo = document.querySelectorAll(".formacionRegTitulo");
	var formacionRegEntidad = document.querySelectorAll(".formacionRegEntidad");
	var formacionRegPeriodo = document.querySelectorAll(".formacionRegPeriodo");
	var formacionRegDescripcion = document.querySelectorAll(".formacionRegDescripcion");
	
	var formacionReglada=[];
	for(var i=0; i<formacionRegTitulo.length; i++){
		var nodeFormRegTitulo = formacionRegTitulo[i];
		var textFormRegTitulo  = nodeFormRegTitulo.textContent || nodeFormRegTitulo.innerText;

		var nodeFormRegEntidad = formacionRegEntidad[i];
		var textFormRegEntidad  = nodeFormRegEntidad.textContent || nodeFormRegEntidad.innerText;

		var nodeFormRegPeriodo = formacionRegPeriodo[i];
		var textFormRegPeriodo  = nodeFormRegPeriodo.textContent || nodeFormRegPeriodo.innerText;

		var nodeFormRegDescripcion = formacionRegDescripcion[i];
		var textFormRegDescripcion  = nodeFormRegDescripcion.textContent || nodeFormRegDescripcion.innerText;
		var datosFormReg={"titulo":textFormRegTitulo,"entidad":textFormRegEntidad,"periodo":textFormRegPeriodo,"descripcion":textFormRegDescripcion};
		formacionReglada.push(datosFormReg);
	}
	

	var formacionNRegTitulo = document.querySelectorAll(".formacionNRegTitulo");
	var formacionNRegEntidad = document.querySelectorAll(".formacionNRegEntidad");
	var formacionNRegPeriodo = document.querySelectorAll(".formacionNRegPeriodo");
	var formacionNRegDescripcion = document.querySelectorAll(".formacionNRegDescripcion");
	
	var formacionNReglada=[];
	for(var i=0; i<formacionNRegTitulo.length; i++){
		var nodeFormNRegTitulo = formacionNRegTitulo[i];
		var textFormNRegTitulo  = nodeFormNRegTitulo.textContent || nodeFormNRegTitulo.innerText;

		var nodeFormNRegEntidad = formacionNRegEntidad[i];
		var textFormNRegEntidad  = nodeFormNRegEntidad.textContent || nodeFormNRegEntidad.innerText;

		var nodeFormNRegPeriodo = formacionNRegPeriodo[i];
		var textFormNRegPeriodo  = nodeFormNRegPeriodo.textContent || nodeFormNRegPeriodo.innerText;

		var nodeFormNRegDescripcion = formacionNRegDescripcion[i];
		var textFormNRegDescripcion  = nodeFormNRegDescripcion.textContent || nodeFormNRegDescripcion.innerText;
		var datosFormNReg={"titulo":textFormNRegTitulo,"entidad":textFormNRegEntidad,"periodo":textFormNRegPeriodo,"descripcion":textFormNRegDescripcion};
		formacionNReglada.push(datosFormNReg);
	}

	var datosFormacion={"reglada" : formacionReglada,"no_reglada" : formacionNReglada};
	var sendData = {
		    "name" : name,
		    "position" : position,
		    "aboutme" : aboutme,
		    "email" : email,
		    "city" : city,
		    "personalweb" : personalweb,
		    "aptitudesValor":aptitudesValor,
		    "profesionalExp":experienciasProfesionales,
		    "formacion" : datosFormacion,
		    /*"formacionReglada":formacionReglada,
		    "formacionNoReglada":formacionNReglada,*/
		    "languages": idiomas 
		   }
	 
	alert("Valor nombre:" +name );
	$.ajax({ 
	    url: "/curriculumweb/actualizar/"+name, 
	    type: 'POST', 
	    data : JSON.stringify(sendData),
	    dataType: 'json', 
	    //data: "{ \"_id\":ObjectId(\"57529cbe2e4d9990b9e69be6\"), \"_class\":\"com.rvidal.curriculumweb.modelos.Persona\", \"name\":\"Rafael\", \"surname\":\"VidalPastor\", \"position\":\"IngenieroSoftware\", \"city\":\"Valencia(España)\", \"email\":\"rvidal8.@gmail.com\", \"sex\":\"Hombre\", \"personalweb\":\"miweb\", \"photoroute\":\"user.jpg\", \"aboutme\":\"<p>Farfaraway,behindthewordmountains,farfromthecountriesVokaliaandConsonantia,therelivetheblindtexts.</p><p>AsmallrivernamedDudenflowsbytheirplaceandsuppliesitwiththenecessaryregelialia.Itisaparadisematiccountry,inwhichroastedparts.</p>\", \"social\":[ { \"link\":\"https://www.facebook.com/rafel.vidal.5\", \"account\":\"Facebook\" }, { \"link\":\"https://www.linkedin.com/in/ravipas\", \"account\":\"LinkedIn\" }, { \"link\":\"_blank\", \"account\":\"Twitter\" } ], \"profesionalExp\":[ { \"cargo\":\"JuniorJavaDeveloper\", \"empresa\":\"Sopra-Steria\", \"periodo\":\"Noviembre2015\", \"descripcion\":\"<li><p>DesarrolloymantenimientodeaplicacioneswebparasectorSEGUROS.<strong>(JAVA,SPRING)</strong></p></li>\" }, { \"cargo\":\"Desarrollo\", \"empresa\":\"DamalRedesS.L.\", \"periodo\":\"Septiembre2014-Noviembre2015\", \"descripcion\":\"<ul><li><p>Desarrolloymantenimientodeaplicacioneswebydeescritorio.<strong>(JAVA,HTML,PHP)</strong></p></li><li><p>PuestaenmarchaypersonalizaciondecontenidowebsobreplataformasCMS.<strong>(Joomla,Wordpress)</strong></p></li><li><p>Instalacion,configuracion,mantenimientoypersonalizaciondeERP-CRM(Dolibarr).</p></li><li><p>Administraciondesistemas.</p></li><li><p>Monitorizaciondeservidoresyrecursosdered,sobretecnologiabasadaenNagios(Nagvis).<strong>(+de1000assets)</strong></p></li><ul>\" }, { \"cargo\":\"Practicasformativas\", \"empresa\":\"ConselleriadeSanitat(Valencia)\", \"periodo\":\"Mayo2009-Septiembre2009\", \"descripcion\":\"<ul><li><p>Practicasformativasduranteelperiodouniversitario,desarrollodeaplicacionesdeusointernoparaeldepartamentodeinspeccionsanitaria.<strong>(C#,ASP)</strong></p></li><ul>\" } ], \"formacion\":{ \"reglada\":[ { \"titulo\":\"MasterenIngenieriadelSoftware\", \"entidad\":\"UniversidadPolitécnicadeValencia\", \"periodo\":\"27Aug2007\", \"descripcion\":\"<p><strong>MasterenIngenieriadelSoftware,MetodosFormalesySistemasdeInformacion.</strong></p><p><strong>Ingenieríadelsoftware:</strong>Seanalizanlastécnicasqueseutilizanenlaconcepcionydesarrollodelossistemassoftwaredeúltimageneracion.</p><p><strong>Tecnologíasoftwaremultiparadigma:</strong>Fundamentos,funcionamientoeimplementaciondeherramientasautomáticasdeanálisis,verificacion,certificacion,depuracion,transformacionyoptimizaciondesistemassoftwareendistintosparadigmasdeprogramacion.</p><p><strong>Sistemasdeinformacion:</strong>Peculiaridadesarquitecturales,organizacionalesydeinterfazqueplanteanlossistemas,incluyendolaorganizacion,conservacion,tratamientoyrecuperaciondeinformacionapartirdedatosendistintosformatos.</p>\" }, { \"titulo\":\"IngenieroenAutomaticayElectronicaIndustrial\", \"entidad\":\"UniversidadPolitécnicadeValencia\", \"periodo\":\"27Aug2005\", \"descripcion\":\"<p><strong>Losobjetivosfundamentalesdeestatitulacionson:</strong></p><li>Aplicarsusconocimientosaldesarrollodesistemasqueintroduzcanmejorasenlosmásvariadosprocesosindustriales.</li><li>Conocerlosfundamentosyaplicacionesdelaelectronicaanalogica,digitalymicroprocesadores.</li><li>Capacitarparadiseñarsistemaselectronicosanalogicos,digitalesydepotencia.</li><li>Capacitarparaelmodeladoysimulaciondesistemas.</li><li>Capacitarparadiseñarsistemasdecontrolyautomatizacionindustrial.</li>\" }, { \"titulo\":\"IngenieroTecnicoenInf.deSistemas\", \"entidad\":\"UniversidadPolitécnicadeValencia\", \"periodo\":\"27Aug2005\", \"descripcion\":\"<p>ElobjetivoglobaldelosestudiosdeIngenieríaTécnicaInformáticadeSistemas(ITIS)esproporcionaralalumnounconocimientoprofundodeloscomponentesyfuncionesdeuncomputador,asícomocapacitarleparalaconcepcion,proyectoyaplicaciondesistemasinformáticosengeneral.</p>\" } ], \"no_reglada\":[ { \"titulo\":\"DireccionygestiondeProyectos\", \"entidad\":\"UniversidadPolitécnicadeValencia\", \"periodo\":\"Junio2015\", \"descripcion\":\"Cursosobregestiondeproyectossoftware.\" }, { \"titulo\":\"Archimate:EnterpriseArchitectureModelingLanguage\", \"entidad\":\"UniversidadPolitécnicadeValencia\", \"periodo\":\"Mayo2015\", \"descripcion\":\"Cursosobregblablabla.</\" }, { \"titulo\":\"IntensiveProgrammeonDesignofSafeandReliableTechnicalSystems(IPDeSeRTS)\", \"entidad\":\"HogeschoolvanAmsterdam,Amsterdam(Netherland)\", \"periodo\":\"Marzo2009\", \"descripcion\":\"Proyectointernacionalsobretemasdeblablabla....</\" } ] }, \"languages\":[ \"Español\", \"Aleman\", \"Ingles\" ], \"aptitudesValor\":{ \"Java\":60, \"MySql\":40, \"MongoDb\":30 } }", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	});
	}