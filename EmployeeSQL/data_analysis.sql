/* 1. List the employee number, last name, first name, sex, and salary of each employee. */
SELECT employees.emp_no,
    last_name,
    first_name,
    sex,
    salary
FROM employees
    JOIN salaries ON employees.emp_no = salaries.emp_no;
/* 2. List the first name, last name, and hire date for the employees who were hired in 1986. */
SELECT first_name,
    last_name,
    hire_date
FROM employees
WHERE EXTRACT(
        YEAR
        FROM hire_date
    ) = 1986;
/* 3. List the manager of each department along with their department number, department name, employee number, last name, and first name. */
SELECT dm.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name,
    dm.dept_no,
    departments.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM dept_manager dm
    JOIN employees e ON dm.emp_no = e.emp_no
    JOIN departments ON dm.dept_no = departments.dept_no;
/* 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name. */
SELECT e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name,
    de.dept_no
FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no;
/* 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B. */
SELECT first_name,
    last_name,
    sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';
/* 6. List each employee in the Sales department, including their employee number, last name, and first name. */
SELECT e.emp_no,
    e.last_name,
    e.first_name
FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
/* 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name. */
SELECT e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');
/* 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name). */
SELECT last_name,
    COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;