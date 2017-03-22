package com.rvidal.curriculumweb.dao;
import com.rvidal.curriculumweb.modelos.Persona;

public interface PersonaDao {

	boolean insertarPersona(Persona per);
	Persona leerPersona(String id);
	boolean actualizarPersona(Persona per);
	
}