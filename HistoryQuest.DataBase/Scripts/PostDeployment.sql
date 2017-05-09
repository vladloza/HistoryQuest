/*
Этот скрипт создан Visual Studio на 09.05.2017 в 15:15.
Выполните этот скрипт на SERGEY-PC\SQLEXPRESS.HistoryQuest.DataBase.Empty (SERGEY-PC\SERGEY), чтобы сделать этот объект таким же, как SERGEY-PC\SQLEXPRESS.HistoryQuest.DataBase (SERGEY-PC\SERGEY).
Этот скрипт выполняет свои действия в следующем порядке.
1. Отключение ограничений внешнего ключа.
2. Выполнение команд DELETE. 
3. Выполнение команд UPDATE.
4. Выполнение команд INSERT.
5. Повторное включение ограничений внешнего ключа.
Создайте резервную копию своей базы данных-получателя перед выполнением этого скрипта.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Для обновления текста/изображения использовался указатель. Это может не потребоваться, но на всякий случай это указано здесь.*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_Users]
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_CheckPoints]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_CheckPoints]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_TaskTypes]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Users]
ALTER TABLE [dbo].[TasksToTries] DROP CONSTRAINT [FK_TasksToTries_CheckpointsToTries]
ALTER TABLE [dbo].[TasksToTries] DROP CONSTRAINT [FK_TasksToTries_Tasks]
ALTER TABLE [dbo].[CheckPointsToTries] DROP CONSTRAINT [FK_CheckpointsToTries_Checkpoints]
ALTER TABLE [dbo].[CheckPointsToTries] DROP CONSTRAINT [FK_CheckpointsToTries_Tries]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Quests]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Users]
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Quests]
ALTER TABLE [dbo].[Quests] DROP CONSTRAINT [FK_Quests_Users]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_CheckPoints]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Quests]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Users]
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Faces]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces1]
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Roles]
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Users]
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
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'9fa5ea05-86b2-4ce6-9a06-8e3c7b7770b9', 100, N'Admin', N'Admin', N'Admin', NULL, NULL, 0)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'b7220821-02f7-4915-bed2-c3fb2150cb50', 912, N'Pupkin', N'Vacya', N'Ivanovich', N'9a18946e-bc60-41f3-b2a0-c8a1ff5cd058', NULL, 0)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'bf675ccc-eca2-4d92-84c0-75a5334bdefc', 103, N'Порев', N'Генадий', N'Владимирович', NULL, NULL, 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'c604631f-340a-4b93-9442-5fe18efe261e', 666, N'Зинченко', N'Артём', N'Юриевич', NULL, N'-_-', 1)
INSERT INTO [dbo].[Faces] ([gid], [id], [LastName], [FirstName], [MiddleName], [TeacherGID], [Info], [IsTeacher]) VALUES (N'f7f34923-e4df-48a6-ad8d-414588f64304', 104, N'Поперешняк', N'Светлана', N'Владимировна', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Faces] OFF
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [IsSocial]) VALUES (N'0ef2428a-c961-4526-8a27-69f415c0a255', 2, N'admin', N'1', 0, N'', N'9fa5ea05-86b2-4ce6-9a06-8e3c7b7770b9', 0)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [IsSocial]) VALUES (N'4a5356d4-bb91-4210-9d70-9d1d2c79ebd0', 4, N'Vacya', N'1', 0, N'', N'b7220821-02f7-4915-bed2-c3fb2150cb50', 0)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [IsSocial]) VALUES (N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', 3, N'Ivanov', N'1', 0, N'', N'9a18946e-bc60-41f3-b2a0-c8a1ff5cd058', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[CheckPoints] ON
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [InfoFilePath], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'9175a546-da56-4797-b462-e12c785b3a36', 9, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Third CP', N'49;32', N'cp3.html', 3, NULL, 3, 0, N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [InfoFilePath], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', 8, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Second CP', N'48;33', N'cp2.html', 3, NULL, 2, 0, N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [InfoFilePath], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', 10, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Fourth CP', N'49.5;31', N'cp4.html', 4, NULL, 1, 0, N'9175a546-da56-4797-b462-e12c785b3a36', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [InfoFilePath], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', 7, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'First CP', N'47.5;35', N'cp1.html', 5, NULL, 1, 0, NULL, NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [InfoFilePath], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', 11, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Fifth CP', N'49.2;29', N'cp5.html', 5, NULL, 2, 0, N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', NULL)
SET IDENTITY_INSERT [dbo].[CheckPoints] OFF
SET IDENTITY_INSERT [dbo].[Quests] ON
INSERT INTO [dbo].[Quests] ([gid], [id], [Name], [SourceFilePath], [AuthorGID]) VALUES (N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', 2, N'Петро Сагайдачний', N'quest1.html', NULL)
SET IDENTITY_INSERT [dbo].[Quests] OFF
SET IDENTITY_INSERT [dbo].[Tries] ON
INSERT INTO [dbo].[Tries] ([gid], [id], [QuestGID], [UserGID], [IsSuccessful]) VALUES (N'bf12258d-6046-44f5-b802-0dbf3960a9f9', 3, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'0ef2428a-c961-4526-8a27-69f415c0a255', NULL)
INSERT INTO [dbo].[Tries] ([gid], [id], [QuestGID], [UserGID], [IsSuccessful]) VALUES (N'f4ab6e3b-37c7-4842-b610-201c51dad60d', 4, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', NULL)
SET IDENTITY_INSERT [dbo].[Tries] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'09daff50-996e-4077-9be0-3c0bf516e56c', 6, N'Just do something', 10, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/task1.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'1f1fa601-b0c6-45e4-8cb3-59523f65cbb3', 9, N'Test Task 2', 10, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'taesttask2.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'3432c64d-1c4d-481e-afac-c4f1072ca699', 7, N'Very hard task', 25, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/task1.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'44cd855f-0c57-4d06-afda-e0157394e148', 14, N'На службу в роту Почетного караула набирают юношей с законченным средним образованием, высокими моральными качествами, отменным здоровьем и ростом от 182 см до 188 см. Укажите число, которое не может равняться среднему росту служащего роты Почетного караула.', 30, N'979f14eb-265c-4080-a375-9c10cd49b544', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/task3.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'5116538d-0bd4-40b9-954f-a38912f26446', 15, N'Укажите на карте место рождения Сагайдачного.', 50, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/task4.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'5699b025-2072-472b-be04-1ef1aa7ba198', 16, N'На службу в роту Почетного караула набирают юношей с законченным средним образованием, высокими моральными качествами, отменным здоровьем и ростом от 182 см до 188 см. Укажите число, которое не может равняться среднему росту служащего роты Почетного караула.', 40, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/task5.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'73c0d80e-0d02-4f9b-9f49-0399d5e23ae7', 13, N'Кто изображен на рисунке?', 10, N'9044bc32-30a7-49a5-8dc2-ba24bece5e39', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/task2.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'7ebc7f21-3d88-4b0e-84a5-f7d8842e45d0', 10, N'Test Task 3', 10, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'taesttask3.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'b724174f-d9f3-429e-adbe-e826ad032bcb', 12, N'Test Task 5', 10, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'taesttask5.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'e83b172b-1c8a-4ad2-84d9-2ba2d7e4190e', 8, N'Test Task 1', 10, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'taesttask1.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'e86622ac-2439-4848-a8c1-f3cb7277a185', 11, N'Test Task 4', 10, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'taesttask4.xml', NULL)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[TaskTypes] ON
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'09daff50-996e-4077-9be0-3c0bf516e56c', 3, N'Map')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', 2, N'Test')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9044bc32-30a7-49a5-8dc2-ba24bece5e39', 4, N'TestWithImage')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'979f14eb-265c-4080-a375-9c10cd49b544', 5, N'Writing')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', 1, N'Conformity')
SET IDENTITY_INSERT [dbo].[TaskTypes] OFF
SET IDENTITY_INSERT [dbo].[Likes] ON
INSERT INTO [dbo].[Likes] ([gid], [id], [UserGID], [CheckPointGID]) VALUES (N'3241a1e0-c922-47b1-9a66-2b1194f15027', 4, N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df')
SET IDENTITY_INSERT [dbo].[Likes] OFF
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([TaskTypeGID]) REFERENCES [dbo].[TaskTypes] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[TasksToTries]
    ADD CONSTRAINT [FK_TasksToTries_CheckpointsToTries] FOREIGN KEY ([CheckPointToTryGID]) REFERENCES [dbo].[CheckPointsToTries] ([gid])
ALTER TABLE [dbo].[TasksToTries]
    ADD CONSTRAINT [FK_TasksToTries_Tasks] FOREIGN KEY ([TaskGID]) REFERENCES [dbo].[Tasks] ([gid])
ALTER TABLE [dbo].[CheckPointsToTries]
    ADD CONSTRAINT [FK_CheckpointsToTries_Checkpoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPointsToTries]
    ADD CONSTRAINT [FK_CheckpointsToTries_Tries] FOREIGN KEY ([TryGID]) REFERENCES [dbo].[Tries] ([gid])
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Comments]
    ADD CONSTRAINT [FK_Comments_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[Quests]
    ADD CONSTRAINT [FK_Quests_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_CheckPoints] FOREIGN KEY ([ParentGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [FK_Users_Faces] FOREIGN KEY ([FaceGID]) REFERENCES [dbo].[Faces] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [dbo].[PupilsToTeachersRequests]
    ADD CONSTRAINT [FK_PupilsToTeachersRequests_Faces] FOREIGN KEY ([TeacherGID]) REFERENCES [dbo].[Faces] ([gid])
ALTER TABLE [dbo].[PupilsToTeachersRequests]
    ADD CONSTRAINT [FK_PupilsToTeachersRequests_Faces1] FOREIGN KEY ([PupilGID]) REFERENCES [dbo].[Faces] ([gid])
ALTER TABLE [dbo].[UsersInRoles]
    ADD CONSTRAINT [FK_UsersInRoles_Roles] FOREIGN KEY ([RoleGID]) REFERENCES [dbo].[Roles] ([gid])
ALTER TABLE [dbo].[UsersInRoles]
    ADD CONSTRAINT [FK_UsersInRoles_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE
COMMIT TRANSACTION
