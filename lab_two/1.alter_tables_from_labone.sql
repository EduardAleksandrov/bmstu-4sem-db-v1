ALTER TABLE departments  
add primary key (id_department);

ALTER TABLE departments  
ALTER COLUMN dep_name 
SET NOT NULL;

ALTER TABLE users 
add primary key (id_user);

ALTER TABLE users  
ALTER COLUMN surname
SET NOT NULL;

ALTER TABLE users  
ALTER COLUMN "name" 
SET NOT NULL;

ALTER TABLE users  
ALTER COLUMN birthday 
SET NOT NULL;




ALTER TABLE users
ADD departmentId integer;

ALTER TABLE users
ADD FOREIGN KEY (departmentid) REFERENCES departments (id_department);

ALTER TABLE users  
ALTER COLUMN departmentid 
SET NOT NULL;




ALTER TABLE authorizations
ADD userid integer;

ALTER TABLE authorizations 
ADD FOREIGN KEY (userid) REFERENCES users (id_user);

ALTER TABLE authorizations  
ALTER COLUMN userid 
SET NOT NULL;

ALTER TABLE authorizations 
add primary key (id_authorization);





ALTER TABLE authorizations  ADD CONSTRAINT FK_unique UNIQUE (userid);
