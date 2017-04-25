CREATE TABLE [dbo].[PupilsToTeachersRequests] (
    [id]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]        UNIQUEIDENTIFIER NOT NULL,
    [PupilsGID]  UNIQUEIDENTIFIER NOT NULL,
    [TeacherGID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_PupilsToTeachersRequests] PRIMARY KEY CLUSTERED ([gid] ASC),
    CONSTRAINT [FK_PupilsToTeachersRequests_Pupils] FOREIGN KEY ([PupilsGID]) REFERENCES [dbo].[Faces] ([gid]),
    CONSTRAINT [FK_PupilsToTeachersRequests_Teachers] FOREIGN KEY ([TeacherGID]) REFERENCES [dbo].[Faces] ([gid])
);

