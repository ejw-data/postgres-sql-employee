-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
Select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
From employees, salaries
Where employees.emp_no = salaries.emp_no

-- 2. List employees who were hired in 1986.
Select employees.emp_no, employees.last_name, employees.first_name, employees.hire_date
From employees
Where Extract(Year FROM hire_date) = 1986

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
Select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
From departments
INNER Join dept_manager On departments.dept_no = dept_manager.dept_no
Inner Join employees On employees.emp_no = dept_manager.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Inner Join dept_emp on dept_emp.emp_no = employees.emp_no
Inner Join departments on dept_emp.dept_no = departments.dept_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
Select employees.first_name, employees.last_name
From employees
Where employees.first_name = 'Hercules' AND
LEFT(employees.last_name, 1) = 'B'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Inner Join dept_emp on dept_emp.emp_no = employees.emp_no
Inner Join departments on dept_emp.dept_no = departments.dept_no
Where dept_emp.dept_no = 'd007'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Inner Join dept_emp on dept_emp.emp_no = employees.emp_no
Inner Join departments on dept_emp.dept_no = departments.dept_no
Where dept_emp.dept_no = 'd007' OR dept_emp.dept_no = 'd005'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select employees.last_name, count(employees.last_name)
From employees
Group By employees.last_name
Order By count(employees.last_name) DESC

