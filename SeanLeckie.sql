USE [HumanResources]
GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 9/24/2019 11:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefit](
	[BenefitID] [int] IDENTITY(1,1) NOT NULL,
	[BenefitName] [nvarchar](max) NOT NULL,
	[CompanyName] [nvarchar](450) NOT NULL,
	[StartDate] [date] NOT NULL,
	[PolicyNumber] [int] NULL,
 CONSTRAINT [PK_Benefit] PRIMARY KEY CLUSTERED 
(
	[BenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Benefit_CompanyName] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 9/24/2019 11:06:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[ClaimsID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ClaimValue] [numeric](12, 2) NOT NULL,
	[CompanyName] [nvarchar](450) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[ServiceDate] [date] NOT NULL,
	[ClaimDate] [date] NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[ClaimsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/24/2019 11:06:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](450) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Province] [nchar](2) NOT NULL,
	[PostalCode] [nchar](6) NOT NULL,
	[MaxWorkstations] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Department_Employee] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/24/2019 11:07:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nchar](2) NULL,
	[PostalCode] [nchar](6) NULL,
	[EmailAddress] [nvarchar](320) NULL,
	[ManagerID] [int] NULL,
	[SIN] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[BaseSalary] [numeric](10, 2) NOT NULL,
	[Bonus] [int] NULL,
	[DepartmentName] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeBenefit]    Script Date: 9/24/2019 11:07:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeBenefit](
	[EmployeeBenefitID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[BenefitID] [int] NULL,
 CONSTRAINT [PK_EmployeeBenefit] PRIMARY KEY CLUSTERED 
(
	[EmployeeBenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePhone]    Script Date: 9/24/2019 11:07:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePhone](
	[EmployeePhoneID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PhoneType] [nchar](10) NULL,
	[PhoneNumber] [int] NOT NULL,
 CONSTRAINT [PK_EmployeePhone] PRIMARY KEY CLUSTERED 
(
	[EmployeePhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Claims] ADD  CONSTRAINT [DF_Claims_ClaimDate]  DEFAULT (getdate()) FOR [ClaimDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Bonus]  DEFAULT ((2)) FOR [Bonus]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_DepartmentName]  DEFAULT ('Programming') FOR [DepartmentName]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_Benefits] FOREIGN KEY([CompanyName])
REFERENCES [dbo].[Benefit] ([CompanyName])
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_Benefits]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Department_Employee] FOREIGN KEY([DepartmentName])
REFERENCES [dbo].[Department] ([DepartmentName])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Department_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[EmployeeBenefit]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBenefit_Benefit] FOREIGN KEY([BenefitID])
REFERENCES [dbo].[Benefit] ([BenefitID])
GO
ALTER TABLE [dbo].[EmployeeBenefit] CHECK CONSTRAINT [FK_EmployeeBenefit_Benefit]
GO
ALTER TABLE [dbo].[EmployeeBenefit]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBenefit_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeBenefit] CHECK CONSTRAINT [FK_EmployeeBenefit_Employee]
GO
ALTER TABLE [dbo].[EmployeePhone]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePhone_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeePhone] CHECK CONSTRAINT [FK_EmployeePhone_Employee]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [CK_Department_PostalCode] CHECK  (([PostalCode] like '[A-Za-z][0-9][A-Za-z][ ]?[0-9][A-Za-z][0-9]'))
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [CK_Department_PostalCode]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [CK_Department_Province] CHECK  (([Province]='NU' OR [Province]='NT' OR [Province]='YT' OR [Province]='BC' OR [Province]='SK' OR [Province]='MB' OR [Province]='ON' OR [Province]='QC' OR [Province]='NB' OR [Province]='NS' OR [Province]='PE' OR [Province]='NL' OR [Province]='AB'))
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [CK_Department_Province]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_PostalCode] CHECK  (([PostalCode] like '[A-Za-z][0-9][A-Za-z][ ]?[0-9][A-Za-z][0-9]'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_PostalCode]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_Province] CHECK  (([Province]='NU' OR [Province]='NT' OR [Province]='YT' OR [Province]='BC' OR [Province]='SK' OR [Province]='MB' OR [Province]='ON' OR [Province]='QC' OR [Province]='NB' OR [Province]='NS' OR [Province]='PE' OR [Province]='NL' OR [Province]='AB'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_Province]
GO
