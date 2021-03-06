﻿CREATE TABLE [dbo].[Tasks] (
    [id]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]           UNIQUEIDENTIFIER NOT NULL,
    [Text]          TEXT             NOT NULL,
    [MaxScore]      INT              NOT NULL,
    [TaskTypeGID]   UNIQUEIDENTIFIER NOT NULL,
    [CheckPointGID] UNIQUEIDENTIFIER NOT NULL,
    [SourceFile]    XML              NOT NULL,
    [AuthorGID]     UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Tasks_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid]),
    CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([TaskTypeGID]) REFERENCES [dbo].[TaskTypes] ([gid]),
    CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
);







