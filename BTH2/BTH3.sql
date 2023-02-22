create database MarkManagement
GO 
USE MarkManagement
GO
CREATE TABLE Students
(
StudentID Nvarchar(12) ,
StudentName Nvarchar(25)NOT NULL ,
DateofBirth Datetime NOT NULL,
Email Nvarchar(40),
Phone Nvarchar(12)  ,
Class Nvarchar(10) ,
constraint PK_Students primary key (StudentID)
)

CREATE TABLE Subjects 
(
SubjectID Nvarchar(10) ,
SubjectName Nvarchar(25) NOT NULL ,
constraint PK_Subjects primary key (SubjectID)

)

CREATE TABLE Mark
(
StudentID Nvarchar(12) ,
SubjectID Nvarchar(10) ,
Date Datetime,
Theory Tinyint ,
Practical Tinyint,
)
GO
ALTER TABLE dbo.Mark  ADD CONSTRAINT
FKsinhvien FOREIGN KEY(SubjectsID) REFERENCES dbo.Subjects(SubjectsID) 
GO
ALTER TABLE dbo.Mark ADD CONSTRAINT
FKketqua FOREIGN KEY(StudentsID) REFERENCES dbo.Students(StudentsID) 