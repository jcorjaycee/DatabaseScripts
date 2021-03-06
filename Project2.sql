USE [HumanResources]
GO
/****** Object:  Table [dbo].[BenefitType]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenefitType](
	[BenefitTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BenefitType] [nvarchar](100) NOT NULL,
	[BenefitCompanyName] [nvarchar](100) NOT NULL,
	[PolicyNumber] [int] NULL,
 CONSTRAINT [PK_BenefitType] PRIMARY KEY CLUSTERED 
(
	[BenefitTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[ClaimsID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ClaimAmount] [decimal](18, 2) NOT NULL,
	[ServiceDate] [date] NOT NULL,
	[EmployeeBenefitID] [int] NULL,
	[ClaimDate] [date] NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[ClaimsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](150) NOT NULL,
	[StreetAddress] [nvarchar](100) NOT NULL,
	[City] [nvarchar](60) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[PostalCode] [char](6) NOT NULL,
	[MaxWorkstations] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeBenefits]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeBenefits](
	[EmployeeBenefitID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[BenefitTypeID] [int] NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_EmployeeBenefits] PRIMARY KEY CLUSTERED 
(
	[EmployeeBenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePhoneNumbers]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePhoneNumbers](
	[EmployeePhoneNumberID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PhoneTypeID] [int] NOT NULL,
	[PhoneNumber] [nvarchar](14) NULL,
 CONSTRAINT [PK_EmployeePhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[EmployeePhoneNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[SIN] [char](9) NOT NULL,
	[DefaultDepartmentID] [int] NOT NULL,
	[CurrentDepartmentID] [int] NOT NULL,
	[ReportsToEmployeeID] [int] NULL,
	[StreetAddress] [nvarchar](100) NULL,
	[City] [nvarchar](60) NULL,
	[Province] [nvarchar](50) NULL,
	[PostalCode] [char](6) NULL,
	[StartDate] [date] NOT NULL,
	[BaseSalary] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Employees_SIN] UNIQUE NONCLUSTERED 
(
	[SIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneTypes](
	[PhoneTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhoneTypes] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 10/1/2019 11:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](50) NOT NULL,
	[ProviderAddress] [nvarchar](60) NOT NULL,
	[ProviderCity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_BenefitType_PolicyNumber]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_BenefitType_PolicyNumber] ON [dbo].[BenefitType]
(
	[PolicyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_EmployeeBenefitID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Claims_EmployeeBenefitID] ON [dbo].[Claims]
(
	[EmployeeBenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_EmployeeBenefitID_ProviderID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Claims_EmployeeBenefitID_ProviderID] ON [dbo].[Claims]
(
	[EmployeeBenefitID] ASC,
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_ProviderID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Claims_ProviderID] ON [dbo].[Claims]
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_ProviderID_EmployeeBenefitID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Claims_ProviderID_EmployeeBenefitID] ON [dbo].[Claims]
(
	[ProviderID] ASC,
	[EmployeeBenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Departments_City]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_City] ON [dbo].[Departments]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Departments_City_PostalCode]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_City_PostalCode] ON [dbo].[Departments]
(
	[City] ASC,
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Departments_DepartmentName]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_DepartmentName] ON [dbo].[Departments]
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Departments_PostalCode]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_PostalCode] ON [dbo].[Departments]
(
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Departments_PostalCode_City]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_PostalCode_City] ON [dbo].[Departments]
(
	[PostalCode] ASC,
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_PostalCode_City]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_PostalCode_City] ON [dbo].[Departments]
(
	[PostalCode] ASC,
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeBenefits_BenefitTypeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeBenefits_BenefitTypeID] ON [dbo].[EmployeeBenefits]
(
	[BenefitTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeBenefits_EmployeeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeBenefits_EmployeeID] ON [dbo].[EmployeeBenefits]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_BenefitTypeID_EmployeeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_BenefitTypeID_EmployeeID] ON [dbo].[EmployeeBenefits]
(
	[BenefitTypeID] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_EmployeeID_BenefitTypeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_EmployeeID_BenefitTypeID] ON [dbo].[EmployeeBenefits]
(
	[EmployeeId] ASC,
	[BenefitTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_EmployeeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_EmployeeID] ON [dbo].[EmployeePhoneNumbers]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_EmployeeID_PhoneTypeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_EmployeeID_PhoneTypeID] ON [dbo].[EmployeePhoneNumbers]
(
	[EmployeeID] ASC,
	[PhoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_PhoneTypeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_PhoneTypeID] ON [dbo].[EmployeePhoneNumbers]
(
	[PhoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_PhoneTypeID_EmployeeID]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_PhoneTypeID_EmployeeID] ON [dbo].[EmployeePhoneNumbers]
(
	[PhoneTypeID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_City]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_City] ON [dbo].[Employees]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_City_PostalCode]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_City_PostalCode] ON [dbo].[Employees]
(
	[City] ASC,
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_CurrentDepartment]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_CurrentDepartment] ON [dbo].[Employees]
(
	[CurrentDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_DefaultDepartment]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_DefaultDepartment] ON [dbo].[Employees]
(
	[DefaultDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_PostalCode]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_PostalCode] ON [dbo].[Employees]
(
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_SIN]    Script Date: 10/1/2019 11:09:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_SIN] ON [dbo].[Employees]
(
	[SIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Claims] ADD  CONSTRAINT [DF_Claims_ClaimAmount]  DEFAULT ((0)) FOR [ClaimAmount]
GO
ALTER TABLE [dbo].[Claims] ADD  CONSTRAINT [DF_Claims_ServiceDate]  DEFAULT (getdate()) FOR [ServiceDate]
GO
ALTER TABLE [dbo].[Claims] ADD  CONSTRAINT [DF_Claims_ClaimDate]  DEFAULT (getdate()) FOR [ClaimDate]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Department_MaxWorkstations]  DEFAULT ((1)) FOR [MaxWorkstations]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_BaseSalary]  DEFAULT ((0)) FOR [BaseSalary]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_EmployeeBenefits] FOREIGN KEY([EmployeeBenefitID])
REFERENCES [dbo].[EmployeeBenefits] ([EmployeeBenefitID])
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_EmployeeBenefits]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Provider]
GO
ALTER TABLE [dbo].[EmployeeBenefits]  WITH CHECK ADD  CONSTRAINT [FK_BenefitType] FOREIGN KEY([BenefitTypeID])
REFERENCES [dbo].[BenefitType] ([BenefitTypeID])
GO
ALTER TABLE [dbo].[EmployeeBenefits] CHECK CONSTRAINT [FK_BenefitType]
GO
ALTER TABLE [dbo].[EmployeeBenefits]  WITH CHECK ADD  CONSTRAINT [FK_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeBenefits] CHECK CONSTRAINT [FK_Employee]
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePhoneNumbers_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers] CHECK CONSTRAINT [FK_EmployeePhoneNumbers_Employee]
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePhoneNumbers_PhoneTypes] FOREIGN KEY([PhoneTypeID])
REFERENCES [dbo].[PhoneTypes] ([PhoneTypeID])
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers] CHECK CONSTRAINT [FK_EmployeePhoneNumbers_PhoneTypes]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department_Current] FOREIGN KEY([CurrentDepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employee_Department_Current]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department_Default] FOREIGN KEY([DefaultDepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employee_Department_Default]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ReportsTo] FOREIGN KEY([ReportsToEmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employee_ReportsTo]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [CK_Claims_ClaimDate] CHECK  (([ClaimDate]>=getdate()))
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [CK_Claims_ClaimDate]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [CK_Claims_ServiceDate] CHECK  (([ServiceDate]>=getdate()))
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [CK_Claims_ServiceDate]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK_Department_MaxWorkstations] CHECK  (([MaxWorkstations]>=(0)))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK_Department_MaxWorkstations]
GO
ALTER TABLE [dbo].[EmployeeBenefits]  WITH CHECK ADD  CONSTRAINT [AK_EmployeeBenefits_StartDate] CHECK  (([StartDate]>=getdate()))
GO
ALTER TABLE [dbo].[EmployeeBenefits] CHECK CONSTRAINT [AK_EmployeeBenefits_StartDate]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [CK_Employees_DateOfBirth] CHECK  (([DateOfBirth]>=getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Employees_DateOfBirth]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [CK_Employees_StartDate] CHECK  (([StartDate]>=getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Employees_StartDate]
GO
