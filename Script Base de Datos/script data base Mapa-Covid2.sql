USE [Covid]
GO
/****** Object:  Table [dbo].[ContactoPaciente]    Script Date: 25/09/2020 10:16:28 ******/
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
/****** Object:  Table [dbo].[CuadroClinico]    Script Date: 25/09/2020 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuadroClinico](
	[CuadroClinicoId] [int] IDENTITY(1,1) NOT NULL,
	[HistoriaClinicaId] [int] NOT NULL,
	[Hospitalizado] [bit] NOT NULL,
	[Temperatura] [float] NULL,
	[Signos] [xml] NULL,
	[Comorbilidad] [xml] NULL,
	[FechaHoraCuadroClinico] [datetime] NULL,
	[UsuarioId] [int] NULL,
 CONSTRAINT [PK_CuadroClinico] PRIMARY KEY CLUSTERED 
(
	[CuadroClinicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 25/09/2020 10:16:28 ******/
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
/****** Object:  Table [dbo].[HistoriaClinica]    Script Date: 25/09/2020 10:16:28 ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 25/09/2020 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[PersonaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Prueba]    Script Date: 25/09/2020 10:16:28 ******/
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
/****** Object:  Table [dbo].[Receta]    Script Date: 25/09/2020 10:16:28 ******/
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
/****** Object:  Table [dbo].[Seguimiento]    Script Date: 25/09/2020 10:16:28 ******/
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
/****** Object:  Table [dbo].[Tipo]    Script Date: 25/09/2020 10:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[TipoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](30) NULL,
	[Especialidad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[TipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 25/09/2020 10:16:28 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/09/2020 10:16:28 ******/
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
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
