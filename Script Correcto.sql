USE [master]
GO
/****** Object:  Database [TP-PIA]    Script Date: 10/7/2023 12:03:35 ******/
CREATE DATABASE [TP-PIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP-PIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP-PIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP-PIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP-PIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP-PIA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP-PIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP-PIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP-PIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP-PIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP-PIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP-PIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP-PIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP-PIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP-PIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP-PIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP-PIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP-PIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP-PIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP-PIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP-PIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP-PIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP-PIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP-PIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP-PIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP-PIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP-PIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP-PIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP-PIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP-PIA] SET RECOVERY FULL 
GO
ALTER DATABASE [TP-PIA] SET  MULTI_USER 
GO
ALTER DATABASE [TP-PIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP-PIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP-PIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP-PIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP-PIA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP-PIA', N'ON'
GO
ALTER DATABASE [TP-PIA] SET QUERY_STORE = OFF
GO
USE [TP-PIA]
GO
/****** Object:  User [PIA]    Script Date: 10/7/2023 12:03:35 ******/
CREATE USER [PIA] FOR LOGIN [TP-PIA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 10/7/2023 12:03:35 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 10/7/2023 12:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [varchar](max) NOT NULL,
	[Opcion1] [varchar](max) NOT NULL,
	[Opcion2] [varchar](max) NOT NULL,
	[Opcion3] [varchar](max) NOT NULL,
	[Opcion4] [varchar](max) NOT NULL,
	[RespuestaCorrecta] [varchar](max) NOT NULL,
	[FechaDeCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 10/7/2023 12:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RespuestaSeleccionada] [varchar](max) NULL,
	[EsRespuestaCorrecta] [bit] NULL,
	[FechaDeCreacion] [datetime] NULL,
 CONSTRAINT [PK_Respuestas_1] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [Opcion1], [Opcion2], [Opcion3], [Opcion4], [RespuestaCorrecta], [FechaDeCreacion]) VALUES (1, N'¿De que color es el traje de flash?', N'Rojo y Rosa', N'Verde y Azul', N'Amarillo y Celeste', N'Rojo Y Amarillo', N'4', CAST(N'1940-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [Opcion1], [Opcion2], [Opcion3], [Opcion4], [RespuestaCorrecta], [FechaDeCreacion]) VALUES (2, N'¿Cual es la debilidad de Superman?', N'Adamantio', N'Kriptonita', N'Vibranio', N'Zulfuro', N'2', CAST(N'1990-04-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [Opcion1], [Opcion2], [Opcion3], [Opcion4], [RespuestaCorrecta], [FechaDeCreacion]) VALUES (3, N'¿Quien es el disipulo de Batman?', N'Flash', N'Mujer Maravilla', N'Chico Bestia', N'Robin', N'4', CAST(N'2000-06-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [Opcion1], [Opcion2], [Opcion3], [Opcion4], [RespuestaCorrecta], [FechaDeCreacion]) VALUES (4, N'¿Quien es ironman?', N'Bruce Banner', N'Nick Fury', N'Tony Stark', N'Steve Rogers', N'3', CAST(N'2005-08-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdPregunta], [UserId], [RespuestaSeleccionada], [EsRespuestaCorrecta], [FechaDeCreacion]) VALUES (1, 1, N'Opcion 4', 1, CAST(N'1933-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Respuestas] ([IdPregunta], [UserId], [RespuestaSeleccionada], [EsRespuestaCorrecta], [FechaDeCreacion]) VALUES (2, 2, N'Opcion  2', 1, CAST(N'1999-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Respuestas] ([IdPregunta], [UserId], [RespuestaSeleccionada], [EsRespuestaCorrecta], [FechaDeCreacion]) VALUES (3, 3, N'Opcion 4', 1, CAST(N'2003-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Respuestas] ([IdPregunta], [UserId], [RespuestaSeleccionada], [EsRespuestaCorrecta], [FechaDeCreacion]) VALUES (4, 4, N'Opcion 3', 1, CAST(N'2000-04-11T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
USE [master]
GO
ALTER DATABASE [TP-PIA] SET  READ_WRITE 
GO
