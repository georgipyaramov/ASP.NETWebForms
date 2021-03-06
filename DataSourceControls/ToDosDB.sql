USE [master]
GO
/****** Object:  Database [ToDos]    Script Date: 25.10.2014 г. 23:46:55 ч. ******/
CREATE DATABASE [ToDos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToDos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ToDos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ToDos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ToDos_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ToDos] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToDos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToDos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToDos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToDos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToDos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToDos] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToDos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToDos] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ToDos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToDos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToDos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToDos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToDos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToDos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToDos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToDos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToDos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToDos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToDos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToDos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToDos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToDos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToDos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToDos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToDos] SET RECOVERY FULL 
GO
ALTER DATABASE [ToDos] SET  MULTI_USER 
GO
ALTER DATABASE [ToDos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToDos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToDos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToDos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToDos', N'ON'
GO
USE [ToDos]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 25.10.2014 г. 23:46:55 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 25.10.2014 г. 23:46:55 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Body] [nvarchar](250) NULL,
	[DateOfLastChange] [datetime] NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Category 1')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Category 2')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Category 3')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'bbbb')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([Id], [Title], [Body], [DateOfLastChange], [CategoryId]) VALUES (1, N'Go Home Now', N'You have to go home', CAST(0x0000A3CF016E7AF7 AS DateTime), 2)
INSERT [dbo].[Tasks] ([Id], [Title], [Body], [DateOfLastChange], [CategoryId]) VALUES (6, N'asadassasasa', N'asasasass', NULL, 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Body], [DateOfLastChange], [CategoryId]) VALUES (7, N'qqqqqqqqqqqqq', N'qqqqqqqq', NULL, 2)
INSERT [dbo].[Tasks] ([Id], [Title], [Body], [DateOfLastChange], [CategoryId]) VALUES (9, N'weweweweew', N'wewewe <script>alert("aaa")</script>', CAST(0x0000A3CF0178D8DA AS DateTime), 2)
INSERT [dbo].[Tasks] ([Id], [Title], [Body], [DateOfLastChange], [CategoryId]) VALUES (11, N'dsadsadasdsadasd', N'asdsddddd Otivam do toaletnata  ', CAST(0x0000A3CF017CCA6C AS DateTime), 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Body], [DateOfLastChange], [CategoryId]) VALUES (16, N'zaza', N'zaza', NULL, 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Body], [DateOfLastChange], [CategoryId]) VALUES (17, N'dfghfhf', N'gyjugjkmg', NULL, 2)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
ALTER TABLE [dbo].[Tasks]  WITH NOCHECK ADD  CONSTRAINT [FK_Tasks_Categories1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Tasks] NOCHECK CONSTRAINT [FK_Tasks_Categories1]
GO
USE [master]
GO
ALTER DATABASE [ToDos] SET  READ_WRITE 
GO
