USE [Covid]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 15/09/2020 13:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[DistritoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NULL,
 CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED 
(
	[DistritoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 15/09/2020 13:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[PersonaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[DNI] [char](8) NULL,
	[NroCelular] [char](9) NULL,
	[Estado] [nvarchar](15) NULL,
	[UbicacionId] [int] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 15/09/2020 13:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[UbicacionId] [int] IDENTITY(1,1) NOT NULL,
	[Lat] [nvarchar](20) NULL,
	[Long] [nvarchar](20) NULL,
	[Calle] [nvarchar](50) NULL,
	[NroCasa] [int] NULL,
	[Referencia] [nvarchar](100) NULL,
	[DistritoId] [int] NULL,
 CONSTRAINT [PK_Ubicacion] PRIMARY KEY CLUSTERED 
(
	[UbicacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Distrito] ON 

INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (1, N'ASUNCIÓN')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (2, N'CAJAMARCA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (3, N'CHETILLA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (4, N'COSPÁN')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (5, N'JESÚS')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (6, N'LA ENCAÑADA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (7, N'LLACANORA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (8, N'LOS BAÑOS DEL INCA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (9, N'MAGDALENA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (10, N'MATARA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (11, N'NAMORA')
INSERT [dbo].[Distrito] ([DistritoId], [Nombre]) VALUES (12, N'SAN JUAN')
SET IDENTITY_INSERT [dbo].[Distrito] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([PersonaId], [Nombre], [Apellido], [DNI], [NroCelular], [Estado], [UbicacionId]) VALUES (4, N'Jorge', N'Cabrera', N'12345678', N'123456789', N'Recuperado', 1)
INSERT [dbo].[Persona] ([PersonaId], [Nombre], [Apellido], [DNI], [NroCelular], [Estado], [UbicacionId]) VALUES (6, N'Pedro', N'Aquino', N'87654321', N'987654132', N'Positivo', 2)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Ubicacion] ON 

INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (1, N'-7.163147', N'-78.470161', N'Urtado Miller', 1, N'Frente Serenazgo', 8)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (2, N'-7.157846024655005', N'-78.46274436573123', N'Prolong. Pachacutec', 1000, N'Espaldas de Inia', 8)
SET IDENTITY_INSERT [dbo].[Ubicacion] OFF
GO
