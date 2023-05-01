CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR(40) NOT NULL
);
-- imported table

CREATE TABLE salaries (
	emp_no SERIAL PRIMARY KEY,
	salary INT
);
-- imported table

CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR(40) NOT NULL
);
-- imported table

CREATE TABLE employees (
	emp_no SERIAL PRIMARY KEY,
	emp_title_id VARCHAR(30),
	birth_date VARCHAR(40),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex VARCHAR(10),
	hire_date VARCHAR(40),
	FOREIGN KEY (emp_title_id) references titles(title_id),
	FOREIGN KEY (emp_no) references salaries(emp_no)
);
-- impored table

CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	emp_no SERIAL PRIMARY KEY,
	FOREIGN KEY (dept_no) references departments(dept_no),
	FOREIGN KEY (emp_no) references salaries(emp_no)
);
-- imported table

CREATE TABLE dept_emp (
	emp_no SERIAL NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) references departments(dept_no)
);
-- imported table