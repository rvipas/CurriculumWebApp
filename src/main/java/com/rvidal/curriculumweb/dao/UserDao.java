package com.rvidal.curriculumweb.dao;

import com.rvidal.curriculumweb.modelos.User;
import com.rvidal.curriculumweb.modelos.UserCurriculum;

public interface UserDao {

	User findByUserName(String username);
	UserCurriculum recoverIdByUserName(String username);
	
}