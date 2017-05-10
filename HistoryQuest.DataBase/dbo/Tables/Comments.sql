CREATE TABLE [dbo].[Comments] (
    [id]        BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]       UNIQUEIDENTIFIER NOT NULL,
    [QuestGID]  UNIQUEIDENTIFIER NOT NULL,
    [Text]      NVARCHAR (500)   NOT NULL,
    [Date]      DATETIME         NOT NULL,
    [AuthorGID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Comments_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
);



