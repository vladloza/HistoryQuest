CREATE TABLE [dbo].[CheckPointsToTries] (
    [id]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]           UNIQUEIDENTIFIER NOT NULL,
    [CheckPointGID] UNIQUEIDENTIFIER NOT NULL,
    [TryGID]        UNIQUEIDENTIFIER NOT NULL,
    [IsFailed]      BIT              CONSTRAINT [DF_CheckpointsToTries_IsFailed] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CheckpointsToTries] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_CheckpointsToTries_Checkpoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid]),
    CONSTRAINT [FK_CheckpointsToTries_Tries] FOREIGN KEY ([TryGID]) REFERENCES [dbo].[Tries] ([gid])
);

