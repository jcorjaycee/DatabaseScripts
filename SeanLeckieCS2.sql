/* Requirement 1 */
CREATE OR ALTER PROCEDURE dbo.GetPersonBySIN ( 
	@SIN char(9) )
AS
BEGIN;
	SELECT p.PersonID
	FROM dbo.Person p
	WHERE p.SIN = @SIN
END;
GO

/* Requirement 2 */
CREATE OR ALTER PROCEDURE dbo.CreatePerson ( 
	@SIN CHAR(9),
	@FirstName NVARCHAR(60),
	@LastName NVARCHAR(60),
	@FatherSIN CHAR(9),
	@MotherSIN CHAR(9),
	@DateOfBirth DATE = NULL,
	@DateOfDeath DATE = NULL,
	@NetWorth MONEY = 15000,
	@PersonID INT OUTPUT
	)
AS
BEGIN;
	SET NOCOUNT ON;
    SET XACT_ABORT ON;
	IF NOT EXISTS (
		SELECT p.SIN FROM dbo.Person p WHERE p.SIN = @FatherSIN
	) BEGIN;
		INSERT INTO dbo.Person ( 
		SIN, 
		FirstName, 
		LastName, 
		FatherPersonID, 
		MotherPersonID, 
		PersonID 
		) VALUES ( 
		@FatherSIN,
		'Placeholder',
		'Placeholder',
		'0',
		'0',
		@PersonID);
	END;
	IF NOT EXISTS (
		SELECT p.SIN FROM dbo.Person p WHERE p.SIN = @MotherSIN
	) BEGIN;
		INSERT INTO dbo.Person ( 
		SIN, 
		FirstName, 
		LastName, 
		FatherPersonID, 
		MotherPersonID, 
		PersonID 
		) VALUES ( 
		@MotherSIN,
		'Placeholder',
		'Placeholder',
		'0',
		'0',
		( SELECT NEXT VALUE FOR dbo.PersonID ));
	END;
	IF NOT EXISTS (
		SELECT p.SIN FROM dbo.Person p WHERE p.SIN = @SIN
	) BEGIN;
		INSERT INTO dbo.Person (
			SIN, 
			FirstName, 
			LastName, 
			FatherPersonID, 
			MotherPersonID, 
			DateOfBirth, 
			DateOfDeath, 
			NetWorth,
			PersonID
		) VALUES (
			@SIN, 
			@FirstName, 
			@LastName, 
			( SELECT p.SIN FROM dbo.Person p WHERE p.SIN = @FatherSIN ), 
			( SELECT p.SIN FROM dbo.Person p WHERE p.SIN = @MotherSIN ),
			@DateOfBirth, 
			@DateOfDeath, 
			@NetWorth,
			@PersonID
		); 
	END;
	ELSE
	BEGIN;
		THROW 50001, 'This SIN was already found in the DB.', 1;
	END;
	COMMIT TRANSACTION;
	RETURN @PersonID;
END;
GO

/* Requirement 3 */
DECLARE @PersonID INT;
EXECUTE dbo.CreatePerson '613382298', 'Gary', 'Cooper', '501550505', '502561001', '2018-12-10', NULL, NULL, @PersonID OUTPUT;

/* Requirement 4 */
SELECT SIN, FatherPersonID, MotherPersonID, FirstName, LastName, DateOfBirth, DateOfDeath, NetWorth
FROM dbo.Person
WHERE NetWorth > 800000
ORDER BY NetWorth;

/* Requirement 5 */
SELECT p.FirstName, p.LastName, RANK() OVER (ORDER BY p.NetWorth DESC) AS NetWorthRank, LAG(p.FirstName) OVER (PARTITION BY p.LastName ORDER BY p.NetWorth DESC) AS 'NextHighest'
FROM dbo.Person p
ORDER BY p.LastName;