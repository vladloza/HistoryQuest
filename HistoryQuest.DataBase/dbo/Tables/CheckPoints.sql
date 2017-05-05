CREATE TABLE [dbo].[CheckPoints] (
    [id]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]            UNIQUEIDENTIFIER NOT NULL,
    [QuestGID]       UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (250)   NOT NULL,
    [GeoCoordinates] NVARCHAR (250)   NOT NULL,
    [InfoFilePath]   NVARCHAR (250)   NOT NULL,
    [TasksCount]     INT              NOT NULL,
    [ThresholdScore] INT              NULL,
    [OrderId]        INT              NOT NULL,
    [IsBonus]        BIT              CONSTRAINT [DF_CheckPoints_IsBonus] DEFAULT ((0)) NOT NULL,
    [ParentGID]      UNIQUEIDENTIFIER NULL,
    [AuthorGID]      UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_CheckPoints] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_CheckPoints_CheckPoints] FOREIGN KEY ([ParentGID]) REFERENCES [dbo].[CheckPoints] ([gid]),
    CONSTRAINT [FK_CheckPoints_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid]),
    CONSTRAINT [FK_CheckPoints_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
);





