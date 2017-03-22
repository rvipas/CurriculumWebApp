package com.rvidal.curriculumweb.modelos;


public class FormacionNoReglada{
	
	public FormacionNoReglada() {
		super();
	}
	
	public FormacionNoReglada(String titulo, String entidad, String periodo, String descripcion) {
		super();
		this.titulo = titulo;
		this.entidad = entidad;
		this.periodo = periodo;
		this.descripcion = descripcion;
	}
	String titulo;
	String entidad;
	String periodo;
	String descripcion;
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getEntidad() {
		return entidad;
	}
	public void setEntidad(String entidad) {
		this.entidad = entidad;
	}
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}