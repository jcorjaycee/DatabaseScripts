
USE master;
GO

DROP DATABASE Heritage;
GO
--*/

CREATE DATABASE Heritage;
GO

USE Heritage;
GO

CREATE TABLE dbo.Person (
    PersonID       INT IDENTITY NOT NULL,
    SIN            CHAR(9) NOT NULL,
    FatherPersonID INT NULL,
    MotherPersonID INT NULL,    
    FirstName      NVARCHAR(60) NULL,
    LastName       NVARCHAR(60) NULL,
    DateOfBirth    DATE NULL,
    DateOfDeath    DATE NULL,
    NetWorth       MONEY,

    CONSTRAINT PK_Person PRIMARY KEY CLUSTERED ( PersonID ),
    CONSTRAINT AK_Person_SIN UNIQUE ( SIN )

);
GO

SET IDENTITY_INSERT dbo.Person ON;
GO

INSERT INTO dbo.Person ( PersonID, SIN, FatherPersonID, MotherPersonID, FirstName, LastName, DateOfBirth, DateOfDeath, NetWorth)
VALUES -- GENERATION 1
       (  1, '102940116', NULL, NULL, 'Harry',   'Martin',   '1912-02-16', '1963-04-15', NULL),
       (  2, '102940213', NULL, NULL, 'Marie',   'LeFleur',  '1916-04-13', '1963-04-15' , NULL),
       (  3, '102940321', NULL, NULL, 'Ron',     'Jones',    '1917-05-21', '2002-11-30' , NULL),
       (  4, '102940426', NULL, NULL, 'Sarah',   'Kim',      '1917-03-26', '2006-10-09', NULL ),
       (  5, '102940522', NULL, NULL, 'Fred',    'Cooper',   '1915-11-22', '2000-12-11' , NULL),
       (  6, '102940630', NULL, NULL, 'Audrey',  'Maclean',  '1920-06-30', '2007-03-31' , NULL),
       (  7, '102940721', NULL, NULL, 'Leo',     'Sanchez',  '1916-08-21', '2004-02-29' , NULL),
       (  8, '102940804', NULL, NULL, 'Sarah',   'Black',    '1917-08-04', '2005-08-07' , NULL),
       (  9, '102940912', NULL, NULL, 'Hui',     'Peng',     '1919-11-12', '1971-06-15' , NULL),
       ( 10, '102941002', NULL, NULL, 'Rita',    'Yang',     '1921-08-02', '1990-12-03' , NULL),
       ( 11, '102941109', NULL, NULL, 'Jerry',   'Gold',     '1919-07-09', '1998-05-04' , NULL),
       ( 12, '102941106', NULL, NULL, 'Kate',    'Lyall',    '1920-04-06', NULL , 2000000),
                                    
       -- GENERATION 2              
       ( 13, '311650142',    1,    2, 'Peter',   'Martin',   '1942-01-02', NULL, 1500000 ),
       ( 14, '311650241',    3,    4, 'Erin',    'Jones',    '1941-02-14', '1968-07-02', 1200000 ),
       ( 15, '311650340',    5,    6, 'Ben',     'Cooper',   '1940-10-31', '2017-09-21' , NULL),
       ( 16, '311650444',    7,    8, 'Tina',    'Sanchez',  '1944-12-25', NULL , 1100000),
       ( 17, '311650541',    9,   10, 'Jeff',    'Peng',     '1941-09-23', '2018-02-12', 1300000 ),
       ( 18, '311650643',    11,  12, 'Anne',    'Gold',     '1943-01-17', NULL, 1600000 ),
                                    
       -- GENERATION 3              
       ( 19, '497580107',   13,   14, 'Ari',     'Martin',   '1968-07-02', NULL, 800000 ),
       ( 20, '497580211',   15,   16, 'Judy',    'Cooper',   '1970-11-11', NULL , 800000),
       ( 21, '497580310',   15,   16, 'Daniel',  'Cooper',   '1968-10-04', NULL, 900000 ),
       ( 22, '497580403',   17,   18, 'Kate',    'Peng',     '1969-03-07', NULL, 200000 ),
                                    
       -- GENERATION 4              
       ( 23, '501550100',   19,   20, 'Devon',   'Martin',   '1993-07-11', NULL , 20000), 
       ( 24, '501550201',   19,   20, 'Jillian', 'Martin',   '1996-05-15', NULL , 40000), 
       ( 25, '501550399',   19,   20, 'Brie',    'Martin',   '1998-01-19', NULL , 60000), 
       ( 26, '501550499',   21,   22, 'Stan',    'Cooper',   '1994-05-21', NULL, 80000 ), 
       ( 27, '501550505',   21,   22, 'Ian',     'Cooper',   '1997-08-25', NULL , 200000);


SET IDENTITY_INSERT dbo.Person OFF;
GO
