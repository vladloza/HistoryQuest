CREATE TABLE [dbo].[Tries] (
    [id]           BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]          UNIQUEIDENTIFIER NOT NULL,
    [QuestGID]     UNIQUEIDENTIFIER NOT NULL,
    [UserGID]      UNIQUEIDENTIFIER NOT NULL,
    [IsSuccessful] BIT              NULL,
    CONSTRAINT [PK_Tries] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Tries_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid]),
    CONSTRAINT [FK_Tries_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
);

