-- Select the table(Employee_Project)
SELECT*FROM Employee_Project

-- Retrieve the names of employees who are assigned to more than one project,
-- along with the total number of projects each is involved in.
SELECT e.Name, COUNT(ep.Project_Num_P) AS Project_Count
FROM Employee_Project ep
JOIN Employee e ON ep.Employee_Num_E = e.Num_E
GROUP BY e.Name
HAVING COUNT(ep.Project_Num_P) > 1;


SELECT* FROM Department 
-- Retrieve projects along with the department label and manager's name
SELECT 
    p.Title AS Project_Title,
    d.Label AS Department_Label,
    d.Manager_Name
FROM 
    Project p
JOIN 
    Department d ON p.Department_Num_S = d.Num_S;


	-- Retrieve names and roles of employees working on 'Website Redesign'
SELECT 
    e.Name AS Employee_Name,
    ep.Role
FROM 
    Employee_Project ep
JOIN 
    Employee e ON ep.Employee_Num_E = e.Num_E
JOIN 
    Project p ON ep.Project_Num_P = p.Num_P
WHERE 
    p.Title = 'Website Redesign';


-- Retrieve the department with the highest number of employees
SELECT TOP 1 
    d.Label AS Department_Label,
    d.Manager_Name,
    COUNT(e.Num_E) AS Total_Employees
FROM 
    Department d
JOIN 
    Employee e ON d.Num_S = e.Department_Num_S
GROUP BY 
    d.Label, d.Manager_Name
ORDER BY 
    Total_Employees DESC;


-- Retrieve names and positions of employees earning over 60,000, including their department names
SELECT 
    e.Name AS Employee_Name,
    e.Position,
    d.Label AS Department_Name,
    e.Salary
FROM 
    Employee e
JOIN 
    Department d ON e.Department_Num_S = d.Num_S
WHERE 
    e.Salary > 60000;

-- Retrieve the number of employees assigned to each project along with the project title
SELECT 
    p.Title AS Project_Title,
    COUNT(ep.Employee_Num_E) AS Employee_Count
FROM 
    Project p
JOIN 
    Employee_Project ep ON p.Num_P = ep.Project_Num_P
GROUP BY 
    p.Title;


-- Retrieve a summary of employee roles across projects
SELECT 
    e.Name AS Employee_Name,
    p.Title AS Project_Title,
    ep.Role
FROM 
    Employee_Project ep
JOIN 
    Employee e ON ep.Employee_Num_E = e.Num_E
JOIN 
    Project p ON ep.Project_Num_P = p.Num_P;


-- Retrieve total salary expenditure for each department
SELECT 
    d.Label AS Department_Label,
    d.Manager_Name,
    SUM(e.Salary) AS Total_Salary_Expenditure
FROM 
    Department d
JOIN 
    Employee e ON d.Num_S = e.Department_Num_S
GROUP BY 
    d.Label, d.Manager_Name;


