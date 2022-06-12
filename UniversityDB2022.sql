create database UniversityDB2022
use UniversityDB2022

CREATE TABLE [dbo].[Student] (
    [StudentID]      INT           IDENTITY (1, 1) NOT NULL,
    [LastName]       NVARCHAR (50) NULL,
    [FirstName]      NVARCHAR (50) NULL,
	[Email]      NVARCHAR (50) NULL,
    [EnrollmentDate] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([StudentID] ASC)
)

GO
CREATE TABLE [dbo].[Course] (
    [CourseID] INT           IDENTITY (1, 1) NOT NULL,
    [Title]    NVARCHAR (50) NULL,
    [Credits]  INT           NULL,
    PRIMARY KEY CLUSTERED ([CourseID] ASC)
)
GO

CREATE TABLE [dbo].[Enrollment] (
    [EnrollmentID] INT IDENTITY (1, 1) NOT NULL,
    [Grade]        DECIMAL(3, 2) NULL,
    [CourseID]     INT NOT NULL,
    [StudentID]    INT NOT NULL,
    PRIMARY KEY CLUSTERED ([EnrollmentID] ASC),
    CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID] FOREIGN KEY ([CourseID]) 
        REFERENCES [dbo].[Course] ([CourseID]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Enrollment_dbo.Student_StudentID] FOREIGN KEY ([StudentID]) 
        REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE
)
GO

/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO Course AS Target 
USING (VALUES 
        (1, 'Economics', 3), 
        (2, 'Literature', 3), 
        (3, 'Chemistry', 4)
) 
AS Source (CourseID, Title, Credits) 
ON Target.CourseID = Source.CourseID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Title, Credits) 
VALUES (Title, Credits);

insert into Student(LastName, FirstName, EnrollmentDate) 
VALUES ('Torrico', 'Hugo', '2021-23-10')

select * from [Student]
select * from [Course]
select * from [Enrollment]

alter table Student add state bit 

alter table Course add state bit

update Course
set state = 1
where CourseID = 9;