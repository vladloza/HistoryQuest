/*
This script was created by Visual Studio on 29.04.2017 at 17:24.
Run this script on VLADPC\SQLEXPRESS.HistoryQuest.DataBase.Empty (VLADPC\Vlad) to make it the same as VLADPC\SQLEXPRESS.HistoryQuest.DataBase (VLADPC\Vlad).
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_Tasks]
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_Users]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_CheckPoints]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_TaskTypes]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Users]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_CheckPoints]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Users]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Quests]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Users]
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Quests]
ALTER TABLE [dbo].[Quests] DROP CONSTRAINT [FK_Quests_Users]
ALTER TABLE [dbo].[TasksToTries] DROP CONSTRAINT [FK_TasksToTries_Tries]
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'024900db-2a68-4959-a0e9-10069608d923', 1, N'Student')
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'40f816d3-3bb4-4864-97c1-67803413389a', 3, N'Admin')
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'4492ed1d-052a-491a-8897-9bbc8d8633ff', 2, N'Teacher')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Faces] ON
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'02d76f17-17ef-41be-9109-267b52912db8', 101, N'Супрун', N'Ольга', N'Николаевна', NULL, NULL, 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'12625008-8fe6-4cf4-bede-3b6007476bdf', 911, N'Бычков', N'Олексей', N'Сергеевич', NULL, NULL, 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'5b37eeeb-817c-44e9-a7d1-e98c827837b3', 112, N'Шевченко', N'Виктор', N'Леонидович', NULL, NULL, 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'9a18946e-bc60-41f3-b2a0-c8a1ff5cd058', 102, N'Иванов', N'Евгений', N'Вячеславович', NULL, NULL, 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'bf675ccc-eca2-4d92-84c0-75a5334bdefc', 103, N'Порев', N'Генадий', N'Владимирович', NULL, NULL, 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'c604631f-340a-4b93-9442-5fe18efe261e', 666, N'Зинченко', N'Артём', N'Юриевич', NULL, N'-_-', 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'f7f34923-e4df-48a6-ad8d-414588f64304', 104, N'Поперешняк', N'Светлана', N'Владимировна', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Faces] OFF
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_Tasks] FOREIGN KEY ([TaskGID]) REFERENCES [dbo].[Tasks] ([gid])
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([TaskTypeGID]) REFERENCES [dbo].[TaskTypes] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_CheckPoints] FOREIGN KEY ([ParentGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Comments]
    ADD CONSTRAINT [FK_Comments_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[Quests]
    ADD CONSTRAINT [FK_Quests_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[TasksToTries]
    ADD CONSTRAINT [FK_TasksToTries_Tries] FOREIGN KEY ([TryGID]) REFERENCES [dbo].[Tries] ([gid])
COMMIT TRANSACTION
