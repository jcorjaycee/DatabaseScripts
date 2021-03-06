USE [master]
GO
/****** Object:  Database [CaseStudy1]    Script Date: 10/9/2019 6:30:07 PM ******/
CREATE DATABASE [CaseStudy1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaseStudy1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.INFO5052\MSSQL\DATA\CaseStudy1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CaseStudy1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.INFO5052\MSSQL\DATA\CaseStudy1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CaseStudy1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaseStudy1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaseStudy1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaseStudy1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaseStudy1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaseStudy1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaseStudy1] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaseStudy1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CaseStudy1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaseStudy1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaseStudy1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaseStudy1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaseStudy1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaseStudy1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaseStudy1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaseStudy1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaseStudy1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CaseStudy1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaseStudy1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaseStudy1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaseStudy1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaseStudy1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaseStudy1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CaseStudy1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaseStudy1] SET RECOVERY FULL 
GO
ALTER DATABASE [CaseStudy1] SET  MULTI_USER 
GO
ALTER DATABASE [CaseStudy1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaseStudy1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CaseStudy1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CaseStudy1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CaseStudy1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CaseStudy1', N'ON'
GO
ALTER DATABASE [CaseStudy1] SET QUERY_STORE = OFF
GO
USE [CaseStudy1]
GO
/****** Object:  Table [dbo].[BenefitType]    Script Date: 10/9/2019 6:30:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_BenefitType_PolicyNumber] UNIQUE NONCLUSTERED 
(
	[PolicyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 10/9/2019 6:30:08 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 10/9/2019 6:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[CompanyName] [nvarchar](150) NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Province] [nvarchar](2) NOT NULL,
	[PostalCode] [nvarchar](6) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Contactst_CompanyName] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/9/2019 6:30:08 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Departments_DepartmentName] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeBenefits]    Script Date: 10/9/2019 6:30:08 PM ******/
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
/****** Object:  Table [dbo].[EmployeePhoneNumbers]    Script Date: 10/9/2019 6:30:08 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 10/9/2019 6:30:08 PM ******/
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
/****** Object:  Table [dbo].[PhoneType]    Script Date: 10/9/2019 6:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneType](
	[PhoneTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10/9/2019 6:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](150) NOT NULL,
	[ProjectManager] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[ExpectedCompletion] [date] NOT NULL,
	[EstimatedCost] [int] NOT NULL,
	[ActualCost] [int] NULL,
	[ContactID] [int] NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Projects_ProjectName] UNIQUE NONCLUSTERED 
(
	[ProjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectsEmployees]    Script Date: 10/9/2019 6:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsEmployees](
	[ProjectsEmployeesID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_ProjectsEmployees] PRIMARY KEY CLUSTERED 
(
	[ProjectsEmployeesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 10/9/2019 6:30:08 PM ******/
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
/****** Object:  Table [dbo].[RatingTypes]    Script Date: 10/9/2019 6:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingTypes](
	[RatingTypesID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RatingTypes] PRIMARY KEY CLUSTERED 
(
	[RatingTypesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 10/9/2019 6:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectsEmployeesID] [int] NOT NULL,
	[TaskName] [nvarchar](100) NOT NULL,
	[StartDate] [date] NOT NULL,
	[ExpectedCompletion] [date] NOT NULL,
	[ExpectedNumberHours] [int] NOT NULL,
	[ActualNumberHours] [int] NULL,
	[ActualCost] [int] NULL,
	[ChargeOut] [int] NOT NULL,
 CONSTRAINT [PK_Takks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Tasks_TaskName] UNIQUE NONCLUSTERED 
(
	[TaskName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_EmployeeBenefit_Provider]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Claims_EmployeeBenefit_Provider] ON [dbo].[Claims]
(
	[EmployeeBenefitID] ASC,
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_Provider_EmployeeBenefit]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Claims_Provider_EmployeeBenefit] ON [dbo].[Claims]
(
	[ProviderID] ASC,
	[EmployeeBenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contacts_CompanyName]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contacts_CompanyName] ON [dbo].[Contacts]
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contacts_LastName]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contacts_LastName] ON [dbo].[Contacts]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contacts_LastName_CompanyName]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contacts_LastName_CompanyName] ON [dbo].[Contacts]
(
	[LastName] ASC,
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeBenefits_BenefitType_Employees]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeBenefits_BenefitType_Employees] ON [dbo].[EmployeeBenefits]
(
	[BenefitTypeID] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeBenefits_Employees_BenefitType]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeBenefits_Employees_BenefitType] ON [dbo].[EmployeeBenefits]
(
	[EmployeeId] ASC,
	[BenefitTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_Employee_PhoneType]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_Employee_PhoneType] ON [dbo].[EmployeePhoneNumbers]
(
	[EmployeeID] ASC,
	[PhoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeePhoneNumbers_PhoneType_Employee]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeePhoneNumbers_PhoneType_Employee] ON [dbo].[EmployeePhoneNumbers]
(
	[PhoneTypeID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_City_PostalCode]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_City_PostalCode] ON [dbo].[Employees]
(
	[City] ASC,
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_Department_Current]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_Department_Current] ON [dbo].[Employees]
(
	[CurrentDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_Department_Default]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_Department_Default] ON [dbo].[Employees]
(
	[DefaultDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_PostalCode]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_PostalCode] ON [dbo].[Employees]
(
	[PostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_ReportsToEmployee]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_ReportsToEmployee] ON [dbo].[Employees]
(
	[ReportsToEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_ContactID_ProjectID]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Projects_ContactID_ProjectID] ON [dbo].[Projects]
(
	[ContactID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_ProjectID_ContactID]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Projects_ProjectID_ContactID] ON [dbo].[Projects]
(
	[ProjectID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_ProjectID_ProjectManager]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Projects_ProjectID_ProjectManager] ON [dbo].[Projects]
(
	[ProjectID] ASC,
	[ProjectManager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_ProjectManager_ProjectID]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Projects_ProjectManager_ProjectID] ON [dbo].[Projects]
(
	[ProjectManager] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectsEmployees_EmployeeID_ProjectID]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProjectsEmployees_EmployeeID_ProjectID] ON [dbo].[ProjectsEmployees]
(
	[EmployeeID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectsEmployees_ProjectID_EmployeeID]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProjectsEmployees_ProjectID_EmployeeID] ON [dbo].[ProjectsEmployees]
(
	[ProjectID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_ProjectsEmployeesID_TaskID]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_ProjectsEmployeesID_TaskID] ON [dbo].[Tasks]
(
	[ProjectsEmployeesID] ASC,
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_TaskID_ProjectsEmployeesID]    Script Date: 10/9/2019 6:30:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_TaskID_ProjectsEmployeesID] ON [dbo].[Tasks]
(
	[TaskID] ASC,
	[ProjectsEmployeesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Claims] ADD  CONSTRAINT [DF_Claims_ClaimAmount]  DEFAULT ((0)) FOR [ClaimAmount]
GO
ALTER TABLE [dbo].[Claims] ADD  CONSTRAINT [DF_Claims_ServiceDate]  DEFAULT (getdate()) FOR [ServiceDate]
GO
ALTER TABLE [dbo].[Claims] ADD  CONSTRAINT [DF_Claims_ClaimDate]  DEFAULT (getdate()) FOR [ClaimDate]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Departments_MaxWorkstations]  DEFAULT ((1)) FOR [MaxWorkstations]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_BaseSalary]  DEFAULT ((0)) FOR [BaseSalary]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_ChargeOut]  DEFAULT ((40)) FOR [ChargeOut]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_EmployeeBenefits] FOREIGN KEY([EmployeeBenefitID])
REFERENCES [dbo].[EmployeeBenefits] ([EmployeeBenefitID])
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_EmployeeBenefits]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_Provider]
GO
ALTER TABLE [dbo].[EmployeeBenefits]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBenefits_BenefitType] FOREIGN KEY([BenefitTypeID])
REFERENCES [dbo].[BenefitType] ([BenefitTypeID])
GO
ALTER TABLE [dbo].[EmployeeBenefits] CHECK CONSTRAINT [FK_EmployeeBenefits_BenefitType]
GO
ALTER TABLE [dbo].[EmployeeBenefits]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBenefits_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeBenefits] CHECK CONSTRAINT [FK_EmployeeBenefits_Employees]
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePhoneNumbers_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers] CHECK CONSTRAINT [FK_EmployeePhoneNumbers_Employees]
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePhoneNumbers_PhoneType] FOREIGN KEY([PhoneTypeID])
REFERENCES [dbo].[PhoneType] ([PhoneTypeID])
GO
ALTER TABLE [dbo].[EmployeePhoneNumbers] CHECK CONSTRAINT [FK_EmployeePhoneNumbers_PhoneType]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments_Current] FOREIGN KEY([CurrentDepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments_Current]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments_Default] FOREIGN KEY([DefaultDepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments_Default]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_ReportsTo] FOREIGN KEY([ReportsToEmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_ReportsTo]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Projects_ContactID] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Contacts_Projects_ContactID]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Projects_ProjectManager] FOREIGN KEY([ProjectManager])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Employees_Projects_ProjectManager]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_RatingTypes_Projects_Rating] FOREIGN KEY([Rating])
REFERENCES [dbo].[RatingTypes] ([RatingTypesID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_RatingTypes_Projects_Rating]
GO
ALTER TABLE [dbo].[ProjectsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_ProjectsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[ProjectsEmployees] CHECK CONSTRAINT [FK_Employees_ProjectsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[ProjectsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_Projects_ProjectsEmployees_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[ProjectsEmployees] CHECK CONSTRAINT [FK_Projects_ProjectsEmployees_ProjectID]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsEmployees_Tasks_ProjectsEmployeesID] FOREIGN KEY([ProjectsEmployeesID])
REFERENCES [dbo].[ProjectsEmployees] ([ProjectsEmployeesID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_ProjectsEmployees_Tasks_ProjectsEmployeesID]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [CK_Claims_1] CHECK  (([ServiceDate]<=getdate()))
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [CK_Claims_1]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [CK_Claims_2] CHECK  (([ClaimDate]<=getdate()))
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [CK_Claims_2]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK_Departments_MaxWorkstations] CHECK  (([MaxWorkstations]>=(0)))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK_Departments_MaxWorkstations]
GO
ALTER TABLE [dbo].[EmployeeBenefits]  WITH CHECK ADD  CONSTRAINT [CK_EmployeeBenefits_1] CHECK  (([StartDate]<=getdate()))
GO
ALTER TABLE [dbo].[EmployeeBenefits] CHECK CONSTRAINT [CK_EmployeeBenefits_1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [CK_Employees_1] CHECK  (([DateofBirth]<=getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Employees_1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [CK_Employees_2] CHECK  (([StartDate]<=getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Employees_2]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [CK_Projects_ActualCost] CHECK  (([ActualCost]>=(0)))
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [CK_Projects_ActualCost]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [CK_Projects_EstimatedCost] CHECK  (([EstimatedCost]>=(0)))
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [CK_Projects_EstimatedCost]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [CK_Tasks_ChargeOut] CHECK  (([ChargeOut]>=(40)))
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [CK_Tasks_ChargeOut]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [CK_Tasks_StartDate] CHECK  (([StartDate]<=getdate()))
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [CK_Tasks_StartDate]
GO
USE [master]
GO
ALTER DATABASE [CaseStudy1] SET  READ_WRITE 
GO
