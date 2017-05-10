CREATE TABLE [dbo].[TeacherRequests] (
    [id]          INT              IDENTITY (1, 1) NOT NULL,
    [gid]         UNIQUEIDENTIFIER NOT NULL,
    [FirstName]   NVARCHAR (250)   NOT NULL,
    [LastName]    NVARCHAR (250)   NOT NULL,
    [MiddleName]  NVARCHAR (250)   NOT NULL,
    [Institution] NVARCHAR (250)   NOT NULL,
    [City]        NVARCHAR (250)   NOT NULL,
    [Telephone]   NVARCHAR (250)   NULL,
    [E-Mail]      NVARCHAR (250)   NOT NULL,
    CONSTRAINT [PK_TeacherRequests] PRIMARY KEY CLUSTERED ([gid] ASC)
);

