-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
	-- joining tables dept_manager and departments to get dept_name
CREATE TABLE merged_dm_d AS 
	(SELECT dm.dept_no, d.dept_name, dm.emp_no 
	FROM dept_manager dm
	INNER JOIN departments d
	ON dm.dept_no = d.dept_no);
	
	-- joining the above merged table with employees table to get first and last names
SELECT mdmd.dept_no, mdmd.dept_name, mdmd.emp_no, e.last_name, e.first_name
FROM merged_dm_d mdmd
LEFT JOIN employees e
ON mdmd.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
	-- joining tables employees and dept_emp to get dept_no
CREATE TABLE merged_e_de AS 
	(SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
	FROM employees e
	LEFT JOIN dept_emp de
	ON e.emp_no = de.emp_no);
	
	-- joining the above merged table with departments table to get dept_name
SELECT mede.emp_no, mede.last_name, mede.first_name, mede.dept_no, d.dept_name
FROM merged_e_de mede
LEFT JOIN departments d
ON mede.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales')
	);

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE TABLE sales_dev_emp AS 
	(SELECT *
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales' or dept_name = 'Development')
);

CREATE TABLE merged_e_sde AS
	(SELECT e.emp_no, e.last_name, e.first_name, sde.dept_no
	FROM sales_dev_emp sde
	LEFT JOIN employees e
	ON e.emp_no = sde.emp_no
);

SELECT mesde.emp_no, mesde.last_name, mesde.first_name, d.dept_name
FROM merged_e_sde mesde
LEFT JOIN departments d
ON mesde.dept_no = d.dept_no;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
	COUNT (last_name) as last_name_count
	FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;




	


