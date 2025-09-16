WITH cte_name
AS
(
  -- Subconsulta
  SELECT column1, column2
  FROM table
  WHERE condition+
)
-- Consulta principal que utiliza la CTE
SELECT column1, column2, ...
  FROM cte_name
WHERE condition;

-- Ejemplo
-- Calcular el salario promedio por departamento y seleccionar los departamentos con salario promedio superior a 65000
WITH AverageSalaries AS (
  SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary
  FROM Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID
  GROUP BY d.DepartmentName
)
SELECT DepartmentName, AvgSalary
FROM AverageSalaries
WHERE AvgSalary > 65000;
