package com.rvidal.curriculumweb.modelos;


public class ExperienciaProfesional{
	
	public ExperienciaProfesional() {
		super();
	}

	
	public ExperienciaProfesional(String cargo, String empresa, String periodo, String descripcion) {
		super();
		this.cargo = cargo;
		this.empresa = empresa;
		this.periodo = periodo;
		this.descripcion = descripcion;
	}
	String cargo;
	String empresa;
	String periodo;
	String descripcion;
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	public String getEmpresa() {
		return empresa;
	}
	public void setEmpresa(String empresa) {
		this.empresa = empresa;
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