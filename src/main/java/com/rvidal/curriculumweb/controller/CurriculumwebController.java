package com.rvidal.curriculumweb.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rvidal.curriculumweb.modelos.*;
import com.rvidal.curriculumweb.dao.*;


@Controller
public class CurriculumwebController {

	String message = "Welcome to Spring MVC!";

	@Autowired
	UserDao uDAO;
	
	@RequestMapping("/landing")
	public ModelAndView landing() {
		//String id2="57529cbe2e4d9990b9e69be6";
		 Authentication authentication =
                 SecurityContextHolder.getContext().getAuthentication();
		String username= authentication.getName();
		String id2="584b359dfc3de7ac2c1c0ed7";
		//String username="mkyong";
		
		UserCurriculum ucc=uDAO.recoverIdByUserName(username);
		
		PersonaDao pdao = new PersonaDaoImpl();
		Persona per=pdao.leerPersona(ucc.getId());
		String time = (new Date()).toString();
		Map<String, Object> modelo = new HashMap<String, Object>();
		modelo.put("persona", per);
		return new ModelAndView("landing", "usuario", per);
	}
	
	//para el custom login form
	@RequestMapping(value = "/login")
	public ModelAndView login(
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	@RequestMapping(value = "/insertar")
	public ModelAndView insertar() {
		ModelAndView model = new ModelAndView();

		ArrayList<ExperienciaProfesional> arr= new ArrayList();
		ExperienciaProfesional ep=new ExperienciaProfesional("Cargo", "Empresa", "Periodo", "Descripcion");
		arr.add(ep);
		FormacionReglada fReg=new FormacionReglada("Nombre formacion", "Entidad", "Periodo", "Descripcion");
		FormacionNoReglada fNreg=new FormacionNoReglada("Nombre formacion", "Entidad", "Periodo", "Descripcion");
		ArrayList<FormacionReglada> foreg=new ArrayList();
		ArrayList<FormacionNoReglada> nforeg=new ArrayList();
		foreg.add(fReg);
		nforeg.add(fNreg);
		Formacion formacion=new Formacion(foreg,nforeg);
		
		HashMap<String, Integer> aptitudes=new HashMap();
		aptitudes.put("Aptitud", 50);
		
		Persona per= new Persona("Nombre completo", "Descripcion profesional", "Ciudad", "email", "web",arr,formacion,aptitudes);
		ArrayList<String> languages=new ArrayList();
		languages.add("Español");
		per.setLanguages(languages);
		per.setAboutme("Escriba un comentario sobre usted, una cita, etc.");
		per.setAptitudesValor(aptitudes);
		ArrayList<Map> social=new ArrayList();
		  Map social1 = new HashMap();
		  Map social2 = new HashMap();
		  Map social3 = new HashMap();
		  social1.put("account", "Facebook");
		  social1.put("link", "_blank");
		  social2.put("account", "LinkedIn");
		  social2.put("link", "_blank");
		  social3.put("account", "Twitter");
		  social3.put("link", "_blank");
		  social.add(social1);
		  social.add(social2);
		  social.add(social3);
		  per.setSocial(social);
		  per.setPhotoroute("user-default.png");
		PersonaDao pdao = new PersonaDaoImpl();
		pdao.insertarPersona(per);
		return model;

	}
	
	@RequestMapping(value = "/leer/{id}", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Persona leer(String id) {
		//String id2="5752884a2e4ddfc58a74a506";
		String id2="584b359dfc3de7ac2c1c0ed7";
		PersonaDao pdao = new PersonaDaoImpl();
		Persona per=pdao.leerPersona(id2);
		
	System.out.println("Persona leida");	
		return per;

	}

	//@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/actualizar/{nombre}", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	public void actualizar(@RequestBody  Persona person) {
		//String id2="57529cbe2e4d9990b9e69be6";
		String id2="584b359dfc3de7ac2c1c0ed7";
		PersonaDao pdao = new PersonaDaoImpl();
		Persona per=pdao.leerPersona(id2);
		String ident=per.getId();
		System.out.println("Identificador: "+ident);
		per.setName(person.getName());
		per.setAboutme(person.getAboutme());
		per.setPosition(person.getPosition());
		per.setEmail(person.getEmail());
		per.setCity(person.getCity());
		per.setPersonalweb(person.getPersonalweb());
		per.setLanguages(person.getLanguages());
		per.setAptitudesValor(person.getAptitudesValor());
		per.setProfesionalExp(person.getProfesionalExp());
		per.setFormacion(person.getFormacion());
		pdao.actualizarPersona(per);
		System.out.println("Persona actualizada");
	}
	
}
