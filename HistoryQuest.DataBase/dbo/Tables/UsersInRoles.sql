CREATE TABLE [dbo].[UsersInRoles] (
    [id]      INT              IDENTITY (1, 1) NOT NULL,
    [gid]     UNIQUEIDENTIFIER CONSTRAINT [DF_UsersInRoles_gid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [UserGID] UNIQUEIDENTIFIER NOT NULL,
    [RoleGID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_UsersInRoles] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_UsersInRoles_Roles] FOREIGN KEY ([RoleGID]) REFERENCES [dbo].[Roles] ([gid]),
    CONSTRAINT [FK_UsersInRoles_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
);

