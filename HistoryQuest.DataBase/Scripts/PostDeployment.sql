/*
This script was created by Visual Studio on 11.05.2017 at 0:21.
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
ALTER TABLE [dbo].[CheckPointsToTries] DROP CONSTRAINT [FK_CheckpointsToTries_Checkpoints]
ALTER TABLE [dbo].[CheckPointsToTries] DROP CONSTRAINT [FK_CheckpointsToTries_Tries]
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Quests]
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Roles]
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Users]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces1]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Quests]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Users]
ALTER TABLE [dbo].[TasksToTries] DROP CONSTRAINT [FK_TasksToTries_CheckpointsToTries]
ALTER TABLE [dbo].[TasksToTries] DROP CONSTRAINT [FK_TasksToTries_Tasks]
ALTER TABLE [dbo].[Quests] DROP CONSTRAINT [FK_Quests_Users]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_CheckPoints]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_TaskTypes]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Users]
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_CheckPoints]
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_Users]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_CheckPoints]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Quests]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Users]
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Faces]
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [IsSocial]) VALUES (N'0ef2428a-c961-4526-8a27-69f415c0a255', 2, N'admin', N'1', 0, N'', N'9fa5ea05-86b2-4ce6-9a06-8e3c7b7770b9', 0)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [IsSocial]) VALUES (N'4a5356d4-bb91-4210-9d70-9d1d2c79ebd0', 4, N'Vacya', N'1', 0, N'', N'b7220821-02f7-4915-bed2-c3fb2150cb50', 0)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [IsSocial]) VALUES (N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', 3, N'Ivanov', N'1', 0, N'', N'9a18946e-bc60-41f3-b2a0-c8a1ff5cd058', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[CheckPoints] ON
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'9175a546-da56-4797-b462-e12c785b3a36', 9, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Third CP', N'49;32', N'cp3.html', 3, NULL, 3, 0, N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', 8, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Second CP', N'48;33', N'cp2.html', 3, NULL, 2, 0, N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', 10, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Fourth CP', N'49.5;31', N'cp4.html', 4, NULL, 1, 0, N'9175a546-da56-4797-b462-e12c785b3a36', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', 7, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'First CP', N'47.5;35', N'cp1.html', 5, NULL, 1, 0, NULL, NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', 11, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Fifth CP', N'49.2;29', N'cp5.html', 5, NULL, 2, 0, N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', NULL)
SET IDENTITY_INSERT [dbo].[CheckPoints] OFF
UPDATE [dbo].[CheckPoints] SET [Name]=N'Битва за Перекоп і Очаків', [TasksCount]=6 WHERE [gid]=N'9175a546-da56-4797-b462-e12c785b3a36'
UPDATE [dbo].[CheckPoints] SET [Name]=N'Похід на Варну', [TasksCount]=6 WHERE [gid]=N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e'
UPDATE [dbo].[CheckPoints] SET [Name]=N'Битва за Кілію, Білгород, Ізмаїл', [TasksCount]=5 WHERE [gid]=N'c720adfa-85ad-4dcb-a50f-c7f9189003fc'
UPDATE [dbo].[CheckPoints] SET [Name]=N'Польсько-шведська війна', [TasksCount]=7 WHERE [gid]=N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df'
UPDATE [dbo].[CheckPoints] SET [Name]=N'Битва за Трапезунд, Синоп', [TasksCount]=7 WHERE [gid]=N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681'
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
SET IDENTITY_INSERT [dbo].[Likes] ON
INSERT INTO [dbo].[Likes] ([gid], [id], [UserGID], [CheckPointGID]) VALUES (N'3241a1e0-c922-47b1-9a66-2b1194f15027', 4, N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df')
SET IDENTITY_INSERT [dbo].[Likes] OFF
SET IDENTITY_INSERT [dbo].[TaskTypes] ON
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'09daff50-996e-4077-9be0-3c0bf516e56c', 3, N'Map')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', 2, N'Test')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9044bc32-30a7-49a5-8dc2-ba24bece5e39', 4, N'TestWithImage')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'979f14eb-265c-4080-a375-9c10cd49b544', 5, N'Writing')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', 1, N'Conformity')
SET IDENTITY_INSERT [dbo].[TaskTypes] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'0fb37468-19de-41d7-8bc1-2112fa7e4ec5', 26, N'Який гетьман очолював похід на Варну?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', N'/Content/Tasks/Quest_1/CheckPoint_2/task3.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'117582c1-3063-4bc1-89fe-52144ca44db2', 17, N'За яку територію боролися Річ Посполита та Швеція у 1600-1602рр?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/Quest_1/CheckPoint_1/task1.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'13c1af27-3418-402d-bb90-755e4d4eecf3', 40, N'Вкажіть на мапі місто, що серед захоплення мало найбільше стратегічне значення.', 0, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', N'/Content/Tasks/Quest_1/CheckPoint_4/task4.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'149ea6e3-a5eb-4e26-9eb6-3ef47594e978', 32, N'Вкажіть на мапі місто Очаків, захоплене та спустошене внаслідок походу.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'9175a546-da56-4797-b462-e12c785b3a36', N'/Content/Tasks/Quest_1/CheckPoint_3/task3.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'178dd8be-9699-4f15-b2d7-5563b0ca3655', 36, N'Вкажіть основну морську одиницю козацької армії.', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'/Content/Tasks/Quest_1/CheckPoint_3/task7.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'2715928c-7c22-4061-8d11-b129376e0734', 31, N'Скільки ворожих кораблів було розігнано козаками під Очаковом?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'/Content/Tasks/Quest_1/CheckPoint_3/task2.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'296666c7-8182-45fa-8b82-58e473861cdc', 28, N'У яку пору року відбувся похід?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', N'/Content/Tasks/Quest_1/CheckPoint_2/task5.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'3406798e-abb7-41c1-818f-4024e59a8bfc', 45, N'Чому султан наказв стратити візира Гемюльлжюнелі Насух-пашу?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', N'/Content/Tasks/Quest_1/CheckPoint_5/task4.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'3bcbc1d8-f742-41af-84ab-795e84863bef', 25, N'Біля якого острова турки перегородили Дніпро залізним ланцюгом після взяття козаками Варни?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', N'/Content/Tasks/Quest_1/CheckPoint_2/task2.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'46d085cb-3e67-494f-88db-1fdd7f536feb', 41, N'Шлях на яке місто відкривав Ізмаїл?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', N'/Content/Tasks/Quest_1/CheckPoint_4/task5.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'4d268329-4298-4dcd-9686-ceb113efc7cd', 21, N'Встановіть відповідність між полководцями та їх арміями', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/Quest_1/CheckPoint_1/task5.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'52ef3f31-560d-4049-bd5a-930807be7ff0', 44, N'На яку суму завдали збитки козаки Османській імперії нападами на Синоп та Трапезунд?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', N'/Content/Tasks/Quest_1/CheckPoint_5/task3.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'56e5ebe6-0144-4e28-9242-2b1b94c900da', 29, N'Вкажіть на мапі місто, яке було захоплене та спустошене у результаті нападу на Варну.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', N'/Content/Tasks/Quest_1/CheckPoint_2/task6.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'5fd94116-42bf-47ae-ac2e-3a2441f10628', 18, N'Який гетьман стояв на чолі козацького війська на початку 1601р.?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/Quest_1/CheckPoint_1/task2.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'616d5e95-df79-49a3-b2c6-86e8897f4cab', 42, N'Яку чисельність мало козацьке військо під час нападу на Синоп?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', N'/Content/Tasks/Quest_1/CheckPoint_5/task1.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'6f7d8431-9496-417b-b4ed-d37eae13b5fd', 39, N'У гирло якої річки були спущені човни Сагайдачного?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', N'/Content/Tasks/Quest_1/CheckPoint_4/task3.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'7c5e5972-10f4-414a-9049-30a7b59ad6a7', 19, N'Який гетьман стояв на чолі козацького війська на початку 1602р.?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/Quest_1/CheckPoint_1/task3.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'80287af1-17b8-4b2d-b230-2b38491e169e', 38, N'Якою була доля фортеці Ізмаїл?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', N'/Content/Tasks/Quest_1/CheckPoint_4/task2.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'832bc78a-9c52-4c4f-a1fc-e425550b4966', 43, N'Хто допомагав козакам при нападі на Трапезунд?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', N'/Content/Tasks/Quest_1/CheckPoint_5/task2.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'865ee0b5-3eba-4e8b-9e76-bc613bb22dfa', 20, N'На боці якої країни виступали козаки?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/Quest_1/CheckPoint_1/task4.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'8ab0adee-13fd-4efd-af3c-92b70ec692a0', 37, N'Скільки човнів-чайок було у підпорядкування Сагайдачного?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', N'/Content/Tasks/Quest_1/CheckPoint_4/task1.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'9f8fd7cb-8acb-426c-9afa-184029b987fd', 27, N'Скільки золотих становила здобич козаків у битві за Варну?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', N'/Content/Tasks/Quest_1/CheckPoint_2/task4.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'b6b15e41-37a8-480b-a6dd-cfff3ef0042d', 24, N'Кому належали фортеці, які штурмували козаки під час морських походів?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', N'/Content/Tasks/Quest_1/CheckPoint_2/task1.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'bf0d04d6-59fb-429c-8630-0d0299cb6d40', 22, N'Вкажіть на мапі місце, де козаки приєдналися до польської армії.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/Quest_1/CheckPoint_1/task6.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'c20f5130-d6da-4924-b31c-4922d430cfd0', 35, N'Що не було одним з основних завдань Сагайдачного у ході кампанії?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'/Content/Tasks/Quest_1/CheckPoint_3/task6.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'c8df90cf-e15f-41f4-9dcf-e262382c3fdf', 47, N'Вказати на мапі місто в якому знаходилася найбільша в Малій Азії верф', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', N'/Content/Tasks/Quest_1/CheckPoint_5/task6.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'ccddb3df-f2cf-4127-b4c4-b9729748b7cd', 34, N'Установіть відповідність між подіями та коли вони відбулися.', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'9175a546-da56-4797-b462-e12c785b3a36', N'/Content/Tasks/Quest_1/CheckPoint_3/task5.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'cdd81a51-ba22-4f6d-baff-b433e42474ee', 33, N'Вкажіть на мапі місто Перекоп, захоплене та спустошене внаслідок походу.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'9175a546-da56-4797-b462-e12c785b3a36', N'/Content/Tasks/Quest_1/CheckPoint_3/task4.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'e889da3f-f7fa-4da0-b56f-b0873647a4dd', 46, N'І''мя султана, який правив османською імперією під час нападів на Синоп та Трапезунд.', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', N'/Content/Tasks/Quest_1/CheckPoint_5/task5.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'f92c1c84-ec42-42f6-9a06-d7193dbebf37', 23, N'Яку назву мала кампанія в рамках польсько-шведської війни, у якій брали участь козаки у 1600-1602рр.?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', N'/Content/Tasks/Quest_1/CheckPoint_1/task7.xml', NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFilePath], [AuthorGID]) VALUES (N'ffd69629-5013-44bb-83da-974ad632b16a', 30, N'Частиною кампанії проти якої держави були захоплення Очакова та Перекопа?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', N'/Content/Tasks/Quest_1/CheckPoint_3/task1.xml', NULL)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[Quests] ON
INSERT INTO [dbo].[Quests] ([gid], [id], [Name], [FullInfo], [ShortInfo], [AuthorGID]) VALUES (N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', 2, N'Петро Сагайдачний', N'quest1.html', N'', NULL)
SET IDENTITY_INSERT [dbo].[Quests] OFF
SET IDENTITY_INSERT [dbo].[Tries] ON
INSERT INTO [dbo].[Tries] ([gid], [id], [QuestGID], [UserGID], [IsSuccessful]) VALUES (N'bf12258d-6046-44f5-b802-0dbf3960a9f9', 3, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'0ef2428a-c961-4526-8a27-69f415c0a255', NULL)
INSERT INTO [dbo].[Tries] ([gid], [id], [QuestGID], [UserGID], [IsSuccessful]) VALUES (N'f4ab6e3b-37c7-4842-b610-201c51dad60d', 4, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', NULL)
SET IDENTITY_INSERT [dbo].[Tries] OFF
SET IDENTITY_INSERT [dbo].[UsersInRoles] ON
INSERT INTO [dbo].[UsersInRoles] ([gid], [id], [UserGID], [RoleGID]) VALUES (N'49b5c4fd-aa11-4659-81fc-1b9c9cbabda4', 3, N'0ef2428a-c961-4526-8a27-69f415c0a255', N'40f816d3-3bb4-4864-97c1-67803413389a')
INSERT INTO [dbo].[UsersInRoles] ([gid], [id], [UserGID], [RoleGID]) VALUES (N'754da83a-10c9-4991-b633-a7ffa8e94fa5', 2, N'4a5356d4-bb91-4210-9d70-9d1d2c79ebd0', N'024900db-2a68-4959-a0e9-10069608d923')
INSERT INTO [dbo].[UsersInRoles] ([gid], [id], [UserGID], [RoleGID]) VALUES (N'81b22d1d-0f17-4214-aa98-4071bc4ea824', 1, N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', N'4492ed1d-052a-491a-8897-9bbc8d8633ff')
SET IDENTITY_INSERT [dbo].[UsersInRoles] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'024900db-2a68-4959-a0e9-10069608d923', 1, N'Student')
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'40f816d3-3bb4-4864-97c1-67803413389a', 3, N'Admin')
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'4492ed1d-052a-491a-8897-9bbc8d8633ff', 2, N'Teacher')
SET IDENTITY_INSERT [dbo].[Roles] OFF
ALTER TABLE [dbo].[CheckPointsToTries]
    ADD CONSTRAINT [FK_CheckpointsToTries_Checkpoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPointsToTries]
    ADD CONSTRAINT [FK_CheckpointsToTries_Tries] FOREIGN KEY ([TryGID]) REFERENCES [dbo].[Tries] ([gid])
ALTER TABLE [dbo].[Comments]
    ADD CONSTRAINT [FK_Comments_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[UsersInRoles]
    ADD CONSTRAINT [FK_UsersInRoles_Roles] FOREIGN KEY ([RoleGID]) REFERENCES [dbo].[Roles] ([gid])
ALTER TABLE [dbo].[UsersInRoles]
    ADD CONSTRAINT [FK_UsersInRoles_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [dbo].[PupilsToTeachersRequests]
    ADD CONSTRAINT [FK_PupilsToTeachersRequests_Faces] FOREIGN KEY ([TeacherGID]) REFERENCES [dbo].[Faces] ([gid])
ALTER TABLE [dbo].[PupilsToTeachersRequests]
    ADD CONSTRAINT [FK_PupilsToTeachersRequests_Faces1] FOREIGN KEY ([PupilGID]) REFERENCES [dbo].[Faces] ([gid])
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[TasksToTries]
    ADD CONSTRAINT [FK_TasksToTries_CheckpointsToTries] FOREIGN KEY ([CheckPointToTryGID]) REFERENCES [dbo].[CheckPointsToTries] ([gid])
ALTER TABLE [dbo].[TasksToTries]
    ADD CONSTRAINT [FK_TasksToTries_Tasks] FOREIGN KEY ([TaskGID]) REFERENCES [dbo].[Tasks] ([gid])
ALTER TABLE [dbo].[Quests]
    ADD CONSTRAINT [FK_Quests_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([TaskTypeGID]) REFERENCES [dbo].[TaskTypes] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_CheckPoints] FOREIGN KEY ([ParentGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [FK_Users_Faces] FOREIGN KEY ([FaceGID]) REFERENCES [dbo].[Faces] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE
COMMIT TRANSACTION
