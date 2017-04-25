CREATE TABLE [dbo].[Tasks] (
    [id]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]            UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (250)   NOT NULL,
    [MaxScore]       BIGINT           NOT NULL,
    [TaskTypeGID]    UNIQUEIDENTIFIER NOT NULL,
    [CheckPointGID]  UNIQUEIDENTIFIER NOT NULL,
    [SourceFilePath] NVARCHAR (250)   NOT NULL,
    [AuthorGID]      UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Tasks_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid]),
    CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([TaskTypeGID]) REFERENCES [dbo].[TaskTypes] ([gid]),
    CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
);

