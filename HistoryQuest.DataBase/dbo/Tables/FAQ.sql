CREATE TABLE [dbo].[FAQ] (
    [id]       INT              IDENTITY (1, 1) NOT NULL,
    [gid]      UNIQUEIDENTIFIER NOT NULL,
    [Question] NVARCHAR (1000)  NOT NULL,
    [Answer]   NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED ([gid] ASC)
);

