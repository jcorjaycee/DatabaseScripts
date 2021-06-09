USE HumanResources;

ALTER TABLE Claims
ADD CONSTRAINT DF_Claims_ClaimAmount DEFAULT 0 FOR ClaimAmount;
ALTER TABLE Claims
ADD CONSTRAINT CK_Claims_ClaimDate CHECK ( ClaimDate >= GETDATE() );
ALTER TABLE Claims
ADD CONSTRAINT DF_Claims_ClaimDate DEFAULT ( GETDATE() ) FOR ClaimDate;
ALTER TABLE Claims
ADD CONSTRAINT CK_Claims_ServiceDate CHECK ( ServiceDate >= GETDATE() );
ALTER TABLE Claims
ADD CONSTRAINT DF_Claims_ServiceDate DEFAULT ( GETDATE() ) FOR ServiceDate;
GO

ALTER TABLE Departments
ADD CONSTRAINT CK_Department_MaxWorkstations CHECK ( MaxWorkstations >= 0 );
ALTER TABLE Departments
ADD CONSTRAINT DF_Department_MaxWorkstations DEFAULT 1 FOR MaxWorkstations;
GO

ALTER TABLE Employees
ADD CONSTRAINT DF_Employees_BaseSalary DEFAULT 0 FOR BaseSalary;
ALTER TABLE Employees
ADD CONSTRAINT CK_Employees_DateOfBirth CHECK ( DateOfBirth >= GETDATE() );
ALTER TABLE Employees
ADD CONSTRAINT AK_Employees_SIN UNIQUE ( SIN );
ALTER TABLE Employees
ADD CONSTRAINT CK_Employees_StartDate CHECK ( StartDate >= GETDATE() );
GO

ALTER TABLE EmployeeBenefits
ADD CONSTRAINT AK_EmployeeBenefits_StartDate CHECK ( StartDate >= GETDATE() );
GO

-- basic indexes
CREATE INDEX IX_BenefitType_PolicyNumber ON BenefitType ( PolicyNumber );
CREATE INDEX IX_Claims_EmployeeBenefitID ON Claims ( EmployeeBenefitID );
CREATE INDEX IX_Claims_ProviderID ON Claims ( ProviderID );
CREATE INDEX IX_Departments_City ON Departments ( City );
CREATE INDEX IX_Departments_DepartmentName ON Departments ( DepartmentName );
CREATE INDEX IX_Departments_PostalCode ON Departments ( PostalCode);
CREATE INDEX IX_Employees_SIN ON Employees ( SIN );
CREATE INDEX IX_Employees_City ON Employees ( City );
CREATE INDEX IX_Employees_PostalCode ON Employees ( PostalCode );
CREATE INDEX IX_Employees_CurrentDepartment ON Employees ( CurrentDepartmentID );
CREATE INDEX IX_Employees_DefaultDepartment ON Employees ( DefaultDepartmentID );
CREATE INDEX IX_EmployeeBenefits_BenefitTypeID ON EmployeeBenefits ( BenefitTypeID );
CREATE INDEX IX_EmployeeBenefits_EmployeeID ON EmployeeBenefits ( EmployeeID );
CREATE INDEX IX_EmployeePhoneNumbers_EmployeeID ON EmployeePhoneNumbers ( EmployeeID );
CREATE INDEX IX_EmployeePhoneNumbers_PhoneTypeID ON EmployeePhoneNumbers ( PhoneTypeID );

GO

-- composite indexes
CREATE INDEX IX_Claims_EmployeeBenefitID_ProviderID ON Claims ( EmployeeBenefitID, ProviderID );
CREATE INDEX IX_Claims_ProviderID_EmployeeBenefitID ON Claims ( ProviderID, EmployeeBenefitID );
CREATE INDEX IX_Departments_City_PostalCode ON Departments ( City, PostalCode );
CREATE INDEX IX_Departments_PostalCode_City ON Departments ( PostalCode, City );
CREATE INDEX IX_Employees_City_PostalCode ON Employees ( City, PostalCode );
CREATE INDEX IX_Employees_PostalCode_City ON Departments ( PostalCode, City );
CREATE INDEX IX_EmployeePhoneNumbers_EmployeeID_PhoneTypeID ON EmployeePhoneNumbers ( EmployeeID, PhoneTypeID );
CREATE INDEX IX_EmployeePhoneNumbers_PhoneTypeID_EmployeeID ON EmployeePhoneNumbers ( PhoneTypeID, EmployeeID );
CREATE INDEX IX_EmployeePhoneNumbers_EmployeeID_BenefitTypeID ON EmployeeBenefits ( EmployeeID, BenefitTypeID );
CREATE INDEX IX_EmployeePhoneNumbers_BenefitTypeID_EmployeeID ON EmployeeBenefits ( BenefitTypeID, EmployeeID );