﻿CREATE TABLE [dbo].[TaskTypes] (
    [id]      INT              IDENTITY (1, 1) NOT NULL,
    [gid]     UNIQUEIDENTIFIER NOT NULL,
    [Name]    NVARCHAR (50)    NOT NULL,
    [Caption] NVARCHAR (256)   NULL,
    CONSTRAINT [PK_TaskTypes] PRIMARY KEY CLUSTERED ([gid] ASC)
);



