CREATE TABLE [dbo].[Quests] (
    [id]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]            UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (250)   NOT NULL,
    [SourceFilePath] NVARCHAR (250)   NOT NULL,
    [AuthorGID]      UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Quests] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Quests_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
);

