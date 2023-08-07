USE [master]
GO
/****** Object:  Database [BD.Preguntados]    Script Date: 7/8/2023 10:41:12 ******/
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
/****** Object:  User [alumno]    Script Date: 7/8/2023 10:41:12 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 7/8/2023 10:41:12 ******/
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
/****** Object:  Table [dbo].[Dificultades]    Script Date: 7/8/2023 10:41:12 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 7/8/2023 10:41:12 ******/
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
/****** Object:  Table [dbo].[Respuestas]    Script Date: 7/8/2023 10:41:12 ******/
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

INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿En qué siglo se desarrolla la serie "Bridgerton"?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Cuál es el nombre de la familia principal en la serie?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Cuál es el objetivo del debutante?', N'https://i2-prod.manchestereveningnews.co.uk/incoming/article19582361.ece/ALTERNATES/s615/0_JSR_MEN_070121_Bridgerton.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Cuál es el apodo del misterioso columnista que escribe el boletín de sociedad en la serie?', N'https://s1.eestatic.com/2022/09/30/malaga/vivir/707189525_227608072_1706x960.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Qué color representa a la familia Bridgerton en los eventos sociales?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿Cuál era el perfume que identificaba a Kate Sheffield?', N'https://es.web.img3.acsta.net/newsv7/22/03/25/12/19/4714908.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'Al comienzo de la serie, nos enteramos que Daphne tiene un hijo,¿Cómo lo llaman?', N'https://media1.popsugar-assets.com/files/thumbor/_CX8OtP4RKVVzFFwRGYmiWFFinw/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2022/03/29/519/n/44490375/b2591d176242ed62615166.14165754_/i/simon-daphne-baby-bridgerton.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿De qué deporte disfrutan los Bridgerton?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (9, 1, 2, N'¿Cómo se llama la casa de campo de los Bridgerton?', N'https://www.medadmbjmc.in/wp-content/uploads/2022/04/Bridgertons-Aubrey-Hall.png')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (10, 1, 2, N'¿A qué canción bailan Kate y Anthony en el último capítulo de la segunda temporada?', N'https://uploads.dailydot.com/2022/03/BridgertonS2E8TheViscountWhoLovedMe-4907.jpg?auto=compress&fm=pjpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (11, 1, 3, N'¿Cómo se llamaba la capilla donde Colin descrube la identidad secreta de Penelope?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (12, 1, 3, N'¿Cómo se llaman los hijos de Phillip?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿De quién es familiar el interés amoroso de Hyacinth?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (14, 1, 3, N'¿Cómo se llamaba el primer interés amoroso de Gregory?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (15, 1, 3, N'¿De qué trabajaba Sophie?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (16, 3, 1, N'¿Cuántos libros hay de esta saga?', N'https://dailyillini.com/wp-content/uploads/2022/03/unnamed-900x900.png')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (17, 3, 1, N'¿Cómo se llama la protagonista?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (18, 3, 1, N'¿Cómo se llama el país en donde viven?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (19, 3, 1, N'¿En qué distrito viven los protagonistas?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (20, 3, 1, N'¿Cuál es el arma de elección de Katniss?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (21, 3, 2, N'¿Cuál es el animal que Katniss apropia como símbolo?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (22, 3, 2, N'¿Cuántos participantes hay en los juegos del hambre??', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (23, 3, 2, N'¿A qué se dedica el distrito 12?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (24, 3, 2, N'¿Cuál es el apellido de Katniss?', NULL)
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (25, 3, 2, N'¿Cómo se llama el presidente de Panem?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Siglo XX', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Siglo XIII', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 3, N'Siglo XII', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 1, 4, N'Siglo XIX', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 1, N'Downey', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 2, N'Bridgerton', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 3, N'Featherington', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 2, 4, N'Hastings', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 1, N'Para que se le encuentre un esposo a las hijas de la familia', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 3, 2, N'Para presentar a las hijas de las familias a la sociedad', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 3, 3, N'Para vestir un traje de novia blanco', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 3, 4, N'Todas son correctas', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 4, 1, N'Lady Whidelsdown', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 4, 2, N'Lady Whitledon', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 4, 3, N'Lady Whistledown', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 4, 4, N'Lady Whistedown', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 5, 1, N'Azul claro', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 5, 2, N'Lila', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 5, 3, N'Blanco', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 5, 4, N'Gris perla', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 6, 1, N'Violetas', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 6, 2, N'Lirios', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 6, 3, N'Lavanda', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 6, 4, N'Rosa', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 7, 1, N'Edmund', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 7, 2, N'Anthony', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 7, 3, N'Augie', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 7, 4, N'Simon', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 8, 1, N'Golf', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 8, 2, N'Badminton', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 8, 3, N'Polo', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 8, 4, N'Pall Mall', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 9, 1, N'Bridgerton House', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 9, 2, N'Aubrey Hall', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 9, 3, N'Bridgerton Hall', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 9, 4, N'Aubrey House', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 10, 1, N'Dancing On My Own', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 10, 2, N'Material Girl', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 10, 3, N'How Deep Is Your Love', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 10, 4, N'Wrecking Ball', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 11, 1, N'St. John''s', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 11, 2, N'St. Martin''s', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 11, 3, N'St. Bride''s', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 11, 4, N'St. Groom''s', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 12, 1, N'Oliver y Amanda', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 12, 2, N'Colin y Eloise', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 12, 3, N'Martin y John', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 12, 4, N'Oliver y Olivia', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 13, 1, N'Lady Whistledown', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 13, 2, N'Lady Danbury', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 13, 3, N'Lady Featherington', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 13, 4, N'Lady Windsor', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 14, 1, N'Hermione', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 14, 2, N'Lucinda', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 14, 3, N'Penelope', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 14, 4, N'Luna', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 15, 1, N'Cocinera', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 15, 2, N'Asistente', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 15, 3, N'Escritora', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 15, 4, N'Pintora', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 16, 1, N'2', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 16, 2, N'3', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 16, 3, N'1', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 16, 4, N'5', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 17, 1, N'Katniss', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 17, 2, N'Prim', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 17, 3, N'Effie', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 17, 4, N'Rue', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 18, 1, N'Reino Unido', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 18, 2, N'Panem', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 18, 3, N'Estados Unidos', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 18, 4, N'Narnia', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 19, 1, N'1', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 19, 2, N'4', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 19, 3, N'11', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 19, 4, N'12', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 20, 1, N'Pistola', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 20, 2, N'Espada', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 20, 3, N'Arco y flecha', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 20, 4, N'Lanza', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 21, 1, N'Sinsajo', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 21, 2, N'León', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 21, 3, N'Pavo real', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 21, 4, N'Águila', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 22, 1, N'20', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 22, 2, N'18', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 22, 3, N'24', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 22, 4, N'30', 0, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
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
