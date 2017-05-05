CREATE TABLE [dbo].[TasksToTries] (
    [id]                 BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]                UNIQUEIDENTIFIER NOT NULL,
    [TaskGID]            UNIQUEIDENTIFIER NOT NULL,
    [CheckPointToTryGID] UNIQUEIDENTIFIER NOT NULL,
    [EarnedScore]        INT              NOT NULL,
    [ElapsedTime]        BIGINT           NOT NULL,
    CONSTRAINT [PK_TasksToTries] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_TasksToTries_CheckpointsToTries] FOREIGN KEY ([CheckPointToTryGID]) REFERENCES [dbo].[CheckPointsToTries] ([gid]),
    CONSTRAINT [FK_TasksToTries_Tasks] FOREIGN KEY ([TaskGID]) REFERENCES [dbo].[Tasks] ([gid])
);





