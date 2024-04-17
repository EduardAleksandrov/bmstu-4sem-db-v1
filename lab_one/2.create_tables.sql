CREATE TABLE departments
(
    Id_department SERIAL,
    Dep_name CHARACTER VARYING(150),
    Dep_manager CHARACTER VARYING(100)
);
CREATE TABLE users
(
    Id_user SERIAL,
    Surname CHARACTER VARYING(50),
    Name CHARACTER VARYING(50),
    Middle_name CHARACTER VARYING(50),
    Birthday DATE 
);
CREATE TABLE authorizations
(
    Id_authorization SERIAL,
    User_email CHARACTER VARYING(50),
    Password CHARACTER VARYING(50)
);