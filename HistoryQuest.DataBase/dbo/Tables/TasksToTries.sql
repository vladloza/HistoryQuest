CREATE TABLE [dbo].[TasksToTries] (
    [id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]         UNIQUEIDENTIFIER NOT NULL,
    [UserGID]     UNIQUEIDENTIFIER NOT NULL,
    [TryGID]      UNIQUEIDENTIFIER NOT NULL,
    [EarnedScore] INT              NOT NULL,
    [ElapsedTime] BIGINT           NOT NULL,
    CONSTRAINT [PK_TasksToTries] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_TasksToTries_Tries] FOREIGN KEY ([TryGID]) REFERENCES [dbo].[Tries] ([gid]),
    CONSTRAINT [FK_TasksToTries_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
);

