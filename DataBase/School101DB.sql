USE [master]
GO
/****** Object:  Database [School101]    Script Date: 19-01-2021 13:44:06 ******/
CREATE DATABASE [School101]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School101', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\School101.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School101_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\School101_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [School101] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School101].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School101] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School101] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School101] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School101] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School101] SET ARITHABORT OFF 
GO
ALTER DATABASE [School101] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School101] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School101] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School101] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School101] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School101] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School101] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School101] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School101] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School101] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School101] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School101] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School101] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School101] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School101] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School101] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School101] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School101] SET RECOVERY FULL 
GO
ALTER DATABASE [School101] SET  MULTI_USER 
GO
ALTER DATABASE [School101] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School101] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School101] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School101] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [School101] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'School101', N'ON'
GO
ALTER DATABASE [School101] SET QUERY_STORE = OFF
GO
USE [School101]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[ClassTeam] [varchar](50) NULL,
	[ClassroomID] [int] NOT NULL,
	[ContactTeacherID] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classroom]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classroom](
	[ClassroomID] [int] IDENTITY(1,1) NOT NULL,
	[ClassroomLocation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Classroom] PRIMARY KEY CLUSTERED 
(
	[ClassroomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleDate] [date] NOT NULL,
	[ClassID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[Starts] [varchar](50) NOT NULL,
	[Ends] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherFirstName] [varchar](50) NOT NULL,
	[TeacherLastName] [varchar](50) NOT NULL,
	[TeacherAge] [int] NOT NULL,
	[TeacherMail] [varchar](50) NOT NULL,
	[TeacherDisciplines] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ScheduleBlock]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ScheduleBlock]
AS
SELECT Schedule.ScheduleDate, Schedule.Starts, Schedule.Ends, ClassName, ClassroomLocation, TeacherFirstName, TeacherLastName, ClassTeam
FROM Schedule
INNER JOIN Class ON Schedule.ClassID = class.ClassID
INNER JOIN Teacher ON Schedule.TeacherID = Teacher.TeacherID
INNER JOIN Classroom ON Class.ClassroomID = Classroom.ClassroomID
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NULL,
	[TeacherID] [int] NOT NULL,
	[Grade] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentFirstName] [varchar](50) NOT NULL,
	[StudentLastName] [varchar](50) NOT NULL,
	[StudentAge] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GradeBlock]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[GradeBlock]
