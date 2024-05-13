CREATE DATABASE shopdb;

CREATE TABLE goods
(
    Id_vendorcode CHARACTER VARYING(50) PRIMARY KEY,
    name CHARACTER VARYING(100) NOT NULL,
    description TEXT NOT NULL,
    size INTEGER CHECK (size > 10) not null,
    color CHARACTER VARYING(50),
    weight NUMERIC
);

CREATE DOMAIN linktype AS VARCHAR 
NOT NULL 
DEFAULT 'internal'
CHECK(
   VALUE ~ 'external'
OR VALUE ~ 'internal'
);

CREATE TABLE foto
(
	id_foto SERIAL PRIMARY key,
	link CHARACTER VARYING(250),
	ltype linktype,
	goodsid CHARACTER VARYING(50),
	FOREIGN KEY (goodsid) REFERENCES goods (Id_vendorcode)
);

CREATE TABLE video
(
	id_video SERIAL PRIMARY key,
	link CHARACTER VARYING(250),
	ltype linktype,
	goodsid CHARACTER VARYING(50),
	FOREIGN KEY (goodsid) REFERENCES goods (Id_vendorcode)
);

CREATE TABLE answers
(
	id_answer SERIAL PRIMARY KEY,
	answer TEXT NOT NULL
);

CREATE TABLE questions
(
	id_qustion SERIAL PRIMARY KEY,
	question TEXT NOT NULL,
	name CHARACTER VARYING(50),
	email CHARACTER VARYING(50),
	goodsid CHARACTER VARYING(50),
	FOREIGN KEY (goodsid) REFERENCES goods (id_vendorcode),
	answerid INTEGER UNIQUE,
	FOREIGN KEY (answerid) REFERENCES answers (id_answer),
	answerid_question_new INTEGER,
	FOREIGN KEY (answerid_question_new) REFERENCES answers (id_answer)
);

CREATE TABLE reviews
(
	id_review SERIAL PRIMARY KEY,
	review text,
	grade INTEGER NOT NULL,
	CHECK(grade >= 1 AND grade <= 5),
	telephone INTEGER NOT NULL,
	confirmation_code INTEGER UNIQUE NOT NULL,
	check_confirmation_code CHARACTER VARYING(5) default 'false',
	CHECK(check_confirmation_code = 'true' OR check_confirmation_code = 'false'),
	useful INTEGER,
	useless INTEGER,
	goodsid CHARACTER VARYING(50),
	FOREIGN KEY (goodsid) REFERENCES goods (id_vendorcode)
);

CREATE DOMAIN filter_typeone_gender AS TEXT 
CHECK(
   VALUE ~ 'мужская'
OR VALUE ~ 'женская'
);

CREATE DOMAIN filter_typetwo_age AS TEXT 
CHECK(
   VALUE ~ 'детская'
OR VALUE ~ 'взрослая'
);

CREATE DOMAIN filter_typethree_group AS TEXT 
CHECK(
   VALUE ~ 'верхняя'
OR VALUE ~ 'нижняя'
);

CREATE DOMAIN filter_typefour_season AS TEXT 
CHECK(
   VALUE ~ 'зима'
OR VALUE ~ 'весна'
OR VALUE ~ 'лето'
OR VALUE ~ 'осень'
);

CREATE TABLE goods_filter
(
	id_goods_filter SERIAL PRIMARY KEY,
	goodsid CHARACTER VARYING(50) UNIQUE,
	FOREIGN KEY (goodsid) REFERENCES goods (id_vendorcode),
	typeone_gender filter_typeone_gender NOT NULL,
	typetwo_age filter_typetwo_age NOT NULL,
	typethree_group filter_typethree_group NOT NULL,
	typefour_season filter_typefour_season NOT NULL,
	typefive_cloth text NOT NULL
);