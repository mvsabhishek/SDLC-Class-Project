CREATE DATABASE IF NOT EXISTS innovation_hub_inventory;

USE innovation_hub_inventory;

CREATE TABLE IF NOT EXISTS material (
    material_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
    material_name VARCHAR(150) NOT NULL,
    description VARCHAR(500),
    sold_per VARCHAR(100),
    price FLOAT NOT NULL,
    quantity FLOAT,
    PRIMARY KEY (material_id)
);


CREATE TABLE IF NOT EXISTS staff(
   asu_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
   first_name VARCHAR(150) NOT NULL,
   last_name VARCHAR(150) NOT NULL,
   email VARCHAR(200) NOT NULL UNIQUE,
   staff_password  VARCHAR(20) NOT NULL,
   role VARCHAR(100),
   PRIMARY KEY ( asu_id )
);


CREATE TABLE IF NOT EXISTS faculty(
   asu_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
   first_name VARCHAR(150) NOT NULL,
   last_name VARCHAR(150) NOT NULL,
   email VARCHAR(200) NOT NULL UNIQUE,
   faculty_password  VARCHAR(20) NOT NULL,
   account_number BIGINT NOT NULL UNIQUE,
   PRIMARY KEY ( asu_id )
);


CREATE TABLE IF NOT EXISTS student(
   asu_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
   first_name VARCHAR(150) NOT NULL,
   last_name VARCHAR(150) NOT NULL,
   email VARCHAR(200) NOT NULL UNIQUE,
   student_password  VARCHAR(20) NOT NULL,
   account_number BIGINT NOT NULL UNIQUE,
   PRIMARY KEY ( asu_id )
);

CREATE TABLE IF NOT EXISTS project(
   project_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
   project_name VARCHAR(150) NOT NULL,
   description VARCHAR(1000) NOT NULL,
   course_id VARCHAR(10),
   faculty_id BIGINT NOT NULL,
   account_number BIGINT NOT NULL,
   PRIMARY KEY ( project_id ),
   FOREIGN KEY (faculty_id)
        REFERENCES faculty(asu_id)
);


CREATE TABLE IF NOT EXISTS purchase(
   purchase_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
   project_id BIGINT,
   cost FLOAT NOT NULL,
   approval_status VARCHAR(50),
   PRIMARY KEY ( purchase_id ),
   FOREIGN KEY (project_id)
        REFERENCES project(project_id)
);

CREATE TABLE IF NOT EXISTS works_on (
	project_id BIGINT NOT NULL ,
    student_id BIGINT NOT NULL,
    FOREIGN KEY (project_id)
        REFERENCES project(project_id),
	FOREIGN KEY (student_id)
        REFERENCES student(asu_id)
);

CREATE TABLE IF NOT EXISTS faculty_makes_purchase(
   faculty_id BIGINT NOT NULL,
   purchase_id BIGINT NOT NULL,
   material_id BIGINT NOT NULL,
   purchase_quantity FLOAT NOT NULL,
   FOREIGN KEY (faculty_id)
        REFERENCES faculty(asu_id),
	FOREIGN KEY (purchase_id)
        REFERENCES purchase(purchase_id),
	FOREIGN KEY (material_id)
        REFERENCES material(material_id)
);

CREATE TABLE IF NOT EXISTS student_makes_purchase(
   student_id BIGINT NOT NULL,
   purchase_id BIGINT NOT NULL,
   material_id BIGINT NOT NULL,
   Purchase_quantity FLOAT NOT NULL,
   FOREIGN KEY (student_id)
        REFERENCES student(asu_id),
	FOREIGN KEY (purchase_id)
        REFERENCES purchase(purchase_id),
	FOREIGN KEY (material_id)
        REFERENCES material(material_id)
);



INSERT INTO material (material_name,description,sold_per,price,quantity)
 VALUES (
"Vinyl", "Color ($0.55)","linear ft", 0.55, 100
);
INSERT INTO material (material_name,description,sold_per,price,quantity)
VALUES (
"Vinyl", "Heat transfer ($3.00)","linear ft", 3.00, 100
);
INSERT INTO material (material_name,description,sold_per,price,quantity)
VALUES (
"Lumber", "2\"x4\" ($0.34)","linear ft", 0.34, 100
);
INSERT INTO material (material_name,description,sold_per,price,quantity)
 VALUES (
"Lumber", "4\"x4\" ($0.94)","linear ft", 0.94, 100
);
INSERT INTO material (material_name,description,sold_per,price,quantity)
VALUES (
"Acrylic", "Clear 1/8\" ($3.00)","sqft", 3.00, 100
);
INSERT INTO material (material_name,description,sold_per,price,quantity)
VALUES (
"Acrylic", "Clear 1/4\" ($5.00)","sqft", 5.00, 100
);
INSERT INTO material (material_name,description,sold_per,price,quantity)
VALUES (
"Acrylic", "Color 1/8\" ($5.00)","sqft", 5.00, 100
);


INSERT INTO staff (first_name, last_name, email, staff_password, role)
 VALUES (
"Renu","Chaw", "rchaw21@asu.edu", "1234", "Admin"
);
INSERT INTO staff (first_name, last_name, email, staff_password, role)
VALUES (
"Ann","cela", "acela4@asu.edu", "1234", "Accountant"
);


INSERT INTO faculty (first_name, last_name, email,faculty_password, account_number)
VALUES (
"Usha","Jagannathan", "usha1@asu.edu","1234", 12121212
);
INSERT INTO faculty (first_name, last_name, email,faculty_password, account_number)
VALUES (
"Damien","Doheny", "damein1@asu.edu","1234", 12121213
);

INSERT INTO student (first_name, last_name, email, student_password, account_number)
VALUES (
"Ramya","Chandrashekar", "rchand21@asu.edu","1234", 12121214
);
INSERT INTO student (first_name, last_name, email,student_password, account_number)
VALUES (
"Mohan","Suraj", "mlakshm5@asu.edu","1234", 12121215
);
INSERT INTO student (first_name, last_name, email,student_password, account_number)
VALUES (
"Siva","Abhisek", "msiva5@asu.edu","1234", 12121216
);


INSERT INTO project (project_name, description, course_id, faculty_id, account_number)
VALUES (
"Inventory Management","Innovation hub Inventory Management", "IFT540", 1, 12121222
);
INSERT INTO project (project_name, description, course_id, faculty_id, account_number)
VALUES (
"Credit card authentication","card theft tracking", "IFT540", 1, 12121222
);


INSERT INTO purchase (project_id, cost, approval_status)
VALUES (
1,30,"Pending"
);
INSERT INTO purchase (project_id, cost, approval_status)
VALUES (
2,35,"Pending"
);
INSERT INTO purchase (project_id, cost, approval_status)
VALUES (
1,30,"Pending"
);
INSERT INTO purchase ( cost, approval_status)
VALUES (
30,"Pending"
);
INSERT INTO purchase ( cost, approval_status)
VALUES (
30,"Pending"
);


INSERT INTO works_on (project_id, student_id )
VALUES (
1,1
);
INSERT INTO works_on (project_id, student_id )
VALUES (
1,2
);


INSERT INTO faculty_makes_purchase (faculty_id, purchase_id, material_id, purchase_quantity )
VALUES (
1,4,1,10
);

INSERT INTO student_makes_purchase (student_id, purchase_id, material_id, purchase_quantity )
VALUES (
1,5,1,10
);
