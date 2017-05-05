CREATE TABLE [dbo].[Faces] (
    [id]         BIGINT           IDENTITY (100, 1) NOT NULL,
    [gid]        UNIQUEIDENTIFIER CONSTRAINT [DF_Faces_gid] DEFAULT (newid()) NOT NULL,
    [LastName]   NVARCHAR (50)    NOT NULL,
    [FirstName]  NVARCHAR (50)    NOT NULL,
    [MiddleName] NVARCHAR (50)    NULL,
    [TeacherGID] UNIQUEIDENTIFIER NULL,
    [Info]       NVARCHAR (500)   NULL,
    [IsTeacher]  BIT              CONSTRAINT [DF_Faces_IsTeacher] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Pupils] PRIMARY KEY CLUSTERED ([gid] ASC)
);













