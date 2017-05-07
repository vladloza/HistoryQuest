CREATE TABLE [dbo].[Likes] (
    [id]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]           UNIQUEIDENTIFIER NOT NULL,
    [UserGID]       UNIQUEIDENTIFIER NOT NULL,
    [CheckPointGID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Likes_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid]),
    CONSTRAINT [FK_Likes_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
);



