/* Requirement 1 */
CREATE OR ALTER PROCEDURE dbo.InsertIntoDepartments (
	@DepartmentName NVARCHAR(50),
	@DepartmentDesc NVARCHAR(100)
)
AS
BEGIN;
	INSERT INTO dbo.Departments ( DepartmentName, DepartmentDesc )
	VALUES ( @DepartmentName, @DepartmentDesc );
END;
GO

/* Requirement 2 */
CREATE OR ALTER PROCEDURE dbo.ExecuteDepartmentInserts
AS
BEGIN;
	EXECUTE dbo.InsertIntoDepartments 'SQA', 'Software Quality Assurance';
	EXECUTE dbo.InsertIntoDepartments 'Engineering', 'Systems Design and Development';
	EXECUTE dbo.InsertIntoDepartments 'TechSupport', 'Technical Support';
END;
GO

/* Requirement 3 */
CREATE OR ALTER FUNCTION dbo.GetDepartmentID (
	@DepartmentName NVARCHAR(50)
	)
RETURNS INT
AS
BEGIN;
	DECLARE @DepartmentID INT;

	SELECT @DepartmentID = DepartmentID
	FROM dbo.Departments
	WHERE DepartmentName = @DepartmentName;

	RETURN @DepartmentID;
END;
GO

/* Requirement 4 */
CREATE OR ALTER PROCEDURE dbo.InsertIntoEmployees (
	@DepartmentName NVARCHAR(50),
	@EmployeeFirstName NVARCHAR(50),
	@EmployeeLastName NVARCHAR (50),
	@Salary MONEY = 45000,
	@FileFolder NVARCHAR(256),
	@ManagerFirstName NVARCHAR(50),
	@ManagerLastName NVARCHAR(50),
	@CommissionBonus MONEY = 1500
)
AS
BEGIN;
SET XACT_ABORT ON;
	BEGIN TRANSACTION;
		DECLARE @GetDepartmentIDResult INT;
		DECLARE @GetEmployeeIDResult INT;
		IF (SELECT dbo.GetDepartmentID ( @DepartmentName )) IS NULL
			BEGIN;
				INSERT INTO dbo.Departments	(DepartmentName)
				VALUES (@DepartmentName);
			END;
		SELECT @GetDepartmentIDResult = dbo.GetDepartmentID ( @DepartmentName );
	
		IF (SELECT dbo.GetEmployeeID ( @ManagerFirstName, @ManagerLastName ) ) IS NULL
			BEGIN;
				INSERT INTO dbo.Employees (FirstName, LastName)
				VALUES (@ManagerFirstName, @ManagerLastName);
			END;
		SELECT @GetEmployeeIDResult = dbo.GetEmployeeID ( @ManagerFirstName, @ManagerLastName );

		INSERT INTO dbo.Employees (DepartmentID, ManagerEmployeeID, FirstName, LastName, Salary, CommissionBonus, FileFolder)
			VALUES ( @GetDepartmentIDResult, @GetEmployeeIDResult, @EmployeeFirstName, @EmployeeLastName, @Salary, @CommissionBonus, @FileFolder);
	COMMIT TRANSACTION;
END;
GO

/* Requirement 5 */
CREATE OR ALTER FUNCTION dbo.SalaryGreaterThanTable (
	@Salary MONEY
)
RETURNS @ResultTable TABLE (
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Salary MONEY,
	CommissionBonus MONEY,
	FileFolder NVARCHAR(256),
	DepartmentName NVARCHAR(50),
	DepartmentDesc NVARCHAR(100)
)
AS 
BEGIN;

	IF ( @Salary < 0 )
	BEGIN;
		RETURN;
	END;

	INSERT INTO @ResultTable
		SELECT e.FirstName, e.LastName, e.Salary, e.CommissionBonus, e.FileFolder, d.DepartmentName, d.DepartmentDesc
		FROM dbo.Employees e
		INNER JOIN dbo.Departments d
		ON e.DepartmentID = d.DepartmentID 
		WHERE e.Salary > @Salary;

	RETURN;
END;
GO

/* Requirement 6 */
WITH CommissionByEmployee AS (
	SELECT 
		e.FirstName, 
		e.LastName, 
		e.CommissionBonus, 
		e.Salary,
		d.DepartmentName,
		d.DepartmentID,
		SUM(CommissionBonus + Salary) AS TotalCompensation
	FROM dbo.Employees e
	INNER JOIN dbo.Departments d
	ON e.DepartmentID = d.DepartmentID
	GROUP BY e.CommissionBonus, e.FirstName, e.LastName, e.Salary, d.DepartmentName, d.DepartmentID
	)
SELECT 
	FirstName,
	LastName,
	CommissionBonus,
	LAG(FirstName) OVER ( ORDER BY CommissionBonus DESC ) + ' ' + LAG(LastName) OVER ( ORDER BY CommissionBonus DESC ) AS NextHighestName,
	LAG(CommissionBonus) OVER ( ORDER BY CommissionBonus DESC ) AS NextHighestCommission,
	AVG(CommissionBonus) OVER () AS AverageEmployeeCommission,
	DepartmentName,
	AVG(CommissionBonus) OVER ( PARTITION BY DepartmentID ) AS AverageDepartmentCommission,
	TotalCompensation
FROM CommissionByEmployee
ORDER BY CommissionBonus DESC;

/* Requirement 7 */
WITH EmployeesByManager ( EmployeeFirstName, EmployeeLastName, DepartmentID, FileFolder, ManagerFirstName, ManagerLastName) AS
(
	SELECT FirstName AS ManagerFirstName, LastName AS ManagerLastName, DepartmentID, FileFolder, EmployeeID
	FROM dbo.Employees
	WHERE ManagerEmployeeID IS NULL
	UNION ALL
	SELECT e.FirstName AS EmployeeFirstName, 
	e.LastName AS EmployeeLastName, 
	e.DepartmentID, 
	ebm.ManagerFirstName, 
	ebm.ManagerLastName, 
	ebm.ManagerFirstName + ebm.ManagerLastName + '\' + e.FirstName + e.LastName + '\' AS FileFolder
	FROM dbo.Employees e 
	JOIN EmployeesByManager ebm
		ON e.ManagerEmployeeID = ebm.EmployeeID
)
SELECT *
FROM EmployeesByManager;