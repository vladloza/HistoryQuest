CREATE TABLE [dbo].[Faces] (
    [id]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]        UNIQUEIDENTIFIER NOT NULL,
    [FirstName]  NVARCHAR (50)    NOT NULL,
    [LastName]   NVARCHAR (50)    NOT NULL,
    [MiddleName] NVARCHAR (50)    NOT NULL,
    [UserGID]    UNIQUEIDENTIFIER NOT NULL,
    [TeacherGID] UNIQUEIDENTIFIER NULL,
    [Info]       NVARCHAR (500)   NULL,
    [IsTeacher]  BIT              CONSTRAINT [DF_Faces_IsTeacher] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Pupils] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_Faces_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid]),
    CONSTRAINT [FK_Teachers_Pupils] FOREIGN KEY ([TeacherGID]) REFERENCES [dbo].[Faces] ([gid])
);

