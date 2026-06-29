USE pwelett_hackard;
-- Q1 : List the following details of each employee: employee number, last name, first name, gender, and salary.
-- TABLE employees 
--    emp_no INT PRIMARY KEY,
--    birth_date DATE,
--    first_name VARCHAR(50),
--    last_name VARCHAR(50),
--    gender ENUM('M','F'),
--    hire_date DATE

select e.emp_no,
       e.last_name,
       e.first_name,
       e.last_name,
       e.gender
from employees e
join salaries s 
on e.emp_no = s.emp_no ; 

-- Q2 : List employees who were hired in 1986.
select emp_no,
       last_name,
       first_name,
       hire_date 
from employees 
where year(hire_date) = 1986;

-- Q3 : List the manager of each department with the following information: department number, department name, the
-- manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no,
       d.dept_name,
       e.emp_no,
       e.last_name,
       e.first_name,
       dm.from_date,
       dm.to_date
from dept_manager dm 
join departments d
on dm.dept_no = d.dept_no
join employees e 
on dm.emp_no = e.emp_no;

-- Q4 : List the department of each employee with the following information: employee number, last name, first name, and
-- department name.
select e.emp_no,
       e.last_name,
       e.first_name,
       d.dept_name
from dept_emp de 
join departments d
on de.dept_no = d.dept_no
join employees e 
on de.emp_no = e.emp_no;

-- Q5 : List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees  where (first_name like lower('hercules') && last_name like lower('b%'));

-- Q6 : List all employees in the Sales department, including their 
-- employee number, last name, first name, and department
select e.emp_no, 
       e.last_name, 
       e.first_name, 
       d.dept_name 
from employees e 
join dept_emp de 
on e.emp_no = de.emp_no
join departments d 
on d.dept_no = de.dept_no
where dept_name like 'sales';

-- Q7 : List all employees in the Sales and Development departments, including , their 
-- employee number, last name, first
-- name, and department name.
select e.emp_no, 
       e.last_name, 
       e.first_name, 
       d.dept_name 
from employees e 
join dept_emp de 
on e.emp_no = de.emp_no
join departments d 
on d.dept_no = de.dept_no
where d.dept_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
       COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

       



