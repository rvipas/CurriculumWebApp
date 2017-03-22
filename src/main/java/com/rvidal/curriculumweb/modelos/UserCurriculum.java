package com.rvidal.curriculumweb.modelos;

import java.util.HashSet;
import java.util.Set;

public class UserCurriculum{

	private Integer userCurriculumId;
	private User user;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private String id;
	private boolean ispublic;
	
	public Integer getUserCurriculumId() {
		return userCurriculumId;
	}

	public void setUserCurriculumId(Integer userCurriculumId) {
		this.userCurriculumId = userCurriculumId;
	}

	

	public UserCurriculum() {
	}

	public UserCurriculum(User user, String id, boolean ispublic) {
		this.user = user;
		this.id = id;
		this.ispublic = ispublic;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isIspublic() {
		return ispublic;
	}

	public void setIspublic(boolean ispublic) {
		this.ispublic = ispublic;
	}

}
