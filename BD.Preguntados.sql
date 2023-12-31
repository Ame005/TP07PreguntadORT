USE [master]
GO
/****** Object:  Database [BD.Preguntados]    Script Date: 27/8/2023 21:58:16 ******/
CREATE DATABASE [BD.Preguntados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD.Preguntados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD.Preguntados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD.Preguntados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD.Preguntados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
ALTER DATABASE [BD.Preguntados] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD.Preguntados', N'ON'
GO
ALTER DATABASE [BD.Preguntados] SET QUERY_STORE = OFF
GO
USE [BD.Preguntados]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 27/8/2023 21:58:16 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 27/8/2023 21:58:16 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 27/8/2023 21:58:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IDPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[IDDificultad] [int] NOT NULL,
	[Enunciado] [varchar](1000) NOT NULL,
	[Foto] [varchar](5000) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IDPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 27/8/2023 21:58:16 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (1, N'Bridgerton', N'https://th.bing.com/th/id/OIP.TxWeZOJHSnREnMjxhwR4CgHaDs?pid=ImgDet&rs=1')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (3, N'Hunger Gamens', N'https://th.bing.com/th/id/OIP.wFTf_VO-8u7FKoInWaeXtwHaEK?pid=ImgDet&w=1920&h=1080&rs=1')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (4, N'Heartstopper', N'https://wallpapercave.com/wp/wp11263798.png')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (5, N'Once Upon a Time', N'https://staticr1.blastingcdn.com/media/photogallery/2015/12/18/660x290/b_1200x630/once-upon-a-time-logo-della-serie_534925.jpg')
INSERT [dbo].[Categorias] ([IDCategoria], [Nombre], [Foto]) VALUES (6, N'High School Musical', N'https://th.bing.com/th/id/R.f35f8a137ca6d426daa9416b80a279a6?rik=WrbDEKeYjFGU2A&riu=http%3a%2f%2fversionfinal.com.ve%2fwp-content%2fuploads%2f2016%2f01%2fHIGHSCHOOLMUSICAL.VERSIONFINAL.jpg&ehk=zngIpNsBZ17ALnUFprc9q1ZNm0DNwVvZRzt0I3QIOgc%3d&risl=&pid=ImgRaw&r=0')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IDDificultad], [Nombre]) VALUES (1, N'FACIL')
INSERT [dbo].[Dificultades] ([IDDificultad], [Nombre]) VALUES (2, N'MEDIO')
INSERT [dbo].[Dificultades] ([IDDificultad], [Nombre]) VALUES (3, N'DIFICIL')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿En qué siglo se desarrolla la serie "Bridgerton"?', N'https://static.wixstatic.com/media/a2f207_9f4dc43095bf484e8b871a0223bbc851.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Cuál es el nombre de la familia principal en la serie?', N'https://hips.hearstapps.com/hmg-prod/images/bridgerton-1648478862.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Cuál es el objetivo del debutante?', N'https://i2-prod.manchestereveningnews.co.uk/incoming/article19582361.ece/ALTERNATES/s615/0_JSR_MEN_070121_Bridgerton.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Cuál es el apodo del misterioso columnista que escribe el boletín de sociedad en la serie?', N'https://s1.eestatic.com/2022/09/30/malaga/vivir/707189525_227608072_1706x960.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Qué color representa a la familia Bridgerton en los eventos sociales?', N'https://i.blogs.es/b920ea/los-bridgerton-temporada-3/1366_2000.jpeg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿Cuál era el perfume que identificaba a Kate Sheffield?', N'https://es.web.img3.acsta.net/newsv7/22/03/25/12/19/4714908.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'Al comienzo de la serie, nos enteramos que Daphne tiene un hijo,¿Cómo lo llaman?', N'https://media1.popsugar-assets.com/files/thumbor/_CX8OtP4RKVVzFFwRGYmiWFFinw/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2022/03/29/519/n/44490375/b2591d176242ed62615166.14165754_/i/simon-daphne-baby-bridgerton.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿De qué deporte disfrutan los Bridgerton?', N'https://www.baenegocios.com/export/sites/cronica/img/2022/03/24/20220324_050525153_tmb250322-004f02.jpg_139101497.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (9, 1, 2, N'¿Cómo se llama la casa de campo de los Bridgerton?', N'https://www.medadmbjmc.in/wp-content/uploads/2022/04/Bridgertons-Aubrey-Hall.png')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (10, 1, 2, N'¿A qué canción bailan Kate y Anthony en el último capítulo de la segunda temporada?', N'https://uploads.dailydot.com/2022/03/BridgertonS2E8TheViscountWhoLovedMe-4907.jpg?auto=compress&fm=pjpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (11, 1, 3, N'¿Cómo se llamaba la capilla donde Colin descrube la identidad secreta de Penelope?', N'https://static2.amica.it/wp-content/uploads/2023/06/Bridgerton-3-foto-Netflix3_BRIDGERTON_302_Instream_053123Rcr.jpeg?v=1273167')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (12, 1, 3, N'¿Cómo se llaman los hijos de Phillip?', N'https://imgmedia.larepublica.pe/640x428/larepublica/migration/images/LA75QLQNTNHW5ER7RJNW5M5ZTM.webp')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿De quién es familiar el interés amoroso de Hyacinth?', N'https://i.pinimg.com/564x/01/3d/28/013d28351e29f02d347b68a10de95d6c.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (14, 1, 3, N'¿Cómo se llamaba el primer interés amoroso de Gregory?', N'https://assets.popbuzz.com/2022/13/how-old-is-gregory-from-bridgerton---will-tiltson-1648814583-view-0.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (15, 1, 3, N'¿De qué trabajaba Sophie?', N'https://vestuarioescenico.files.wordpress.com/2013/02/charles-baugniet-belgian-1814e280931886-c2abseamstressc2bb-1858.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (16, 3, 1, N'¿Cuántos libros hay de esta saga?', N'https://dailyillini.com/wp-content/uploads/2022/03/unnamed-900x900.png')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (17, 3, 1, N'¿Cómo se llama la protagonista?', N'https://www.themarysue.com/wp-content/uploads/2015/03/Katniss-Everdeen_Catching-Fire1.jpg?resize=612%2C380')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (18, 3, 1, N'¿Cómo se llama el país en donde viven?', N'https://pbs.twimg.com/media/B0Bi4CjIUAABEXP.png:large')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (19, 3, 1, N'¿En qué distrito viven los protagonistas?', N'https://www.wect.com/resizer/uBYevLHVVkUnK5MAN5V1vgVw8xU=/arc-photo-gray/arc3-prod/public/EVRZFMZIVJGXRFCTQ2A5C36GUM.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (20, 3, 1, N'¿Cuál es el arma de elección de Katniss?', N'https://static.wikia.nocookie.net/thehungergames/images/6/61/Armas_de_Entrenamiento.png/revision/latest?cb=20130824233638&path-prefix=es')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (21, 3, 2, N'¿Cuál es el animal que Katniss apropia como símbolo?', N'https://i.pinimg.com/originals/98/ba/37/98ba37ae64a5efa82f7d35110369d4eb.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (22, 3, 2, N'¿Cuántos participantes hay en los juegos del hambre??', N'https://static.wikia.nocookie.net/thehungergames/images/f/f7/Career-Tributes.png/revision/latest?cb=20140318020704')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (23, 3, 2, N'¿A qué se dedica el distrito 12?', N'https://static.wikia.nocookie.net/los-juegos-del-hambre-fiction/images/e/ea/Distrito_12.jpg/revision/latest?cb=20210404163252&path-prefix=es')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (24, 3, 2, N'¿Cuál es el apellido de Katniss?', N'https://static.standard.co.uk/s3fs-public/thumbnails/image/2015/11/06/08/22hungergamesmain0611a.jpg?width=1200&height=900&fit=crop')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (25, 3, 2, N'¿Cómo se llama el presidente de Panem?', N'https://static.wikia.nocookie.net/thehungergames/images/b/b7/Thg-mockingjay-presidentsnow.jpg/revision/latest/scale-to-width-down/350?cb=20140929223105')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (26, 3, 3, N'Según los libros, ¿Quién le da su icónico pin a Katniss?', N'https://medias.spotern.com/spots/w640/12/12199-1539686188.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (27, 3, 3, N'¿Quién de los tributos murió a causa de las bayas venenosas?', N'https://gcottraux.files.wordpress.com/2016/11/nightlock.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (28, 3, 3, N'¿Cuál era la peculiaridad de los mutos perrunos?', N'https://static.wikia.nocookie.net/thehungergames/images/1/1e/Mutts%2874th_HG%29.jpg/revision/latest?cb=20140927165358')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (29, 3, 3, N'¿Cuál era la mezcla de olores que identificaban al Presidente Snow?', N'https://static.wikia.nocookie.net/thehungergames/images/8/86/Jard%C3%ADn_de_rosas.png/revision/latest?cb=20150306030232&path-prefix=es')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (30, 3, 3, N'¿En qué edición de "Los juegos del Hambre", Haymitch se proclamá vencedor?', N'https://assets.isu.pub/document-structure/211203002254-2f215845e010dfd6255b084c4be0ca0e/v1/a3fb44874cea4beb14d810c755d5db07.jpeg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (31, 4, 1, N'¿Cuántos libros salieron?', N'https://www.fraymocho.com.ar/media/catalog/product/cache/5be8613c49569c873a50ed7e321cb477/9/8/9877477573_9789877477573_2022-11-26_08_00_06.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (32, 4, 1, N'¿Cuántas temporadas de la adaptación de Netflix salieron?', N'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/04/heartstopper-2687569.jpg?tf=3840x')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (33, 4, 1, N'¿Dónde se conocen los protagonistas?', N'https://www.thepinknews.com/wp-content/uploads/2023/07/Joe-Locke-Heartstopper-Nick-and-Charlie-kiss.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (34, 4, 1, N'¿En qué país toma lugar la historia?', N'https://upload.wikimedia.org/wikipedia/commons/7/7b/High_Street%2C_Burnham%2C_Bucks_-_geograph.org.uk_-_1494649.jpg?20110302172557')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (35, 4, 1, N'¿Quién de los 2 hace algún deporte?', N'https://media.distractify.com/brand-img/XQ07f_lUY/1440x754/heartstopper-sports-day-2-1650829724446.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (36, 4, 2, N'¿Cómo se llama la mascota de Nick?', N'https://www.kentonline.co.uk/_media/img/750x0/EKOTYECTE7PD4KU33LKF.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (37, 4, 2, N'¿Cómo se llama la escuela a la que van los chicos?', N'https://thecinemaholic.com/wp-content/uploads/2022/04/HS_107_Unit_00021_RT-1-e1650482711993.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (38, 4, 2, N'¿Cómo se llama la hermana de Charlie?', N'https://hips.hearstapps.com/hmg-prod/images/jenny-walser-heartstopper-season-1-1652356988.jpg?crop=0.321xw:0.650xh;0.403xw,0.0207xh&resize=980:*')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (39, 4, 2, N'¿A dónde van de viaje educativo ambas escuelas en el 4 libro?', N'https://www.infobae.com/new-resizer/T-qWHGRMziX4kAHhGZBNvdBBKkg=/arc-anglerfish-arc2-prod-infobae/public/MH2T24PHWBHJLJESCQNTOVOC5Q.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (40, 4, 2, N'¿Qué deporte hacen los chicos?', N'https://media.vanityfair.com/photos/62754bff43f4cfc941b8e484/1:1/w_1333,h_1333,c_limit/Heartstopper.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (41, 4, 3, N'¿De dónde es el padre de Nick?', N'https://static.wikia.nocookie.net/aliceoseman/images/4/44/St%C3%A9phane_Portrait.jpg/revision/latest?cb=20230715053837')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (42, 4, 3, N'¿Dónde se dan su primer beso Nick y Charlie?', N'https://i.pinimg.com/1200x/27/c6/00/27c600dcf504982e634a0f095d9717ee.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (43, 4, 3, N'¿En dónde es que Nick golpea a Harry por primera vez?', N'https://i.ytimg.com/vi/iZQInJwIFv4/mqdefault.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (44, 4, 3, N'¿Con quién le hacían pareja a Nick?', N'https://medias.spotern.com/spots/w640/357/357763-1653415005.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (45, 4, 3, N'¿Cómo se llama el hermano de Nick?', N'https://www.thepinknews.com/wp-content/uploads/2023/01/Jack-Barton-David-Nelson-Heartstopper-season-2.jpeg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (46, 6, 1, N'¿Cómo se llama el mejor amigo de Troy?', N'https://static.wikia.nocookie.net/my-high-school-musical/images/9/9d/Chad_Danforth.jpg/revision/latest?cb=20180531061504')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (47, 6, 1, N'¿Qué deporte hacían los Wildcats?', N'https://hips.hearstapps.com/cosmopolitan-uk/16/09/1456920209-high-school-musical.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (49, 6, 1, N'¿Cuál era la mascota de la escuela?', N'https://m.media-amazon.com/images/I/61mGBs7-GQL.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (50, 6, 1, N'¿Cuál era el nombre de la escuela a la que asistían los personajes?', N'https://img.ecartelera.com/noticias/fotos/28300/28322/1.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (51, 6, 1, N'¿Cuál era el nombre de los mellizos Evans?', N'https://i.insider.com/60072121660f6c0018349ca4?width=1000&format=jpeg&auto=webp')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (52, 6, 2, N'¿Qué canción toma lugar en la cafeteria en la primera película?', N'https://larepublica.cronosmedia.glr.pe/migration/images/IAUGZI5NJNE6VALDMJBMKF4B7U.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (53, 6, 2, N'En el verano, los alumnos van a trabajar a un club de verano ¿En que parte trabajan?', N'https://www.victorsancho.com/wp-content/uploads/2019/09/1-youtube-1024x576.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (54, 6, 2, N'¿En que deporte participan Chad y Ryan durante el verano?', N'https://i.insider.com/5fff6ac4fe7e140019f7ed1e?width=700&format=jpeg&auto=webp')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (55, 6, 2, N'¿Cómo se llama la escuela teatral a la que varios alumnos querían asistir?', N'https://e.rpp-noticias.io/xlarge/2021/01/25/362536_1050232.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (56, 6, 2, N'Aparte de jugar al Basket ¿Qué otro hobby tenía Zeke?', N'https://i.pinimg.com/564x/83/4f/9d/834f9dcf6a9a54f80b352dc405a9e3df.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (57, 6, 3, N'¿Cuál era el número que llevaba Troy en la camiseta?', N'https://static.wikia.nocookie.net/p__/images/4/44/Troy_Bolton.jpg/revision/latest?cb=20180811071604&path-prefix=protagonist')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (58, 6, 3, N'¿Cómo se llama la primer canción que cantan en la segunda película todos juntos?', N'https://e00-elmundo.uecdn.es/television/programacion-tv/img/v2/programas/21/702241.png')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (59, 6, 3, N'¿A qué escuela se va Gabriella en la tercera película?', N'https://i.pinimg.com/originals/3c/0a/25/3c0a253290ac2106f61434da8874f2ab.png')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (60, 6, 3, N'¿Cuál es el nombre del chico que era el suplente de Troy en la obra de la tercer película?', N'https://i.pinimg.com/1200x/45/9c/f3/459cf310457c3117061a07933a9f9337.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (61, 6, 3, N'¿Por qué canción se pelea Sharpay en pleno show en la tercera película?', N'https://static.wikia.nocookie.net/hsm/images/b/bc/Hsm-3-disneyscreencaps.com-11256.jpg/revision/latest/scale-to-width-down/250?cb=20200812182631')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (63, 5, 1, N'¿Como se llama el hijo de la protagonista?', N'https://static.wikia.nocookie.net/onceuponatime/images/5/50/HenryMills.png/revision/latest?cb=20141029221443&path-prefix=es')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (64, 5, 1, N'¿De que trabajaba Emma?', N'https://i.ytimg.com/vi/iO49_QQlbhE/hqdefault.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (65, 5, 1, N'¿Quienes son los padres de la protagonista?', N'https://img.europapress.es/fotoweb/fotonoticia_20141015102841-14101072739_800.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (66, 5, 1, N'¿Quien es la alcaldesa?', N'https://static.wikia.nocookie.net/onceuponatime/images/f/f1/ReginaMills.JPG/revision/latest?cb=20141025140512&path-prefix=es')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (67, 5, 1, N'¿Como se llama el pueblo en que viven todos?', N'https://geektrippers.com/wp-content/uploads/2020/04/Storybrooke-from-Once-Upon-a-Time-in-Real-Life-AKA-Steveston-British-Columbia-09405.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (68, 5, 2, N'¿Quien interpreta al sombrero loco de Alicia en el Pais de las Maravillas, dentro de la serie?', N'https://psicologiaymass.files.wordpress.com/2017/07/sombrerero-loco-2.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (69, 5, 2, N'El padre de Rumplestilskin es...', N'https://i.pinimg.com/1200x/59/1f/bf/591fbf82610c97548bba9fb1b8e865a3.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (70, 5, 2, N'Que princesas NO aparecen en Once Upon the Time', N'https://i.pinimg.com/originals/f3/c5/0b/f3c50b68bd29850867053c06569c3834.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (71, 5, 2, N'¿De quien esta enamorada Mulan?', N'https://static.wikia.nocookie.net/ouaat/images/b/b1/Mulan518.jpg/revision/latest?cb=20160423055923')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (72, 5, 2, N'¿Por que Regina se vuelve la Reina Malvada?', N'https://pm1.aminoapps.com/6753/b780e0d078169f5091e7d5690baf4ebfac86509dv2_hq.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (73, 5, 3, N'¿Que villana se ve afectada por la tinta del libro de cuentos?', N'https://static.wikia.nocookie.net/onceuponatime/images/4/4f/Arenas_de_Avalon.png/revision/latest?cb=20160612022055&path-prefix=es')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (74, 5, 3, N'¿Quienes fueron Señores Oscuros?', N'https://sigueenserie.files.wordpress.com/2015/09/cpcprwpwcaaj0ig.jpg')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (75, 5, 3, N'¿De que objeto esta hecha la daga oscura?', N'https://static.wikia.nocookie.net/onceuponatime/images/0/0d/Daga_del_Oscuro.png/revision/latest/scale-to-width-down/265?cb=20150513165046&path-prefix=es')
INSERT [dbo].[Preguntas] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (76, 5, 3, N'¿Quien es el Neal Cassidy?', N'https://static.wikia.nocookie.net/onceuponatime/images/b/bf/Neal_Cassidy.png/revision/latest/scale-to-width-down/220?cb=20140621035029&path-prefix=es')
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
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 23, 1, N'Pesca', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 23, 2, N'Minería', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 23, 3, N'Cosecha', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 23, 4, N'Armamento', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 24, 1, N'Everlark', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 24, 2, N'Merdeen', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 24, 3, N'Mellark', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (110, 24, 4, N'Everdeen', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (111, 25, 1, N'Coriolanus Snow', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (112, 25, 2, N'Cornelius Snow', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (113, 25, 3, N'Cinna Snow', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (114, 25, 4, N'Nunca nos enteramos de su nombre', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (115, 26, 1, N'Greasy Sae', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (116, 26, 2, N'Su madre', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (117, 26, 3, N'Madge Undersee', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (118, 26, 4, N'Peeta Mellark', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (119, 27, 1, N'Foxface', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (120, 27, 2, N'Cato', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (121, 27, 3, N'Rue', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (122, 27, 4, N'Prim', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (123, 28, 1, N'Tenían grandes habilidades de velocidad y salto', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (124, 28, 2, N'Se parecían a los tributos muertos', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (126, 28, 3, N'Llevaban un collar con el distrito', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (127, 28, 4, N'Todas son correctas', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (128, 29, 1, N'Rosas y menta', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (129, 29, 2, N'Rosas y sangre', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (130, 29, 3, N'Menta y sangre', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (131, 29, 4, N'No tenía un olor', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (132, 30, 1, N'65', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (133, 30, 2, N'60', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (134, 30, 3, N'55', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (135, 30, 4, N'50', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (136, 31, 1, N'3', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (137, 31, 2, N'2', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (138, 31, 3, N'4', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (139, 31, 4, N'5', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (140, 32, 1, N'1', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (141, 32, 2, N'2', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (142, 32, 3, N'3', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (143, 32, 4, N'4', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (144, 33, 1, N'En un cine', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (145, 33, 2, N'En un viaje', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (146, 33, 3, N'Son vecinos', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (147, 33, 4, N'En la escuela', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (148, 34, 1, N'En Francia', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (150, 34, 2, N'En España', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (151, 34, 3, N'En Inglaterra', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (152, 34, 4, N'En Estados Unidos', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (153, 35, 1, N'Nick', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (154, 35, 2, N'Charlie', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (155, 35, 3, N'Ninguno de los 2', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (156, 35, 4, N'Los dos', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (158, 36, 1, N'Mellie', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (159, 36, 2, N'Nellie', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (161, 36, 3, N'Nemo', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (162, 36, 4, N'Memo', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (163, 37, 1, N'Truham Grammar School for Boys', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (164, 37, 2, N'Harvey Greene Grammar School for Boys', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (166, 37, 3, N'Truham Greene Grammar School for Boys', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (167, 37, 4, N'Harvey Grammar School for Boys', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (168, 38, 1, N'Mary', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (169, 38, 2, N'Victoria', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (170, 38, 3, N'Daisy', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (171, 38, 4, N'Elizabeth', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (172, 39, 1, N'A Escocia', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (173, 39, 2, N'A Estados Unidos', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (174, 39, 3, N'A España', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (175, 39, 4, N'A Francia', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (176, 40, 1, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (177, 40, 2, N'Fútbol Americano', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (178, 40, 3, N'Rugby', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (179, 40, 4, N'Cricket', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (180, 41, 1, N'Francia', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (181, 41, 2, N'Inglaterra', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (182, 41, 3, N'Escocia', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (183, 41, 4, N'Nunca se da esa información', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (184, 42, 1, N'En la escuela', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (185, 42, 2, N'En una fiesta', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (186, 42, 3, N'En el cine', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (187, 42, 4, N'En la playa', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (188, 43, 1, N'En el cien', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (189, 43, 2, N'En práctica de rugby', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (190, 43, 3, N'En su fiesta', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (191, 43, 4, N'Nunca lo golpea', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (192, 44, 1, N'Darcy', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (193, 44, 2, N'Elle', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (194, 44, 3, N'Tori', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (195, 44, 4, N'Tara', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (196, 45, 1, N'David', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (197, 45, 2, N'Paul', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (198, 45, 3, N'Harry', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (199, 45, 4, N'Ben', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (200, 46, 1, N'Ryan', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (201, 46, 2, N'Chad', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (202, 46, 3, N'Jason', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (203, 46, 4, N'Zeke', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (204, 47, 1, N'Fútbol americano', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (205, 47, 2, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (206, 47, 3, N'Basketball', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (207, 47, 4, N'Rugby', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (208, 49, 1, N'Perro', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (209, 49, 2, N'Dragón', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (210, 49, 3, N'Tigre', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (211, 49, 4, N'Lince', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (213, 50, 1, N'North High School', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (214, 50, 2, N'East High School', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (215, 50, 3, N'West High School', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (216, 50, 4, N'South High School', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (217, 51, 1, N'Sharpay y Ryan', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (218, 51, 2, N'Ashley y Lucas', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (219, 51, 3, N'Jason y Martha', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (220, 51, 4, N'Chad y Taylor', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (221, 52, 1, N'What Time Is It', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (223, 52, 2, N'We''re All In This Together', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (224, 52, 3, N'Stick To The Status Quo', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (225, 52, 4, N'A Night To Remember', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (226, 53, 1, N'Gimnasio', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (227, 53, 2, N'Golf', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (228, 53, 3, N'No trabajan', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (229, 53, 4, N'Cocina', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (230, 54, 1, N'Basketball', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (231, 54, 2, N'Baseball', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (232, 54, 3, N'Golf', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (233, 54, 4, N'Rugby', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (234, 55, 1, N'Julliard', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (235, 55, 2, N'Yale', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (236, 55, 3, N'LAMDA', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (237, 55, 4, N'UNCSA', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (238, 56, 1, N'Patinar', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (239, 56, 2, N'Cocinar', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (240, 56, 3, N'Poesía', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (241, 56, 4, N'Cantar', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (242, 57, 1, N'10', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (243, 57, 2, N'07', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (244, 57, 3, N'14', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (245, 57, 4, N'22', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (246, 58, 1, N'We''re All In This Together', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (247, 58, 2, N'Stick To The Status Quo', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (249, 58, 3, N'What Time Is It', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (250, 58, 4, N'You Are The Music In Me', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (251, 59, 1, N'Stanford', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (252, 59, 2, N'Yale', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (253, 59, 3, N'Harvard', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (254, 59, 4, N'Julliard', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (255, 60, 1, N'Jimmie', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (256, 60, 2, N'John', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (257, 60, 3, N'Chad', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (258, 60, 4, N'Jackson', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (259, 61, 1, N'Fabulous', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (260, 61, 2, N'Bop To The Top', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (261, 61, 3, N'Everyday', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (262, 61, 4, N'A Night To Remember', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (263, 63, 1, N'Ben', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (264, 63, 2, N'James', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (265, 63, 3, N'Dean', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (266, 63, 4, N'Henry', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (267, 64, 1, N'Detective', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (268, 64, 2, N'Camarera', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (269, 64, 3, N'Niñera', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (270, 64, 4, N'No trabaja', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (271, 65, 1, N'Bella y Bestia', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (272, 65, 2, N'Blancanieves y el principe', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (273, 65, 3, N'Aurora y Felipe', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (274, 65, 4, N'Es huerfana', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (275, 66, 1, N'Regina', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (276, 66, 2, N'La Reina Malvada', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (277, 66, 3, N'Todas son correctas', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (278, 66, 4, N'Todas son incorrectas', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (279, 67, 1, N'Storibrooke', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (280, 67, 2, N'Storbroke', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (282, 67, 3, N'Storybroke', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (283, 67, 4, N'Storybrooke', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (284, 68, 1, N'Jamie Dorman', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (285, 68, 2, N'Chris Evans', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (286, 68, 3, N'Sebastian Stan', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (287, 68, 4, N'Andrew Gardfield', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (288, 69, 1, N'Peter Pan', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (289, 69, 2, N'Neal Cassidy', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (290, 69, 3, N'Henry', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (291, 69, 4, N'No se revela en la serie', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (292, 70, 1, N'Aurora, Mulan y Bella', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (294, 70, 2, N'Cenicienta, Moana y Merida', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (296, 70, 3, N'Moana, Pocahontas y Elena', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (297, 70, 4, N'Ariel, Blancanieves y Rapunzel', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (298, 71, 1, N'Li Shang', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (299, 71, 2, N'Aurora', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (300, 71, 3, N'Felipe', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (302, 71, 4, N'Arturo', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (303, 72, 1, N'Porque su madre mata a su novio', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (304, 72, 2, N'Porque Blancanieves no supo guardar un secreto', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (305, 72, 3, N'Porque le rompieron el corazon', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (306, 72, 4, N'Todas son incorrectas', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (307, 73, 1, N'Ursula', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (308, 73, 2, N'Regina', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (309, 73, 3, N'Cruella', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (310, 73, 4, N'Malefica', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (311, 74, 1, N'Nimue, Zoso y Rumplestiltskin', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (314, 74, 2, N'Regina y Emma', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (317, 74, 3, N'Garfio', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (318, 74, 4, N'Todos', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (319, 75, 1, N'Excalibur, Oscuridad y Fuego de Prometeo', 1, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (320, 75, 2, N'Oscuridad y madera del arbol de Merlin', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (321, 75, 3, N'Magia de merlin', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (322, 75, 4, N'Excalibur y la bobeda oscura', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (323, 76, 1, N'El hijo de Rumplestiltskin', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (324, 76, 2, N'Papá de Henry', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (327, 76, 3, N'Ex-novio de Emma', 0, NULL)
INSERT [dbo].[Respuestas] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (328, 76, 4, N'Todas son correctas', 1, NULL)
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
