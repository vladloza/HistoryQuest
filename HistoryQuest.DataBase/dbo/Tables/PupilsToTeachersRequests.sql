CREATE TABLE [dbo].[PupilsToTeachersRequests] (
    [id]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]        UNIQUEIDENTIFIER NOT NULL,
    [PupilGID]   UNIQUEIDENTIFIER NOT NULL,
    [TeacherGID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_PupilsToTeachersRequests] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_PupilsToTeachersRequests_Faces] FOREIGN KEY ([TeacherGID]) REFERENCES [dbo].[Faces] ([gid]),
    CONSTRAINT [FK_PupilsToTeachersRequests_Faces1] FOREIGN KEY ([PupilGID]) REFERENCES [dbo].[Faces] ([gid])
);





