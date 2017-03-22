package com.rvidal.curriculumweb.modelos;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload{
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	MultipartFile file;
	//getter and setter methods

}