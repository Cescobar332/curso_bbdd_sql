CREATE PROCEDURE spInsertEmployee
  @FirstName NVARCHAR(50),
  @LastName NVARCHAR(50),
  @DepartmentID INT,
  @Salary DECIMAL(10, 2),
  @HireDate DATE
AS
BEGIN
  INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, HireDate)
  VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @HireDate);
END;

CALL spInsertEmployee( 'Maria', 'Lopez', 2, 72000.00, '2024-05-01');
EXEC spInsertEmployee( 'Maria', 'Lopez', 2, 72000.00, '2024-05-01');
