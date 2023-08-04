USE [master]
GO
/****** Object:  Database [BD.Preguntados]    Script Date: 4/8/2023 16:03:45 ******/
CREATE DATABASE [BD.Preguntados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD.Preguntados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD.Preguntados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD.Preguntados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD.Preguntados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD.Preguntados] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD.Preguntados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD.Preguntados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD.Preguntados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD.Preguntados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD.Preguntados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD.Preguntados] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD.Preguntados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD.Preguntados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD.Preguntados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD.Preguntados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD.Preguntados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD.Preguntados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD.Preguntados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD.Preguntados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD.Preguntados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD.Preguntados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD.Preguntados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD.Preguntados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD.Preguntados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD.Preguntados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD.Preguntados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD.Preguntados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD.Preguntados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD.Preguntados] SET RECOVERY FULL 
GO
ALTER DATABASE [BD.Preguntados] SET  MULTI_USER 
GO
ALTER DATABASE [BD.Preguntados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD.Preguntados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD.Preguntados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD.Preguntados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD.Preguntados] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD.Preguntados', N'ON'
GO
ALTER DATABASE [BD.Preguntados] SET QUERY_STORE = OFF
GO
USE [BD.Preguntados]
GO
/****** Object:  User [alumno]    Script Date: 4/8/2023 16:03:45 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 4/8/2023 16:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Foto] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 4/8/2023 16:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IDDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IDDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 4/8/2023 16:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IDPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[IDDificultad] [int] NOT NULL,
	[Enunciado] [varchar](1000) NOT NULL,
	[Foto] [varchar](1000) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IDPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 4/8/2023 16:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IDRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IDPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](1000) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](1000) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IDRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (1, N'Bridgerton', N'https://th.bing.com/th/id/R.b63511d8e1e31946bfaee5c5df8bbcac?rik=IDHuRXYChIvN2w&riu=http%3a%2f%2fwww.respuestas-preguntados.org%2fimg%2fpreguntados-entretenimiento.png&ehk=p32gR3io6qR3V7VKp56GAm8gCe5em7mNpeRA3vO1i44%3d&risl=&pid=ImgRaw&r=0')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (3, N'Hunger Gamens', N'https://th.bing.com/th/id/R.4844d8ade6a65a39133128bb5396857d?rik=LCjtJbLoxCnd8w&riu=http%3a%2f%2fentertainmentmaven.files.wordpress.com%2f2012%2f03%2fthe-hunger-games.jpg&ehk=Bgn5GIrZ4etAX5CCWgKum4MzSxET8y%2bEPCEiF4nVm%2bk%3d&risl=&pid=ImgRaw&r=0')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (4, N'Heartstopper', N'https://th.bing.com/th/id/OIP.4ZE_M41ZOm9VwKTq0hVsVgHaLM?pid=ImgDet&rs=1')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (5, N'Once Upon a Time', N'https://th.bing.com/th/id/OIP.4vT_ybRRJUjy1DnYKSvDMQHaLH?pid=ImgDet&rs=1')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (6, N'High School Musical', N'https://th.bing.com/th/id/R.fd0bdc10cf4ebea09530818616e270da?rik=k5MEglA4O8XENw&pid=ImgRaw&r=0')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IDDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([IDDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([IDDificultad], [Nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'''¿Cuál es el autor del libro "Los juegos del hambre"?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[Categorias] ([IDCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IDDificultad])
REFERENCES [dbo].[Dificultades] ([IDDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IDPregunta])
REFERENCES [dbo].[Preguntas] ([IDPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [BD.Preguntados] SET  READ_WRITE 
GO
