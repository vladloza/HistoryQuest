CREATE TABLE [dbo].[Roles] (
    [id]   INT              IDENTITY (1, 1) NOT NULL,
    [gid]  UNIQUEIDENTIFIER CONSTRAINT [DF_Roles_gid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [Name] NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([gid] ASC)
);

