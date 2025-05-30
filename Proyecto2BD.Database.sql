USE [master]
GO
/****** Object:  Database [Proyecto2BD]    Script Date: 4/28/2025 3:14:59 PM ******/
CREATE DATABASE [Proyecto2BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto2BD', FILENAME = N'C:\SQLData\Proyecto2BD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto2BD_log', FILENAME = N'C:\SQLData\Proyecto2BD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Proyecto2BD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto2BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto2BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto2BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto2BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto2BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto2BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto2BD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto2BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto2BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto2BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto2BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto2BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto2BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto2BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto2BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto2BD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto2BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto2BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto2BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto2BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto2BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto2BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto2BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto2BD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto2BD] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto2BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto2BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto2BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto2BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto2BD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto2BD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proyecto2BD] SET QUERY_STORE = ON
GO
ALTER DATABASE [Proyecto2BD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Proyecto2BD]
GO
/****** Object:  Table [dbo].[BitacoraEvento]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraEvento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoEvento] [int] NOT NULL,
	[Descripcion] [varchar](1000) NULL,
	[IdPostByUser] [int] NULL,
	[PostInIP] [varchar](50) NULL,
	[PostTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Number] [int] NULL,
	[State] [int] NULL,
	[Severity] [int] NULL,
	[Line] [int] NULL,
	[ProcedureName] [varchar](100) NULL,
	[Message] [varchar](500) NULL,
	[DateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPuesto] [int] NOT NULL,
	[ValorDocumentoIdentidad] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[FechaContratacion] [date] NOT NULL,
	[SaldoVacaciones] [int] NOT NULL,
	[EsActivo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ValorDocumentoIdentidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Empleado_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Monto] [int] NOT NULL,
	[NuevoSaldo] [int] NOT NULL,
	[VisibleFlag] [bit] NOT NULL,
	[IdPostByUser] [int] NULL,
	[PostInIP] [varchar](50) NULL,
	[PostTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[SalarioXHora] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEvento]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEvento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[TipoAccion] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 4/28/2025 3:14:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BitacoraEvento] ADD  DEFAULT (getdate()) FOR [PostTime]
GO
ALTER TABLE [dbo].[DBErrors] ADD  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Empleado] ADD  DEFAULT ((0)) FOR [SaldoVacaciones]
GO
ALTER TABLE [dbo].[Empleado] ADD  DEFAULT ((1)) FOR [EsActivo]
GO
ALTER TABLE [dbo].[Movimiento] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Movimiento] ADD  DEFAULT ((1)) FOR [VisibleFlag]
GO
ALTER TABLE [dbo].[Movimiento] ADD  DEFAULT (getdate()) FOR [PostTime]
GO
ALTER TABLE [dbo].[BitacoraEvento]  WITH CHECK ADD FOREIGN KEY([IdPostByUser])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[BitacoraEvento]  WITH CHECK ADD FOREIGN KEY([IdTipoEvento])
REFERENCES [dbo].[TipoEvento] ([Id])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puesto] ([Id])
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD FOREIGN KEY([IdPostByUser])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([Id])
GO
ALTER TABLE [dbo].[TipoMovimiento]  WITH CHECK ADD CHECK  (([TipoAccion]='Debito' OR [TipoAccion]='Credito'))
GO
/****** Object:  StoredProcedure [dbo].[sp_FiltrarEmpleados]    Script Date: 4/28/2025 3:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_FiltrarEmpleados]
    @Filtro VARCHAR(100),
    @IP VARCHAR(50), -- Para bitácora
    @IdUsuario INT   -- Usuario que realiza la consulta
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EsNumerico BIT = 0;
    DECLARE @TipoEventoId INT;

    BEGIN TRY
        -- 1. Validar si el filtro es numérico (búsqueda por documento)
        IF @Filtro = '' OR @Filtro IS NULL
        BEGIN
            -- Listar todos los empleados si el filtro está vacío
            SELECT 
                E.Id,
                E.ValorDocumentoIdentidad AS Documento,
                E.Nombre,
                P.Nombre AS Puesto,
                E.SaldoVacaciones
            FROM Empleado E
            JOIN Puesto P ON E.IdPuesto = P.Id
            WHERE E.EsActivo = 1
            ORDER BY E.Nombre ASC;

            SET @TipoEventoId = (SELECT Id FROM TipoEvento WHERE Nombre = 'Consulta sin filtro');
        END
        ELSE
        BEGIN
            -- Verificar si el filtro contiene solo números
            SET @EsNumerico = CASE WHEN @Filtro LIKE '%[^0-9]%' THEN 0 ELSE 1 END;

            IF @EsNumerico = 1
            BEGIN
                -- Búsqueda por documento (numérico)
                SELECT 
                    E.Id,
                    E.ValorDocumentoIdentidad AS Documento,
                    E.Nombre,
                    P.Nombre AS Puesto,
                    E.SaldoVacaciones
                FROM Empleado E
                JOIN Puesto P ON E.IdPuesto = P.Id
                WHERE E.EsActivo = 1
                  AND E.ValorDocumentoIdentidad LIKE '%' + @Filtro + '%'
                ORDER BY E.Nombre ASC;

                SET @TipoEventoId = (SELECT Id FROM TipoEvento WHERE Nombre = 'Consulta con filtro de cedula');
            END
            ELSE
            BEGIN
                -- Búsqueda por nombre (texto)
                SELECT 
                    E.Id,
                    E.ValorDocumentoIdentidad AS Documento,
                    E.Nombre,
                    P.Nombre AS Puesto,
                    E.SaldoVacaciones
                FROM Empleado E
                JOIN Puesto P ON E.IdPuesto = P.Id
                WHERE E.EsActivo = 1
                  AND E.Nombre LIKE '%' + @Filtro + '%'
                ORDER BY E.Nombre ASC;

                SET @TipoEventoId = (SELECT Id FROM TipoEvento WHERE Nombre = 'Consulta con filtro de nombre');
            END
        END

        -- Registrar en bitácora
        INSERT INTO BitacoraEvento (
            IdTipoEvento,
            IdPostByUser,
            PostInIP,
            PostTime,
            Descripcion
        )
        VALUES (
            @TipoEventoId,
            @IdUsuario,
            @IP,
            GETDATE(),
            CASE 
                WHEN @Filtro IS NULL OR @Filtro = '' THEN 'Consulta sin filtro'
                WHEN @EsNumerico = 1 THEN 'Filtro por documento: ' + @Filtro
                ELSE 'Filtro por nombre: ' + @Filtro
            END
        );
    END TRY
    BEGIN CATCH
        -- Registrar error técnico
        INSERT INTO DBErrors (UserName, Number, Message, DateTime)
        VALUES (
            (SELECT Username FROM Usuario WHERE Id = @IdUsuario),
            ERROR_NUMBER(),
            ERROR_MESSAGE(),
            GETDATE()
        );

        -- Devolver error genérico
        SELECT 
            -1 AS Id,
            'Error' AS Documento,
            'Ocurrió un error al filtrar empleados: ' + ERROR_MESSAGE() AS Nombre,
            '' AS Puesto,
            0 AS SaldoVacaciones;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarEmpleado]    Script Date: 4/28/2025 3:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarEmpleado]
    @ValorDocumentoIdentidad VARCHAR(20),
    @Nombre VARCHAR(100),
    @NombrePuesto VARCHAR(50),  -- Se recibe el nombre, no el ID
    @IdUsuario INT,              -- Usuario que realiza la acción
    @IP VARCHAR(50),             -- IP para bitácora
    @CodigoError INT OUTPUT,
    @Mensaje VARCHAR(200) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @IdPuesto INT;
    DECLARE @DescripcionError VARCHAR(200);
    DECLARE @DatosAntes VARCHAR(500) = '';
    DECLARE @DatosDespues VARCHAR(500) = '';

    BEGIN TRY
        -- Validación 1: Documento identidad numérico
        IF @ValorDocumentoIdentidad LIKE '%[^0-9]%'
        BEGIN
            SET @CodigoError = 50010; -- Valor documento no numérico
            SET @Mensaje = 'El documento de identidad debe contener solo números.';
            SET @DescripcionError = 'Intento de inserción fallido: Documento no numérico (' + @ValorDocumentoIdentidad + ')';
            GOTO RegistrarError;
        END

        -- Validación 2: Nombre alfabético (permite espacios)
        IF @Nombre LIKE '%[^a-zA-Z áéíóúÁÉÍÓÚñÑ]%'
        BEGIN
            SET @CodigoError = 50009; -- Nombre no alfabético
            SET @Mensaje = 'El nombre debe contener solo letras y espacios.';
            SET @DescripcionError = 'Intento de inserción fallido: Nombre no alfabético (' + @Nombre + ')';
            GOTO RegistrarError;
        END

        -- Validación 3: Unicidad de documento y nombre
        IF EXISTS (SELECT 1 FROM Empleado WHERE ValorDocumentoIdentidad = @ValorDocumentoIdentidad AND EsActivo = 1)
        BEGIN
            SET @CodigoError = 50004; -- Documento ya existe
            SET @Mensaje = 'Ya existe un empleado con este documento de identidad.';
            SET @DescripcionError = 'Intento de inserción fallido: Documento duplicado (' + @ValorDocumentoIdentidad + ')';
            GOTO RegistrarError;
        END

        IF EXISTS (SELECT 1 FROM Empleado WHERE Nombre = @Nombre AND EsActivo = 1)
        BEGIN
            SET @CodigoError = 50005; -- Nombre ya existe
            SET @Mensaje = 'Ya existe un empleado con este nombre.';
            SET @DescripcionError = 'Intento de inserción fallido: Nombre duplicado (' + @Nombre + ')';
            GOTO RegistrarError;
        END

        -- Obtener ID del puesto por nombre
        SELECT @IdPuesto = Id FROM Puesto WHERE Nombre = @NombrePuesto;
        IF @IdPuesto IS NULL
        BEGIN
            SET @CodigoError = 50008; -- Error de BD
            SET @Mensaje = 'El puesto seleccionado no existe.';
            SET @DescripcionError = 'Intento de inserción fallido: Puesto no encontrado (' + @NombrePuesto + ')';
            GOTO RegistrarError;
        END

        -- Preparar datos para bitácora (éxito)
        SET @DatosDespues = 'Documento: ' + @ValorDocumentoIdentidad + ', Nombre: ' + @Nombre + ', Puesto: ' + @NombrePuesto;

        -- Iniciar transacción
        BEGIN TRANSACTION;

        -- Insertar empleado
        INSERT INTO Empleado (
            IdPuesto,
            ValorDocumentoIdentidad,
            Nombre,
            FechaContratacion,
            SaldoVacaciones,
            EsActivo
        )
        VALUES (
            @IdPuesto,
            @ValorDocumentoIdentidad,
            @Nombre,
            GETDATE(), -- Fecha actual
            0,         -- Saldo inicial
            1          -- Activo
        );

        -- Registrar éxito en bitácora
        INSERT INTO BitacoraEvento (
            IdTipoEvento,
            IdPostByUser,
            PostInIP,
            PostTime,
            Descripcion
        )
        VALUES (
            (SELECT Id FROM TipoEvento WHERE Nombre = 'Inserción exitosa'),
            @IdUsuario,
            @IP,
            GETDATE(),
            @DatosDespues
        );

        COMMIT TRANSACTION;
        SET @CodigoError = 0;
        SET @Mensaje = 'Empleado insertado correctamente.';
        RETURN;

        RegistrarError:
            -- Registrar error en bitácora
            INSERT INTO BitacoraEvento (
                IdTipoEvento,
                IdPostByUser,
                PostInIP,
                PostTime,
                Descripcion
            )
            VALUES (
                (SELECT Id FROM TipoEvento WHERE Nombre = 'Inserción no exitosa'),
                @IdUsuario,
                @IP,
                GETDATE(),
                @DescripcionError + ' | Datos intentados: ' + @DatosDespues
            );

            -- Registrar error técnico si es necesario
            IF @CodigoError = 50008
            BEGIN
                INSERT INTO DBErrors (UserName, Number, Message, DateTime)
                VALUES (
                    (SELECT Username FROM Usuario WHERE Id = @IdUsuario),
                    @CodigoError,
                    @Mensaje,
                    GETDATE()
                );
            END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @CodigoError = 50008; -- Error de BD
        SET @Mensaje = 'Error al insertar empleado: ' + ERROR_MESSAGE();

        INSERT INTO DBErrors (UserName, Number, Message, DateTime)
        VALUES (
            (SELECT Username FROM Usuario WHERE Id = @IdUsuario),
            ERROR_NUMBER(),
            ERROR_MESSAGE(),
            GETDATE()
        );
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 4/28/2025 3:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarUsuario]
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @IP VARCHAR(50),
    @CodigoError INT OUTPUT,
    @Mensaje VARCHAR(200) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Inicialización explícita de outputs
    SET @CodigoError = -1;
    SET @Mensaje = 'Error no especificado';
    
    DECLARE @UsuarioId INT = NULL;
    DECLARE @IntentosFallidos INT = 0;
    DECLARE @UltimoIntento DATETIME = NULL;
    DECLARE @EstaBloqueado BIT = 0;

    BEGIN TRY
        -- 1. Obtener ID de usuario si existe
        SELECT @UsuarioId = Id FROM Usuario WHERE Username = @Username;
        
        -- 2. Verificar bloqueo por IP (regla del profesor)
        SELECT @IntentosFallidos = COUNT(*)
        FROM BitacoraEvento BE
        JOIN TipoEvento TE ON BE.IdTipoEvento = TE.Id
        WHERE 
            (BE.IdPostByUser = @UsuarioId OR BE.Descripcion LIKE '%' + @Username + '%')
            AND TE.Nombre = 'Login No Exitoso'
            AND BE.PostInIP = @IP  -- Filtro por IP
            AND BE.PostTime >= DATEADD(MINUTE, -30, GETDATE());

        -- 3. Lógica de bloqueo (exactamente como lo pide el profesor)
        IF @IntentosFallidos >= 5
        BEGIN
            SELECT @UltimoIntento = MAX(PostTime)
            FROM BitacoraEvento BE
            JOIN TipoEvento TE ON BE.IdTipoEvento = TE.Id
            WHERE BE.PostInIP = @IP
              AND TE.Nombre = 'Login No Exitoso'
              AND BE.PostTime >= DATEADD(MINUTE, -30, GETDATE());

            IF DATEDIFF(MINUTE, @UltimoIntento, GETDATE()) < 10
            BEGIN
                SET @EstaBloqueado = 1;
                SET @CodigoError = 50003;
                SET @Mensaje = 'Demasiados intentos de login. Intente de nuevo en 10 minutos.';
                
                INSERT INTO BitacoraEvento (IdTipoEvento, Descripcion, PostInIP, PostTime)
                VALUES (
                    (SELECT Id FROM TipoEvento WHERE Nombre = 'Login Deshabilitado'),
                    'Usuario: ' + @Username + ' bloqueado temporalmente',
                    @IP,
                    GETDATE()
                );
                RETURN;
            END
        END

        -- 4. Validación de credenciales robusta
        IF @UsuarioId IS NULL
        BEGIN
            SET @CodigoError = 50001;
            SET @Mensaje = 'Usuario no existe';
            
            INSERT INTO BitacoraEvento (IdTipoEvento, Descripcion, PostInIP, PostTime)
            VALUES (
                (SELECT Id FROM TipoEvento WHERE Nombre = 'Login No Exitoso'),
                'Intento fallido: Usuario no existe - IP: ' + @IP,
                NULL,
                GETDATE()
            );
            RETURN;
        END
        
        IF NOT EXISTS (SELECT 1 FROM Usuario WHERE Id = @UsuarioId AND Password = @Password)
        BEGIN
            SET @CodigoError = 50002;
            SET @Mensaje = 'Contraseña incorrecta';
            
            INSERT INTO BitacoraEvento (IdTipoEvento, Descripcion, IdPostByUser, PostInIP, PostTime)
            VALUES (
                (SELECT Id FROM TipoEvento WHERE Nombre = 'Login No Exitoso'),
                'Intento fallido #' + CAST(@IntentosFallidos + 1 AS VARCHAR),
                @UsuarioId,
                @IP,
                GETDATE()
            );
            RETURN;
        END

        -- 5. Login exitoso
        SET @CodigoError = 0;
        SET @Mensaje = 'Login exitoso';
        
        INSERT INTO BitacoraEvento (IdTipoEvento, IdPostByUser, PostInIP, PostTime)
        VALUES (
            (SELECT Id FROM TipoEvento WHERE Nombre = 'Login Exitoso'),
            @UsuarioId,
            @IP,
            GETDATE()
        );
    END TRY
    BEGIN CATCH
        SET @CodigoError = 50008;
        SET @Mensaje = 'Error en el servidor: ' + ERROR_MESSAGE();
        
        INSERT INTO DBErrors (UserName, Number, State, Severity, Line, ProcedureName, Message, DateTime)
        VALUES (
            @Username,
            ERROR_NUMBER(),
            ERROR_STATE(),
            ERROR_SEVERITY(),
            ERROR_LINE(),
            ERROR_PROCEDURE(),
            ERROR_MESSAGE(),
            GETDATE()
        );
    END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [Proyecto2BD] SET  READ_WRITE 
GO
