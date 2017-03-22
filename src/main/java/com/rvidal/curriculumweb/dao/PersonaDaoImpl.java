package com.rvidal.curriculumweb.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.mongodb.BasicDBObject;
import com.rvidal.curriculumweb.modelos.Persona;
import com.rvidal.curriculumweb.mongoConfig.SpringMongoConfig;

public class PersonaDaoImpl implements PersonaDao {

	@Override
	public boolean insertarPersona(Persona per) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringMongoConfig.class);
		MongoOperations mongoOperation = (MongoOperations)ctx.getBean("mongoTemplate");	
		mongoOperation.save(per);
		return false;
	}
	
	@Override
	public Persona leerPersona(String id) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringMongoConfig.class);
		MongoOperations mongoOperation = (MongoOperations)ctx.getBean("mongoTemplate");	
		BasicDBObject query=new BasicDBObject("_id",new ObjectId(id));
		BasicQuery consulta = new BasicQuery(query);
		
		Persona per=(Persona) mongoOperation.findOne(consulta, Persona.class);
		
		return per;
	}
	
	@Override
	public boolean actualizarPersona(Persona per) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringMongoConfig.class);
		MongoOperations mongoOperation = (MongoOperations)ctx.getBean("mongoTemplate");	
		mongoOperation.save(per);
		return false;
	}

	
	
}