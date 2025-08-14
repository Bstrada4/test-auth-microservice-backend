BEGIN TRY

BEGIN TRAN;

-- CreateSchema
EXEC sp_executesql N'CREATE SCHEMA [seguridad];';;

-- CreateTable
CREATE TABLE [seguridad].[Usuario] (
    [nIdUsuario] INT NOT NULL IDENTITY(1,1),
    [sUsuario] VARCHAR(50) NOT NULL,
    [sPassword] VARBINARY(max) NOT NULL,
    [bActivo] BIT NOT NULL,
    [nIdTipoUsuario] INT NOT NULL,
    [nIdPerDet] INT,
    [nIdPersona] INT,
    [bChangePassword] BIT NOT NULL,
    CONSTRAINT [Usuario_pkey] PRIMARY KEY CLUSTERED ([nIdUsuario])
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
