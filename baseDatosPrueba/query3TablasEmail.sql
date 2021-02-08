-- use enterprises

SELECT employee.firstname, employee.lastname, companyemployee.company, employeeacounts.backname, companyemployee.companyemail  FROM employee inner join companyemployee on 
employee.employeeid=companyemployee.employee_employeeid 
inner join employeeacounts on employee.employeeid = employeeacounts.employee_employeeid;