BEGIN TRY

BEGIN TRAN;

-- CreateSchema
EXEC sp_executesql N'CREATE SCHEMA [maestros];';;

-- CreateTable
CREATE TABLE [maestros].[Persona] (
    [nIdPersona] INT NOT NULL IDENTITY(1,1),
    [nIdTipo] INT NOT NULL,
    [sPriNombre] NVARCHAR(1000),
    [sSegNombre] NVARCHAR(1000),
    [sApePaterno] NVARCHAR(1000),
    [sApeMaterno] NVARCHAR(1000),
    [sNombreCompleto] NVARCHAR(1000),
    [dFechaNac] DATETIME2,
    [nIdUbigeoNac] INT,
    [nIdGenero] INT,
    [nIdEstadoCivil] INT,
    [sCorreo] VARCHAR(50),
    [sCelular] VARCHAR(50),
    [sCelular2] VARCHAR(50),
    [sTelefono] VARCHAR(50),
    [sDNI] VARCHAR(8),
    [sCE] VARCHAR(12),
    [sRUC] VARCHAR(11),
    [nIdUsuario_crea] INT NOT NULL,
    [dFecha_crea] DATETIME2 NOT NULL,
    [nIdUsuario_mod] INT,
    [dFecha_mod] DATETIME2,
    [Id_Old] INT,
    CONSTRAINT [Persona_pkey] PRIMARY KEY CLUSTERED ([nIdPersona])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
