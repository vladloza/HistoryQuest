CREATE TABLE [dbo].[Likes] (
    [id]      BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]     UNIQUEIDENTIFIER NOT NULL,
    [UserGID] UNIQUEIDENTIFIER NOT NULL,
    [TaskGID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Likes_Tasks] FOREIGN KEY ([TaskGID]) REFERENCES [dbo].[Tasks] ([gid]),
    CONSTRAINT [FK_Likes_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
);

