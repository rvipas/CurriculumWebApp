package com.rvidal.curriculumweb.mongoConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;

import com.mongodb.MongoClient;

@Configuration
public class SpringMongoConfig {

	public @Bean
	MongoDbFactory mongoDbFactory() throws Exception {
		
		org.springframework.data.authentication.UserCredentials cred;
		cred =new org.springframework.data.authentication.UserCredentials("test","test");
		//return new SimpleMongoDbFactory(new MongoClient(), "curriculumweb");
		return new SimpleMongoDbFactory(new MongoClient("ravipas.es"), "curriculumweb",cred);
	}

	public @Bean
	MongoTemplate mongoTemplate() throws Exception {
		
		MongoTemplate mongoTemplate = new MongoTemplate(mongoDbFactory());
				
		return mongoTemplate;
		
	}

}