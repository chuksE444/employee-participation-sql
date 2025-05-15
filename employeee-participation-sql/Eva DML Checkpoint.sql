-- Use the existing database
USE EmployeeParticipationDB;
GO

-- Step 1: Drop existing tables if they exist (in reverse dependency order)
IF OBJECT_ID('Employee_Project', 'U') IS NOT NULL
    DROP TABLE Employee_Project;
GO

IF OBJECT_ID('Project', 'U') IS NOT NULL
    DROP TABLE Project;
GO

IF OBJECT_ID('Employee', 'U') IS NOT NULL
    DROP TABLE Employee;
GO

IF OBJECT_ID('Department', 'U') IS NOT NULL
    DROP TABLE Department;
GO

-- Step 2: Recreate tables

-- Department Table
CREATE TABLE Department (
    Num_S INT PRIMARY KEY,
    Label VARCHAR(255) NOT NULL,
    Manager_Name VARCHAR(255) NOT NULL
);
GO

-- Employee Table
CREATE TABLE Employee (
    Num_E INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);
GO

-- Project Table
CREATE TABLE Project (
    Num_P INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE,
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);
GO

-- Employee_Project Table
CREATE TABLE Employee_Project (
    Employee_Num_E INT,
    Project_Num_P INT,
    Role VARCHAR(255) NOT NULL,
    PRIMARY KEY (Employee_Num_E, Project_Num_P),
    FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E),
    FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P)
);
GO

-- Insert departments into the Department table
INSERT INTO Department (Num_S, Label, Manager_Name)
VALUES 
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');

-- Insert employees into the Employee table
INSERT INTO Employee (Num_E, Name, Position, Salary, Department_Num_S)
VALUES 
(101, 'John Doe', 'Developer', 60000.00, 1),     
(102, 'Jane Smith', 'Analyst', 55000.00, 2), 
(103, 'Mike Brown', 'Designer', 50000.00, 3), 
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),     
(105, 'Emma Wilson', 'Hr specialist', 52000.00, 2); 

-- Insert projects into the Project table
INSERT INTO Project (Num_P, Title, Start_Date, End_Date, Department_Num_S)
VALUES 
(201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),   
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),  
(203, 'Markert Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

-- Insert employee project participation with roles
INSERT INTO Employee_Project (Employee_Num_E, Project_Num_P, Role)
VALUES 
(101, 201, 'Frontend Developer'),       
(104, 201, 'Backend Developer'),          
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),       
(103, 203, 'Research Lead'),          
(101, 204, 'Network Specialist');

-- Update role of employee 101 in Employee_Project
UPDATE Employee_Project
SET Role = 'Full Stack Developer'
WHERE Employee_Num_E = 101;

-- First, delete project participation for employee 103
DELETE FROM Employee_Project
WHERE Employee_Num_E = 103;

-- Then, delete the employee from Employee table
DELETE FROM Employee
WHERE Num_E = 103;
















