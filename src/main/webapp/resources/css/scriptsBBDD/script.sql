/* drop de la bbdd si existe*/
DROP DATABASE IF EXISTS curriculumweb;
/* creacion de la base de datos*/
CREATE DATABASE curriculumweb;

/*creacion de las tablas de gestion de usuario*/
CREATE TABLE curriculumweb.user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    position VARCHAR(30),
    city VARCHAR(30),
    email VARCHAR(60),
    personalweb VARCHAR(120),
    aboutme VARCHAR(128)
) ENGINE = InnoDB;

/*insercion de un miembro test*/
INSERT INTO curriculumweb.user VALUES(1, "rafael", "Vidal Pastor", "Ingeniero Software", "Valencia (España)","rvidal8.7@gmail.com","www.google.com","Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.");

CREATE TABLE curriculumweb.experience (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    charge VARCHAR(50) NOT NULL,
    company VARCHAR(50),
    dates VARCHAR(50),
    description VARCHAR(255)
    )ENGINE= InnoDB;

/*insercion de un miembro test*/
INSERT INTO curriculumweb.experience VALUES(1, "Junior Java Developer", "Sopra-Steria", "Noviembre 2015", "Trabajo trabajo trabajo");
INSERT INTO curriculumweb.experience VALUES(2, "Junior Java Developer", "Sopra", "Noviembre 2014", "Trabajo trabajo trabajo");

CREATE TABLE curriculumweb.activities (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_experience INT,
    description varchar(255),
    FOREIGN KEY (id_experience) 
        REFERENCES curriculumweb.experience(id)
) ENGINE = InnoDB;
INSERT INTO curriculumweb.activities VALUES(1, 1, "Desarrollo y mantenimiento de aplicaciones web y de escritorio. (JAVA, HTML, PHP)");
INSERT INTO curriculumweb.activities VALUES(2, 1, "Puesta en marcha y personalizacion de contenido web sobre plataformas CMS. (Joomla, Wordpress)");
INSERT INTO curriculumweb.activities VALUES(3, 2, "Instalación, configuración, mantenimiento y personalización de ERP-CRM (Dolibarr).");


CREATE TABLE curriculumweb.userexperience (
    user_id INT,
    experience_id INT,
    FOREIGN KEY (user_id) 
        REFERENCES curriculumweb.user(id),
    FOREIGN KEY (experience_id) 
        REFERENCES curriculumweb.experience(id)
) ENGINE = InnoDB;

INSERT INTO curriculumweb.userexperience VALUES(1,1);
INSERT INTO curriculumweb.userexperience VALUES(1,2);

CREATE TABLE curriculumweb.education (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    location VARCHAR(200) NOT NULL,
    dates VARCHAR(100),
    description VARCHAR(100),
    isIndependentCouse boolean
) ENGINE = InnoDB;

INSERT INTO curriculumweb.education VALUES(1, "Master en Ingenieria del Software", "Valencia","septiembre 25","Ingeniería del software: Se analizan las técnicas que se utilizan en la concepción y desarrollo de los sistemas software de última generación.",false);
INSERT INTO curriculumweb.education VALUES(2, "Ingeniero en Automatica y Electronica Industrial", "Valencia","septiembre 15","By utilizing elements and principles of Material Design, we were able to create a framework that incorporates components and", false);
INSERT INTO curriculumweb.education VALUES(3, "Dirección y gestion de Proyectos", "Valencia","septiembre 15","Curso sobre gestion de proyectos software.", true);


CREATE TABLE curriculumweb.usereducation (
    user_id INT,
    experience_id INT,
    FOREIGN KEY (user_id) 
        REFERENCES curriculumweb.user(id),
    FOREIGN KEY (experience_id) 
        REFERENCES curriculumweb.education(id)
) ENGINE = InnoDB;

INSERT INTO curriculumweb.usereducation VALUES(1,1);
INSERT INTO curriculumweb.usereducation VALUES(1,2);
INSERT INTO curriculumweb.usereducation VALUES(1,3);