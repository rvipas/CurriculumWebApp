package com.rvidal.curriculumweb.modelos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Document(collection = "personas")
public class Persona {
	
	@Id
	String id;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	String name;
	
	String position;
	String city;
	String email;
	String personalweb;
	String aboutme;
	String photoroute;
	public String getPhotoroute() {
		return photoroute;
	}

	public void setPhotoroute(String photoroute) {
		this.photoroute = photoroute;
	}
	ArrayList<Map> social = new ArrayList();

	public String getAboutme() {
		return aboutme;
	}

	public void setAboutme(String aboutme) {
		this.aboutme = aboutme;
	}
	ArrayList<ExperienciaProfesional> profesionalExp;

	Formacion formacion;
	
	public Formacion getFormacion() {
		return formacion;
	}

	public void setFormacion(Formacion formacion) {
		this.formacion = formacion;
	}
		
	ArrayList<String> languages;
	public ArrayList<String> getLanguages() {
		return languages;
	}

	public void setLanguages(ArrayList<String> languages) {
		this.languages = languages;
	}
	HashMap<String,Integer> aptitudesValor=new HashMap();
	
	public HashMap<String, Integer> getAptitudesValor() {
		return aptitudesValor;
	}

	public void setAptitudesValor(HashMap<String, Integer> aptitudesValor) {
		this.aptitudesValor = aptitudesValor;
	}

	public ArrayList<ExperienciaProfesional> getProfesionalExp() {
		return profesionalExp;
	}

	public void setProfesionalExp(ArrayList<ExperienciaProfesional> profesionalExp) {
		this.profesionalExp = profesionalExp;
	}

	public Persona(String name, String position, String city, String email,
			String personalweb, ArrayList<ExperienciaProfesional> exp, HashMap<String, Integer> apt ) {
		super();
		this.name = name;
		this.position = position;
		this.city = city;
		this.email = email;
		this.personalweb = personalweb;
		this.profesionalExp=exp;
		this.aptitudesValor=apt;
	}
	
	public Persona() {
		super();
	}

	public Persona(String name, String position, String city, String email,
			String personalweb, ArrayList<ExperienciaProfesional> exp, Formacion formacion, HashMap<String, Integer> apt) {
		super();
		this.name = name;
		this.position = position;
		this.city = city;
		this.email = email;
		this.personalweb = personalweb;
		this.profesionalExp=exp;
		this.formacion=formacion;

	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPersonalweb() {
		return personalweb;
	}
	public void setPersonalweb(String personalweb) {
		this.personalweb = personalweb;
	}
	
	public ArrayList<Map> getSocial() {
		return social;
	}

	public void setSocial(ArrayList<Map> social) {
		this.social = social;
	}
	
	@Override
	public String toString() {
		return "Persona [name=" + name + ", position=" + position + ", city=" + city
				+ ", email=" + email + ", personalweb=" + personalweb + "]";
	}
	
	
	
}