AS
SELECT Grade.Grade, Student.StudentFirstName, Student.StudentLastName, Class.ClassTeam, [Subject].SubjectName, Teacher.TeacherLastName
FROM Grade
LEFT JOIN Student ON Grade.StudentID = Student.StudentID
LEFT JOIN Class ON Class.ClassID = Student.ClassID
LEFT JOIN [Subject] ON Grade.SubjectID = [Subject].SubjectID
LEFT JOIN Teacher ON Grade.GradeID = Teacher.TeacherID
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Classroom] FOREIGN KEY([ClassroomID])
REFERENCES [dbo].[Classroom] ([ClassroomID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Classroom]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Subject]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Teacher]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
/****** Object:  StoredProcedure [dbo].[AddStudentToClass]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStudentToClass]
(@ClassName Varchar(50),
@ClassroomID INT,
@StudentFirstName Varchar(50),
@StudentLastName Varchar(50),
@StudentAge INT
)
AS
IF (SELECT COUNT(ClassID) FROM Class WHERE ClassName = @ClassName) = 0
INSERT INTO Class (ClassName, ClassroomID) 
VALUES (@ClassName, @ClassroomID)
DECLARE  @ClassID INT
SET @ClassID = (SELECT ClassID FROM Class WHERE ClassName = @ClassName)
INSERT INTO Student(ClassID, StudentFirstName, StudentLastName, StudentAge)
VALUES(@ClassID, @StudentFirstName, @StudentLastName, @StudentAge)
GO
/****** Object:  StoredProcedure [dbo].[CreateNewClass]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Class
CREATE PROCEDURE [dbo].[CreateNewClass]
(@ClassName Varchar(50),
@ClassID INT,
@ClassroomID INT,
@ContactTeacherID INT)
AS
INSERT INTO Class (ClassName, ClassID, ClassroomID, ContactTeacherID)
VALUES (@ClassName, @ClassID, @ClassroomID, @ContactTeacherID)
GO
/****** Object:  StoredProcedure [dbo].[CreateNewClassroom]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Classroom
CREATE PROCEDURE [dbo].[CreateNewClassroom]
(@ClassroomID INT,
@ClassroomLocation Varchar(50))
AS
INSERT INTO Classroom (ClassroomID, ClassroomLocation)
VALUES (@ClassroomID, @ClassroomLocation)
GO
/****** Object:  StoredProcedure [dbo].[CreateNewGrades]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Grade
CREATE PROCEDURE [dbo].[CreateNewGrades]
(@GradeID INT,
@StudentID INT,
@TeacherID INT,
@Grade Varchar(50))
AS
INSERT INTO Grade (GradeID, StudentID, TeacherID, Grade)
VALUES (@GradeID, @StudentID, @TeacherID, @Grade)
GO
/****** Object:  StoredProcedure [dbo].[CreateNewSchedule]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Schedule
CREATE PROCEDURE [dbo].[CreateNewSchedule]
(@ScheduleID INT,
@ScheduleDate DATE,
@ClassID INT,
@TeacherID INT,
@Starts Varchar(50),
@Ends Varchar(50))
AS
INSERT INTO Schedule (ScheduleID, ScheduleDate, ClassID, TeacherID, Starts, Ends)
VALUES (@ScheduleID, @ScheduleDate, @ClassID, @TeacherID, @Starts, @Ends)
GO
/****** Object:  StoredProcedure [dbo].[CreateNewStudent]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewStudent]
(@StudentID INT,
@StudentFirstName Varchar(50),
@StudentLastName Varchar(50),
@StudentAge INT,
@ClassID INT)
AS
INSERT INTO Student (StudentID, StudentFirstName, StudentLastName, StudentAge, ClassID )
VALUES (@StudentID, @StudentFirstName, @StudentLastName, @StudentAge, @ClassID)
GO
/****** Object:  StoredProcedure [dbo].[CreateNewSubject]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Subject
CREATE PROCEDURE [dbo].[CreateNewSubject]
(@SubjectID INT,
@SubjectName Varchar(50))
AS
INSERT INTO [Subject] (SubjectID, SubjectName)
VALUES (@SubjectID, @SubjectName)
GO
/****** Object:  StoredProcedure [dbo].[CreateNewTeacher]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Teacher
CREATE PROCEDURE [dbo].[CreateNewTeacher]
(@TeacherFirstName Varchar(50),
@TeacherLastName Varchar(50),
@TeacherAge INT,
@TeacherMail Varchar(50),
@TeacherDesciplines Varchar(50))
AS
INSERT INTO Teacher (TeacherFirstName, TeacherLastName, TeacherAge, TeacherMail, TeacherDisciplines)
VALUES (@TeacherFirstName, @TeacherLastName, @TeacherAge, @TeacherMail, @TeacherDesciplines)
GO
/****** Object:  StoredProcedure [dbo].[CreatePriorStudent]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreatePriorStudent]
(@StudentID INT)
AS
UPDATE Student SET StudentFirstName = 'PriorStudent', StudentLastName = '' WHERE StudentID = @StudentID
GO
/****** Object:  StoredProcedure [dbo].[CreatePriorTeacher]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreatePriorTeacher]
(@TeacherDesciplines Varchar(50))
AS
UPDATE Teacher SET TeacherFirstName = 'PriorTeacher', TeacherLastName = '' WHERE TeacherDisciplines = @TeacherDesciplines
GO
/****** Object:  StoredProcedure [dbo].[DeleteClass]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteClass]
(@ClassID INT)
AS
DELETE FROM Class WHERE ClassID = @ClassID
GO
/****** Object:  StoredProcedure [dbo].[DeleteClassroom]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteClassroom]
(@ClassroomID INT)
AS
DELETE FROM Classroom WHERE ClassroomID = @ClassroomID
GO
/****** Object:  StoredProcedure [dbo].[DeleteGrades]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteGrades]
(@GradeID INT)
AS
DELETE FROM Grade WHERE GradeID = @GradeID
GO
/****** Object:  StoredProcedure [dbo].[DeleteSchedule]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteSchedule]
(@ScheduleID INT)
AS
DELETE FROM Schedule WHERE ScheduleID = @ScheduleID
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubject]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteSubject]
(@SubjectID INT)
AS
DELETE FROM [Subject] WHERE SubjectID = @SubjectID
GO
/****** Object:  StoredProcedure [dbo].[UpdateClass]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateClass]
(@ClassID INT,
@ClassName Varchar(50))
AS
UPDATE Class SET ClassName = @ClassName WHERE ClassID = @ClassID
GO
/****** Object:  StoredProcedure [dbo].[UpdateClassroom]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateClassroom]
(@ClassroomID INT,
@ClassroomLocation Varchar(50))
AS
UPDATE Classroom SET ClassroomLocation = @ClassroomLocation WHERE ClassroomID = @ClassroomID
GO
/****** Object:  StoredProcedure [dbo].[UpdateGrades]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateGrades]
(@GradeID INT,
@Grade Varchar(50))
AS
UPDATE Grade SET Grade = @Grade WHERE GradeID = @GradeID
GO
/****** Object:  StoredProcedure [dbo].[UpdateSchedule]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSchedule]
(@ScheduleID INT,
@ScheduleDate DATE,
@ClassID INT,
@TeacherID INT)
AS
UPDATE Schedule SET ScheduleDate = @ScheduleDate, ClassID = @ClassID, TeacherID = @TeacherID WHERE ScheduleID = @ScheduleID
GO
/****** Object:  StoredProcedure [dbo].[UpdateSubject]    Script Date: 19-01-2021 13:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSubject]
(@SubjectID INT,
@SubjectName Varchar(50))
AS
UPDATE Subject SET SubjectName = @SubjectName WHERE SubjectID = @SubjectID
GO
USE [master]
GO
ALTER DATABASE [School101] SET  READ_WRITE 
GO
