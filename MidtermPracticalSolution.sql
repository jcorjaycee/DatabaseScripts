-- Table Creation and Key Assignment

-- RatingTypes: Lookup Table for Projects Ratings
CREATE TABLE dbo.RatingTypes (
	RatingTypesID INT IDENTITY CONSTRAINT PK_RatingTypes PRIMARY KEY,
	Rating NVARCHAR(50) NOT NULL
);

-- Contacts: Stores Info for Projects Contacts (Normalized)
CREATE TABLE dbo.Contacts (
	ContactID INT IDENTITY CONSTRAINT PK_Contacts PRIMARY KEY,
	FirstName NVARCHAR(150) NOT NULL,
	LastName NVARCHAR(150) NOT NULL,
	CompanyName NVARCHAR(150) CONSTRAINT AK_Contactst_CompanyName UNIQUE,
	StreetAddress NVARCHAR(MAX) NOT NULL,
	City NVARCHAR(100) NOT NULL,
	Province NVARCHAR(2) NOT NULL,
	PostalCode NVARCHAR(6) NOT NULL,
	PhoneNumber INT NOT NULL
);

-- Projects: Stores Main Info About Projects
CREATE TABLE dbo.Projects (
	ProjectID INT IDENTITY CONSTRAINT PK_Project PRIMARY KEY,
	ProjectName NVARCHAR(150) NOT NULL CONSTRAINT AK_Projects_ProjectName UNIQUE,
	ProjectManager INT NOT NULL CONSTRAINT FK_Employees_Projects_ProjectManager REFERENCES dbo.Employees ( EmployeeID ),
	StartDate DATE NOT NULL CONSTRAINT DF_Projects_StartDate DEFAULT ( GETDATE() ),
	ExpectedCompletion DATE NOT NULL,
	EstimatedCost INT NOT NULL,
	ActualCost INT, 
	ContactID INT NOT NULL CONSTRAINT FK_Contacts_Projects_ContactID REFERENCES dbo.Contacts ( ContactID ),
	Rating INT CONSTRAINT FK_RatingTypes_Projects_Rating REFERENCES dbo.RatingTypes ( RatingTypesID ),
		CONSTRAINT CK_Projects_EstimatedCost CHECK ( EstimatedCost >= 0 ),
		CONSTRAINT CK_Projects_ActualCost CHECK ( ActualCost >= 0 )
);

-- ProjectsEmployees: Junction Table to join Multiple Employees to Multiple Projects
CREATE TABLE dbo.ProjectsEmployees (
	ProjectsEmployeesID INT IDENTITY CONSTRAINT PK_ProjectsEmployees PRIMARY KEY,
	ProjectID INT NOT NULL CONSTRAINT FK_Projects_ProjectsEmployees_ProjectID REFERENCES dbo.Projects ( ProjectID ),
	EmployeeID INT NOT NULL CONSTRAINT FK_Employees_ProjectsEmployees_EmployeeID REFERENCES dbo.Employees ( EmployeeID )
);

-- Tasks: Stores Info About Individual Project/Employee Tasks
CREATE TABLE dbo.Tasks (
	TaskID INT IDENTITY CONSTRAINT PK_Takks PRIMARY KEY,
	ProjectsEmployeesID INT NOT NULL CONSTRAINT FK_ProjectsEmployees_Tasks_ProjectsEmployeesID REFERENCES dbo.ProjectsEmployees ( ProjectsEmployeesID ),
	TaskName NVARCHAR(100) NOT NULL CONSTRAINT AK_Tasks_TaskName UNIQUE,
	StartDate DATE NOT NULL CONSTRAINT DF_Tasks_StartDate DEFAULT ( GETDATE() ),
	ExpectedCompletion DATE NOT NULL,
	ExpectedNumberHours INT NOT NULL,
	ActualNumberHours INT,
	ActualCost INT,
	ChargeOut INT NOT NULL CONSTRAINT DF_Tasks_ChargeOut DEFAULT ( 40 ),
		CONSTRAINT CK_Tasks_StartDate CHECK ( StartDate <= GETDATE() ),
		CONSTRAINT CK_Tasks_ChargeOut CHECK ( ChargeOut >= 40 )
);

-- Index Creation
-- As Specified In Business Requirements
CREATE INDEX IX_Contacts_LastName_CompanyName ON dbo.Contacts ( LastName, CompanyName );
CREATE INDEX IX_Contacts_LastName ON dbo.Contacts ( LastName );
CREATE INDEX IX_Contacts_CompanyName ON dbo.Contacts ( CompanyName);

-- As Specified in Technical Requirements
CREATE INDEX IX_Projects_ProjectID_ProjectManager ON dbo.Projects ( ProjectID, ProjectManager );
CREATE INDEX IX_Projects_ProjectManager_ProjectID ON dbo.Projects ( ProjectManager, ProjectID );
CREATE INDEX IX_Projects_ProjectID_ContactID ON dbo.Projects ( ProjectID, ContactID );
CREATE INDEX IX_Projects_ContactID_ProjectID ON dbo.Projects ( ContactID, ProjectID );
-- CREATE INDEX IX_Projects_ProjectID_RatingTypeID ON dbo.Projects ( ProjectID, RatingTypeID); EXCLUDED, seeks will be faster
CREATE INDEX IX_ProjectsEmployees_ProjectID_EmployeeID ON dbo.ProjectsEmployees ( ProjectID, EmployeeID );
CREATE INDEX IX_ProjectsEmployees_EmployeeID_ProjectID ON dbo.ProjectsEmployees ( EmployeeID, ProjectID );
CREATE INDEX IX_Tasks_TaskID_ProjectsEmployeesID ON dbo.Tasks ( TaskID, ProjectsEmployeesID );
CREATE INDEX IX_Tasks_ProjectsEmployeesID_TaskID ON dbo.Tasks ( ProjectsEmployeesID, TaskID );