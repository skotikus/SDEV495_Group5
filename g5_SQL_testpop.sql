
CREATE TABLE g5_users (
  user_id INTEGER PRIMARY KEY,
  email  VARCHAR(75) NOT NULL UNIQUE,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(75) NOT NULL
);


CREATE TABLE roles (
  role_id INTEGER PRIMARY KEY,
  role varchar(20) NOT NULL UNIQUE
);


CREATE TABLE user_info (
  user_id INTEGER Primary Key, 
  password  VARCHAR(40)  NOT NULL,
  CONSTRAINT fk_wu2 Foreign Key (user_id) 
  references  g5_users(user_id) on delete cascade   
);


CREATE TABLE user_roles (
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  Constraint PKUR primary key (user_id, role_id),
  Constraint fk_ur1 Foreign Key (user_id) references  
   g5_users(user_id) on delete cascade,   
  Constraint fk_ur2 Foreign Key (role_id) references  
   roles(role_id) on delete cascade    
);

CREATE TABLE `location_info` (
  `location_id` int(11) NOT NULL,
  `address_street` varchar(40) NOT NULL,
  `address_city` varchar(20) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `loc_name` varchar(15) NOT NULL,
  PRIMARY KEY (`location_id`)
);


insert into g5_users (user_id, email, firstname, lastname)
values (1,'scott@nurvox.com','Scott', 'Forsyth');
insert into g5_users (user_id, email, firstname, lastname)
values (2,'ryan.q.stewart@gmail.com','Ryan', 'Stewart');
insert into g5_users (user_id, email, firstname, lastname)
values (3,'abellmio@gmail.com','Andrew', 'Bellmio');
insert into g5_users (user_id, email, firstname, lastname)
values (4,'nathan.clavelli@yahoo.com','Nathan', 'Clavelli');


insert into user_info (user_id, password) values (1,'TestPass');
insert into user_info (user_id, password) values (2,'TestPass');
insert into user_info (user_id, password) values (3,'TestPass');
insert into user_info (user_id, password) values (4,'TestPass');


insert into roles (role_id, role) values (1,'Worker');
insert into roles (role_id, role) values (2,'Manager');
insert into roles (role_id, role) values (3,'Admin');


insert into user_roles (user_id, role_id) values (1,1);
insert into user_roles (user_id, role_id) values (1,2);
insert into user_roles (user_id, role_id) values (1,3);
insert into user_roles (user_id, role_id) values (2,1);
insert into user_roles (user_id, role_id) values (2,2);
insert into user_roles (user_id, role_id) values (2,3);
insert into user_roles (user_id, role_id) values (3,1);
insert into user_roles (user_id, role_id) values (3,2);
insert into user_roles (user_id, role_id) values (3,3);
insert into user_roles (user_id, role_id) values (4,1);
insert into user_roles (user_id, role_id) values (4,2);
insert into user_roles (user_id, role_id) values (4,3);

INSERT INTO location_info (location_id, address_street,address_city,zipcode,loc_name) VALUES (1,'5882 Orci Rd.','Surat','51754','HQ');
INSERT INTO location_info (location_id, address_street,address_city,zipcode,loc_name) VALUES (2,'1592 Sociis Av.','Zwolle','75453','WareHouse 1');
INSERT INTO location_info (location_id, address_street,address_city,zipcode,loc_name) VALUES (3,'3254 Eleifend. Ave','Anklam','30587','WareHouse 2');
INSERT INTO location_info (location_id, address_street,address_city,zipcode,loc_name) VALUES (4,'1901 Etiam St.','Magangué','19261','Annex');
INSERT INTO location_info (location_id, address_street,address_city,zipcode,loc_name) VALUES (5,'4036 Ipsum. Rd.','Tomohon','00286','Storage Pod');