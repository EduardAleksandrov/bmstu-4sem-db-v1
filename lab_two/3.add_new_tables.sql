CREATE TABLE course
(
    id_course SERIAL primary key,
    c_name CHARACTER VARYING(150) not null,
    c_date DATE
);

CREATE TABLE cpicture
(
    id_cpicture SERIAL primary key,
   	page_position integer default 0,
    reference CHARACTER VARYING(500),
    courseid integer,
    FOREIGN KEY (courseid) REFERENCES course (id_course) ON DELETE SET null,
    constraint position_cpic_check CHECK(page_position >= 0 AND page_position < 150)
);

CREATE TABLE cvideo
(
    id_cvideo SERIAL primary key,
   	page_position integer default 0,
    reference CHARACTER VARYING(500),
    courseid integer,
    FOREIGN KEY (courseid) REFERENCES course (id_course) ON DELETE SET null,
    constraint position_cvid_check CHECK(page_position >= 0 AND page_position < 150)
);

CREATE TABLE ctext
(
    id_ctest SERIAL primary key,
   	page_position integer default 0,
    page_text text,
    courseid integer,
    FOREIGN KEY (courseid) REFERENCES course (id_course) ON DELETE SET null,
    constraint position_ctxt_check CHECK(page_position >= 0 AND page_position < 150)
);

CREATE TABLE status
(
	id_status SERIAL primary key,
   	status CHARACTER VARYING(50)
);

CREATE TABLE assigned_courses
(
    courseid integer,
    userid integer,
    statusid integer,
    FOREIGN KEY (courseid) REFERENCES course (id_course) ON DELETE SET null,
    FOREIGN KEY (userid) REFERENCES users (id_user) ON DELETE SET null,
    FOREIGN KEY (statusid) REFERENCES status (id_status) ON DELETE SET null,
	PRIMARY KEY(courseid, userid)
);