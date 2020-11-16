
--SELECT emp_no,
--first_name,
--last_name
--FROM employees
--WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

--SELECT title,
--from_date,
--to_date
--FROM titles


SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- SELECT * FROM retirement_titles



SELECT DISTINCT ON (emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- SELECT * FROM unique_titles


SELECT COUNT(unique_titles.title), 
unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY unique_titles.title DESC;

--SELECT * FROM retiring_titles


SELECT DISTINCT ON (emp_no)employees.emp_no,
  employees.first_name,
  employees.last_name,
  employees.birth_date,
  dept_emp.from_date,
  dept_emp.to_date
  titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC;