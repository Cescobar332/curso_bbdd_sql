DELIMITER //
CREATE PROCEDURE AddEmployeeAndUpdateAverageSalary (
  IN p_FirstName VARCHAR(50),
  IN p_LastName VARCHAR(50),

  IN p_DepartmentID INT,
  IN P_Salary DECIMAL(10, 2),
  IN p_HireDate DATE, 
  OUT p_NewAverageSalary DECIMAL(10, 2)
)
BEGIN
  DECLARE v_AvgSalary DECIMAL(10, 2);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    -- Manejo de la excepción: Mostrar un mensaje de error
    SELECT 'Error: No se pudo completar la operación.' AS ErrorMessage;
    ROLLBACK; -- Deshacer todos los cambios realizados durante la transacción
  END;

  START TRANSACTION;-- inicia una transacción, todas las operaciones siguientes se consideran una transacción

  -- Insertar el nuevo empleado
  INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, HireDate)
  VALUES (p_FirstName, p_LastName, p_DepartmentID, p_Salary, p_HireDate);

  -- Calcular el nuevo salario promedio del departamento
  SELECT AVG(Salary)
  INTO v_AvgSalary
  FROM Employees
  WHERE DepartmentID = p_DepartmentID;

  -- Asignar el salario promedio calculado a la variable de salida
  SET p_NewAverageSalary = v_AvgSalary;

  COMMIT; -- confirma la transacción actual y guarda todos los cambios realizados
END //

DELIMITER ;
