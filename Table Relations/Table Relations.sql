-- Table Relations
create database demo2;
use demo2;

-- 1 
create table passports
(
	passport_id int primary key auto_increment,
    passport_number varchar(100)
    
);
create table people
(
	person_id int primary key auto_increment,
    first_name varchar(100) not null,
    salary decimal(7,2),
    passport_id int unique,
    foreign key (passport_id) references passports(passport_id)
);

insert into passports 
values (101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2');

insert into people
values
(1,'Roberto',43300.00, 102),
(2,'Tom',56100.00, 103),
(3,'Yana',60200.00, 101);



-- 2
create table manufacturers
(
manufacturer_id int primary key auto_increment,
name varchar(200) not null,
established_on date
);

create table models
(
model_id int primary key auto_increment,
name varchar(200) not null,
manufacturer_id int,
foreign key (manufacturer_id) references manufacturers(manufacturer_id)
);

insert into manufacturers
values
(1,'BMW','1916-03-01'),
(2,'Tesla','2003-01-01'),
(3,'Lada','1966-05-01');

insert into models values
(101,'X1',1),
(102,'i6',1),
(103,'Model S',2),
(104,'Model X',2),
(105,'Model 3',2),
(106,'Nova',3);


-- 3 
create table students
(
student_id int primary key auto_increment,
name varchar(200) not null
);

create table exams
(
exam_id int primary key auto_increment,
name varchar(200) not null
);

create table students_exams
(
student_id int,
exam_id int,
foreign key (student_id) references students(student_id),
foreign key (exam_id) references exams(exam_id),
primary key(student_id,exam_id)
);

insert into students values
(1,'Mila'),
(2,'Toni'),
(3,'Ron');

insert into exams values
(101,'Spring MVC'),
(102,'Neo4j'),
(103,'Oracle 11g');

insert into students_exams values
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103);


-- 4
create table teachers
(
teacher_id int primary key auto_increment,
name varchar(200) not null,
manager_id int,
foreign key (manager_id) references teachers(teacher_id) 
);

insert into teachers values
(101,'John',null),
(106,'Greta',101),
(102,'Maya',106),
(103,'Silvia',106),
(105,'Mark', 101),
(104,'Ted',105)
;

-- 5 
create database online_store;
use online_store;

create table item_types
(
item_type_id int primary key auto_increment,
name varchar(50) not null
);
create table items
(item_id int primary key auto_increment,
name varchar(50) not null,
item_type_id int,
foreign key(item_type_id) references item_types(item_type_id)
);

create table cities
(
city_id int primary key auto_increment,
name varchar(50) not null
);

create table customers
(
customer_id int primary key auto_increment,
name varchar(50) not null,
birthday date,
city_id int, 
foreign key(city_id) references cities(city_id)
);

create table orders 
(
order_id int primary key auto_increment,
customer_id int,
foreign key(customer_id) references customers(customer_id)
);

create table order_items
(order_id int,
item_id int,
foreign key (order_id) references orders(order_id),
foreign key (item_id) references items(item_id),
primary key(order_id,item_id)
);


-- 6 
CREATE DATABASE university;
USE university;

CREATE TABLE majors (
    major_id INT(11) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    student_id INT(11) PRIMARY KEY,
    student_number VARCHAR(12) NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    major_id INT(11),
    FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

CREATE TABLE subjects (
    subject_id INT(11) PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL
);

CREATE TABLE agenda (
    student_id INT(11),
    subject_id INT(11),
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE payments (
    payment_id INT(11) PRIMARY KEY,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(8,2) NOT NULL,
    student_id INT(11),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 9 
use geography;
select mountain_range,peak_name,elevation
from peaks p
join mountains m on p.mountain_id = m.id
where mountain_range = 'Rila'
order by elevation desc;
