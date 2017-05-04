CREATE TABLE [dbo].[PupilsToTeachersRequests] (
    [id]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [gid]        UNIQUEIDENTIFIER NOT NULL,
    [PupilGID]  UNIQUEIDENTIFIER NOT NULL,
    [TeacherGID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_PupilsToTeachersRequests] PRIMARY KEY CLUSTERED ([gid] ASC)
);



