package com.rvidal.curriculumweb.modelos;

import java.util.ArrayList;

public class Formacion{
	public Formacion() {
		super();
	}
	public Formacion(ArrayList<FormacionReglada> reglada, ArrayList<FormacionNoReglada> no_reglada) {
		super();
		this.reglada = reglada;
		this.no_reglada = no_reglada;
	}
	ArrayList<FormacionReglada> reglada;
	ArrayList<FormacionNoReglada> no_reglada;
	public ArrayList<FormacionReglada> getReglada() {
		return reglada;
	}
	public void setReglada(ArrayList<FormacionReglada> reglada) {
		this.reglada = reglada;
	}
	public ArrayList<FormacionNoReglada> getNo_reglada() {
		return no_reglada;
	}
	public void setNo_reglada(ArrayList<FormacionNoReglada> no_reglada) {
		this.no_reglada = no_reglada;
	}	
}