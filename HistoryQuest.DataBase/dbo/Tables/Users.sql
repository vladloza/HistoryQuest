CREATE TABLE [dbo].[Users] (
    [id]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]            UNIQUEIDENTIFIER CONSTRAINT [DF_Users_gid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [UserName]       NVARCHAR (256)   NOT NULL,
    [Password]       NVARCHAR (256)   NULL,
    [PasswordFormat] INT              CONSTRAINT [DF_Users_PasswordFormat] DEFAULT ((0)) NULL,
    [PasswordSalt]   NVARCHAR (256)   NULL,
    [FaceGID]        UNIQUEIDENTIFIER NULL,
    [SocialName]       NVARCHAR (256)              CONSTRAINT [DF_Users_SocialName] NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Users_Faces] FOREIGN KEY ([FaceGID]) REFERENCES [dbo].[Faces] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [IX_Users_UserName] UNIQUE NONCLUSTERED ([UserName] ASC, [SocialName] ASC)
);









