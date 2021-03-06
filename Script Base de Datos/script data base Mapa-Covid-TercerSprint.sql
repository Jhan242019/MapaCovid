USE [Covid]
GO
/****** Object:  Table [dbo].[ContactoPaciente]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactoPaciente](
	[ContactoId] [int] IDENTITY(1,1) NOT NULL,
	[SeguimientoId] [int] NULL,
 CONSTRAINT [PK_ContactoPaciente] PRIMARY KEY CLUSTERED 
(
	[ContactoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuadroClinico]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuadroClinico](
	[CuadroClinicoId] [int] IDENTITY(1,1) NOT NULL,
	[HistoriaClinicaId] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[TipoMonitoreo] [nvarchar](20) NULL,
	[FuncionesVitales] [xml] NULL,
	[SignosSintomas] [xml] NULL,
	[SintomasAlarma] [xml] NULL,
	[Evolucion] [nvarchar](100) NULL,
	[Observaciones] [nvarchar](100) NULL,
	[UsuarioId] [int] NULL,
 CONSTRAINT [PK_CuadroClinico] PRIMARY KEY CLUSTERED 
(
	[CuadroClinicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 11/10/2020 13:48:31 ******/
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
/****** Object:  Table [dbo].[HistoriaClinica]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaClinica](
	[HistoriaClinicaId] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [int] NULL,
 CONSTRAINT [PK_HistoriaClinica] PRIMARY KEY CLUSTERED 
(
	[HistoriaClinicaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[PersonaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[DNI] [char](8) NULL,
	[NroCelular] [varchar](12) NULL,
	[Estado] [nvarchar](15) NULL,
	[UbicacionId] [int] NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[Sexo] [char](1) NULL,
	[TelefonoEmergencia] [varchar](12) NULL,
	[CorreoElectronico] [nvarchar](50) NULL,
	[CondicionDeRiesgo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prueba]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prueba](
	[PruebaId] [int] IDENTITY(1,1) NOT NULL,
	[HistoriaClinicaId] [int] NULL,
	[FechaHoraRealizada] [datetime] NULL,
	[Resultado] [nvarchar](100) NULL,
	[Observacion] [nvarchar](100) NULL,
	[TipoMuestra] [nvarchar](50) NULL,
 CONSTRAINT [PK_Prueba] PRIMARY KEY CLUSTERED 
(
	[PruebaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[RecetaId] [int] IDENTITY(1,1) NOT NULL,
	[CuadroClinicoId] [int] NULL,
	[FechaEmision] [datetime] NULL,
	[Descripcion] [nvarchar](200) NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[RecetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seguimiento]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seguimiento](
	[SeguimientoId] [int] IDENTITY(1,1) NOT NULL,
	[HistoriaClinicaId] [int] NULL,
 CONSTRAINT [PK_Seguimiento] PRIMARY KEY CLUSTERED 
(
	[SeguimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[TipoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](30) NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[TipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 11/10/2020 13:48:31 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/10/2020 13:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[TipoId] [int] NOT NULL,
	[DNI] [char](8) NOT NULL,
	[NombreUsuario] [nvarchar](20) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](12) NOT NULL,
	[Especialidad] [nvarchar](20) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CuadroClinico] ON 

INSERT [dbo].[CuadroClinico] ([CuadroClinicoId], [HistoriaClinicaId], [Fecha], [TipoMonitoreo], [FuncionesVitales], [SignosSintomas], [SintomasAlarma], [Evolucion], [Observaciones], [UsuarioId]) VALUES (1, 5, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'Llamada telefónica', N'{"PresionArterialSistolica":100,"PresionArterialDiastolica":20,"FrecuenciaCardiaca":50,"FrecuencaRespiratoria":50,"Temperatura":39}', N'[{"Sintoma":"Tos","EstaMarcado":true},{"Sintoma":"Dolor de Garganta","EstaMarcado":false},{"Sintoma":"Congestion nasal","EstaMarcado":false},{"Sintoma":"Fiebre","EstaMarcado":true},{"Sintoma":"Malestar general","EstaMarcado":false},{"Sintoma":"Dificultad respiratoria","EstaMarcado":false},{"Sintoma":"Diarrea","EstaMarcado":false},{"Sintoma":"Nausea/Vomito","EstaMarcado":false},{"Sintoma":"Cefalea","EstaMarcado":false},{"Sintoma":"Irritabilidad/Confusion","EstaMarcado":false},{"Sintoma":"Dolor muscular","EstaMarcado":false},{"Sintoma":"Dolor abdominal","EstaMarcado":false},{"Sintoma":"Dolor pecho","EstaMarcado":true},{"Sintoma":"Dolor articulaciones","EstaMarcado":false},{"Sintoma":null,"EstaMarcado":false}]', N'[{"Sintoma":"Disnea","EstaMarcado":false},{"Sintoma":"Taquipnea(\u003E=22rpm)","EstaMarcado":false},{"Sintoma":"Saturacion de oxigeno \u003C 92%","EstaMarcado":false},{"Sintoma":"Alteracion de la conciencia","EstaMarcado":false},{"Sintoma":"Ningun Signo de alarma","EstaMarcado":true}]', N'Moderado', NULL, 1)
SET IDENTITY_INSERT [dbo].[CuadroClinico] OFF
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
SET IDENTITY_INSERT [dbo].[HistoriaClinica] ON 

INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (1, 3)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (2, 4)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (3, 5)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (4, 6)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (5, 7)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (6, 8)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (7, 9)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (8, 10)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (9, 11)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (10, 12)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (11, 13)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (12, 14)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (13, 15)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (14, 16)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (15, 17)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (16, 18)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (17, 19)
INSERT [dbo].[HistoriaClinica] ([HistoriaClinicaId], [PersonaId]) VALUES (18, 20)
SET IDENTITY_INSERT [dbo].[HistoriaClinica] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (1, N'Jorge', N'Cabrera Abanto', N'78542136', N'987654159', N'Positivo', 1, CAST(N'1999-09-17T00:00:00.000' AS DateTime), N'M', N'987456147', N'JorgeC@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (2, N'Jorge', N'Cabrera Abanto', N'74785968', N'987654159', N'Positivo', 2, CAST(N'1999-09-17T00:00:00.000' AS DateTime), N'M', N'987456147', N'JorgeC@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (3, N'Mariana', N'Terrones', N'72354810', N'941526378', N'Recuperado', 3, CAST(N'2020-09-17T00:00:00.000' AS DateTime), N'F', N'965412783', N'MarianaT@Correo.com', N'Desnutricion')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (4, N'Diego', N'Pajares', N'24875961', N'941526378', N'Positivo', 4, CAST(N'2020-09-23T00:00:00.000' AS DateTime), N'M', N'965412783', N'DiegoP', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (5, N'Jose', N'Villalobos', N'25784961', N'987287495', N'Positivo', 5, CAST(N'1996-09-10T00:00:00.000' AS DateTime), N'M', N'912365478', N'JoseV@correo.com', N'Cancer')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (6, N'Kiara', N'Urteaga', N'24518697', N'987287495', N'Negativo', 6, CAST(N'1994-03-28T00:00:00.000' AS DateTime), N'F', N'951986145', N'KiaraU@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (7, N'Estefany', N'Altamirano Perez', N'24517896', N'987287495', N'Positivo', 7, CAST(N'1998-09-25T00:00:00.000' AS DateTime), N'F', N'912365478', N'EstefanyA@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (8, N'Carlos', N'Contreras Vazques', N'24518794', N'941526378', N'Fallecido', 8, CAST(N'1993-10-11T00:00:00.000' AS DateTime), N'M', N'965412783', N'CarlosC@correo.com', N'Diabetes')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (9, N'Rafael', N'Vazques Cotrina', N'24517867', N'941526378', N'Positivo', 9, CAST(N'1999-09-22T00:00:00.000' AS DateTime), N'M', N'951986145', N'RafaelV@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (10, N'Lorena', N'Jimenez Castañeda', N'24158763', N'941526378', N'Recuperado', 10, CAST(N'1998-11-07T00:00:00.000' AS DateTime), N'F', N'951986145', N'LorenaJ@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (11, N'Augusto', N'Guillen Polo', N'24516398', N'987984954', N'Positivo', 11, CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'M', N'912365478', N'AugustoG@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (12, N'Noelia', N'Romero', N'24513654', N'987654159', N'Recuperado', 12, CAST(N'1993-03-18T00:00:00.000' AS DateTime), N'F', N'951986145', N'NoeliaR@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (13, N'Alfredo', N'Gomez Quintanilla', N'24519562', N'987654159', N'Positivo', 13, CAST(N'1996-11-25T00:00:00.000' AS DateTime), N'M', N'912365478', N'AlfredoG@correo.com', N'Diabetes')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (14, N'Sandra', N'Terrones Linares', N'24513216', N'987654159', N'Positivo', 14, CAST(N'1972-10-18T00:00:00.000' AS DateTime), N'F', N'987456147', N'SandraT@correo.com', N'Cancer')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (15, N'Luciana', N'Gonzales Condori', N'24519846', N'987654159', N'Fallecido', 15, CAST(N'1959-08-19T00:00:00.000' AS DateTime), N'F', N'912365478', N'LucianaG@correo.com', N'Diabetes')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (16, N'Diego', N'Juarez', N'24516895', N'987287495', N'Fallecido', 16, CAST(N'1995-04-04T00:00:00.000' AS DateTime), N'M', N'951986145', N'DiegoJ@correo.com', N'Cancer')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (17, N'Carlos', N'Angeles', N'24518964', N'987287495', N'Positivo', 17, CAST(N'2005-11-24T00:00:00.000' AS DateTime), N'M', N'951986145', N'CarlosA@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (18, N'Luciana', N'Suares', N'24518795', N'987984954', N'Positivo', 18, CAST(N'1991-09-18T00:00:00.000' AS DateTime), N'F', N'951986145', N'LucianaS', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (19, N'Ruth', N'Castilla Ramos', N'24513217', N'987654159', N'Positivo', 19, CAST(N'1980-03-07T00:00:00.000' AS DateTime), N'F', N'987456147', N'RuthC@correo.com', N'Ninguna')
INSERT [dbo].[Persona] ([PersonaId], [Nombres], [Apellidos], [DNI], [NroCelular], [Estado], [UbicacionId], [FechaNacimiento], [Sexo], [TelefonoEmergencia], [CorreoElectronico], [CondicionDeRiesgo]) VALUES (20, N'Juana', N'Suarez', N'24513218', N'987654159', N'Sin evaluación', 20, CAST(N'1973-04-11T00:00:00.000' AS DateTime), N'F', N'951986145', N'JuanaS@correo.com', N'Ninguna')
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo] ON 

INSERT [dbo].[Tipo] ([TipoId], [Descripcion]) VALUES (1, N'ADMINISTRADOR')
INSERT [dbo].[Tipo] ([TipoId], [Descripcion]) VALUES (2, N'MEDICO')
INSERT [dbo].[Tipo] ([TipoId], [Descripcion]) VALUES (3, N'PSICOLOGO')
SET IDENTITY_INSERT [dbo].[Tipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Ubicacion] ON 

INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (1, N'-7.163015315271669', N'-78.47008037573688', N'Hurtado Miller', 100, NULL, 8)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (2, N'-7.163015315271669', N'-78.47008037573688', N'Hurtado Miller', 100, NULL, 8)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (3, N'-7.163192023991637', N'-78.46237707144611', N'Av Atahualpa', 250, NULL, 8)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (4, N'-7.165321038547111', N'-78.49764919294104', N'Av Atahualpa', 700, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (5, N'-7.16437362829788', N'-78.50991654402607', N'Av Atahualpa', 980, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (6, N'-7.156141721298068', N'-78.52109277251658', N'Pisagua', 420, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (7, N'-7.148352516545004', N'-78.51312017453893', N'Los Cipreses', 323, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (8, N'-7.14497576917162', N'-78.51180481917255', N'Los pinos', 1020, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (9, N'-7.1450460296793', N'-78.5119764805495', N'Los pinos', 1010, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (10, N'-7.15211672969453', N'-78.51983642591223', N'Miguel Iglesias', 650, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (11, N'-7.324587624860155', N'-78.51866269114907', N'Jr Leoncio Prado', 240, NULL, 1)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (12, N'-7.146896217482834', N'-78.67300772670207', N'Los Milagros', 120, NULL, 3)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (13, N'-7.248821630686909', N'-78.38109111798987', N'Jirón Junin', 130, NULL, 5)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (14, N'-7.255028635981402', N'-78.2597812414497', N'Jirón Union', 430, NULL, 10)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (15, N'-7.1933187824340346', N'-78.4267755747169', N'Jr Amancaes', 724, N'Costado de la Policia', 7)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (16, N'-7.085874405732038', N'-78.34191370016926', N'jr Alfonzo Ugarte', 100, NULL, 6)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (17, N'-7.0851418990216954', N'-78.34238576895588', N'jr Alfonzo Ugarte', 120, NULL, 6)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (18, N'-7.1534388811305964', N'-78.50689101225727', N'San Roque', 459, NULL, 2)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (19, N'-7.291785717224052', N'-78.49735522273477', N'Jr progreso', 540, NULL, 12)
INSERT [dbo].[Ubicacion] ([UbicacionId], [Lat], [Long], [Calle], [NroCasa], [Referencia], [DistritoId]) VALUES (20, N'-7.162468156777747', N'-78.46989423036577', N'Hurtado Miller Mz. C', 0, NULL, 8)
SET IDENTITY_INSERT [dbo].[Ubicacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([UsuarioId], [TipoId], [DNI], [NombreUsuario], [Nombres], [Apellidos], [Password], [Telefono], [Especialidad]) VALUES (1, 1, N'72312710', N'pedro123', N'Pedro', N'Aquino Saenz', N'123', N'963852741', N'Medicina General')
INSERT [dbo].[Usuario] ([UsuarioId], [TipoId], [DNI], [NombreUsuario], [Nombres], [Apellidos], [Password], [Telefono], [Especialidad]) VALUES (2, 2, N'78542136', N'JorgeCabrea', N'Jorge', N'Cabrera Abanto', N'123', N'963852741', N'Medicina General')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[ContactoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ContactoPaciente_Seguimiento] FOREIGN KEY([SeguimientoId])
REFERENCES [dbo].[Seguimiento] ([SeguimientoId])
GO
ALTER TABLE [dbo].[ContactoPaciente] CHECK CONSTRAINT [FK_ContactoPaciente_Seguimiento]
GO
ALTER TABLE [dbo].[CuadroClinico]  WITH CHECK ADD  CONSTRAINT [FK_CuadroClinico_HistoriaClinica] FOREIGN KEY([HistoriaClinicaId])
REFERENCES [dbo].[HistoriaClinica] ([HistoriaClinicaId])
GO
ALTER TABLE [dbo].[CuadroClinico] CHECK CONSTRAINT [FK_CuadroClinico_HistoriaClinica]
GO
ALTER TABLE [dbo].[CuadroClinico]  WITH CHECK ADD  CONSTRAINT [FK_CuadroClinico_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[CuadroClinico] CHECK CONSTRAINT [FK_CuadroClinico_Usuario]
GO
ALTER TABLE [dbo].[HistoriaClinica]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaClinica_Persona] FOREIGN KEY([HistoriaClinicaId])
REFERENCES [dbo].[Persona] ([PersonaId])
GO
ALTER TABLE [dbo].[HistoriaClinica] CHECK CONSTRAINT [FK_HistoriaClinica_Persona]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Ubicacion] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Ubicacion] ([UbicacionId])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Ubicacion]
GO
ALTER TABLE [dbo].[Prueba]  WITH CHECK ADD  CONSTRAINT [FK_Prueba_HistoriaClinica] FOREIGN KEY([HistoriaClinicaId])
REFERENCES [dbo].[HistoriaClinica] ([HistoriaClinicaId])
GO
ALTER TABLE [dbo].[Prueba] CHECK CONSTRAINT [FK_Prueba_HistoriaClinica]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_CuadroClinico] FOREIGN KEY([CuadroClinicoId])
REFERENCES [dbo].[CuadroClinico] ([CuadroClinicoId])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_CuadroClinico]
GO
ALTER TABLE [dbo].[Seguimiento]  WITH CHECK ADD  CONSTRAINT [FK_Seguimiento_HistoriaClinica] FOREIGN KEY([SeguimientoId])
REFERENCES [dbo].[HistoriaClinica] ([HistoriaClinicaId])
GO
ALTER TABLE [dbo].[Seguimiento] CHECK CONSTRAINT [FK_Seguimiento_HistoriaClinica]
GO
ALTER TABLE [dbo].[Ubicacion]  WITH CHECK ADD  CONSTRAINT [FK_Ubicacion_Distrito] FOREIGN KEY([DistritoId])
REFERENCES [dbo].[Distrito] ([DistritoId])
GO
ALTER TABLE [dbo].[Ubicacion] CHECK CONSTRAINT [FK_Ubicacion_Distrito]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Tipo] FOREIGN KEY([TipoId])
REFERENCES [dbo].[Tipo] ([TipoId])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Personal_Tipo]
GO
