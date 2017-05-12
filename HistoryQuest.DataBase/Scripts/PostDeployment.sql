﻿/*
Этот скрипт создан Visual Studio на 12.05.2017 в 13:01.
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
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Quests]
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_Users]
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_CheckPoints]
ALTER TABLE [dbo].[TasksToTries] DROP CONSTRAINT [FK_TasksToTries_CheckpointsToTries]
ALTER TABLE [dbo].[TasksToTries] DROP CONSTRAINT [FK_TasksToTries_Tasks]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_CheckPoints]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_TaskTypes]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Users]
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Roles]
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Users]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Users]
ALTER TABLE [dbo].[Tries] DROP CONSTRAINT [FK_Tries_Quests]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces1]
ALTER TABLE [dbo].[CheckPointsToTries] DROP CONSTRAINT [FK_CheckpointsToTries_Checkpoints]
ALTER TABLE [dbo].[CheckPointsToTries] DROP CONSTRAINT [FK_CheckpointsToTries_Tries]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_CheckPoints]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Users]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Quests]
ALTER TABLE [dbo].[Quests] DROP CONSTRAINT [FK_Quests_Users]
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Faces]
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [SocialName]) VALUES (N'0ef2428a-c961-4526-8a27-69f415c0a255', 2, N'admin', N'1', 0, N'', N'9fa5ea05-86b2-4ce6-9a06-8e3c7b7770b9', NULL)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [SocialName]) VALUES (N'4a5356d4-bb91-4210-9d70-9d1d2c79ebd0', 4, N'Vacya', N'1', 0, N'', N'b7220821-02f7-4915-bed2-c3fb2150cb50', NULL)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [SocialName]) VALUES (N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', 3, N'Ivanov', N'1', 0, N'', N'9a18946e-bc60-41f3-b2a0-c8a1ff5cd058', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Quests] ON
INSERT INTO [dbo].[Quests] ([gid], [id], [Name], [FullInfo], [ShortInfo], [AuthorGID]) VALUES (N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', 2, N'Петро Сагайдачний', N'quest1.html', N'', NULL)
SET IDENTITY_INSERT [dbo].[Quests] OFF
SET IDENTITY_INSERT [dbo].[CheckPoints] ON
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'9175a546-da56-4797-b462-e12c785b3a36', 9, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва за Перекоп і Очаків', N'49;32', N'cp3.html', 6, NULL, 3, 0, N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', 8, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Похід на Варну', N'48;33', N'cp2.html', 6, NULL, 2, 0, N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', 10, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва за Кілію, Білгород, Ізмаїл', N'49.5;31', N'cp4.html', 5, NULL, 1, 0, N'9175a546-da56-4797-b462-e12c785b3a36', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', 7, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Польсько-шведська війна', N'47.5;35', N'cp1.html', 7, NULL, 1, 0, NULL, NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', 11, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва за Трапезунд, Синоп', N'49.2;29', N'cp5.html', 7, NULL, 2, 0, N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', NULL)
SET IDENTITY_INSERT [dbo].[CheckPoints] OFF
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
SET IDENTITY_INSERT [dbo].[UsersInRoles] ON
INSERT INTO [dbo].[UsersInRoles] ([gid], [id], [UserGID], [RoleGID]) VALUES (N'49b5c4fd-aa11-4659-81fc-1b9c9cbabda4', 3, N'0ef2428a-c961-4526-8a27-69f415c0a255', N'40f816d3-3bb4-4864-97c1-67803413389a')
INSERT INTO [dbo].[UsersInRoles] ([gid], [id], [UserGID], [RoleGID]) VALUES (N'754da83a-10c9-4991-b633-a7ffa8e94fa5', 2, N'4a5356d4-bb91-4210-9d70-9d1d2c79ebd0', N'024900db-2a68-4959-a0e9-10069608d923')
INSERT INTO [dbo].[UsersInRoles] ([gid], [id], [UserGID], [RoleGID]) VALUES (N'81b22d1d-0f17-4214-aa98-4071bc4ea824', 1, N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', N'4492ed1d-052a-491a-8897-9bbc8d8633ff')
SET IDENTITY_INSERT [dbo].[UsersInRoles] OFF
SET IDENTITY_INSERT [dbo].[TaskTypes] ON
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'09daff50-996e-4077-9be0-3c0bf516e56c', 3, N'Map')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', 2, N'Test')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9044bc32-30a7-49a5-8dc2-ba24bece5e39', 4, N'TestWithImage')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'979f14eb-265c-4080-a375-9c10cd49b544', 5, N'Writing')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', 1, N'Conformity')
SET IDENTITY_INSERT [dbo].[TaskTypes] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'0fb37468-19de-41d7-8bc1-2112fa7e4ec5', 26, N'Який гетьман очолював похід на Варну?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="vригор?й ?запович"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'117582c1-3063-4bc1-89fe-52144ca44db2', 17, N'За яку територію боролися Річ Посполита та Швеція у 1600-1602рр?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Україна"/><answer text="Балтійське узбережжя (Естонія)"/><answer text="Литовське князівство"/><answer text="Московське царство"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'13c1af27-3418-402d-bb90-755e4d4eecf3', 40, N'Вкажіть на мапі місто, що серед захоплення мало найбільше стратегічне значення.', 0, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><rightanswer value="(45.3505316, 28.7751867)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'149ea6e3-a5eb-4e26-9eb6-3ef47594e978', 32, N'Вкажіть на мапі місто Очаків, захоплене та спустошене внаслідок походу.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><rightanswer value="(46.6197992, 31.5186809)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'178dd8be-9699-4f15-b2d7-5563b0ca3655', 36, N'Вкажіть основну морську одиницю козацької армії.', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="Чайка"/><answer text="Тетерів"/><answer text="Трирема"/><answer text="Галера"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'2715928c-7c22-4061-8d11-b129376e0734', 31, N'Скільки ворожих кораблів було розігнано козаками під Очаковом?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="8"/><answer text="10"/><answer text="12"/><answer text="16"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'296666c7-8182-45fa-8b82-58e473861cdc', 28, N'У яку пору року відбувся похід?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="Зима"/><answer text="Весна"/><answer text="Літо"/><answer text="Осінь"/></answers><rightanswer value="2"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'3406798e-abb7-41c1-818f-4024e59a8bfc', 45, N'Чому султан наказв стратити візира Гемюльлжюнелі Насух-пашу?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="Він був братом Сагайдачного"/><answer text="Він зрадив султана"/><answer text="Він залицявся до дружини султана"/><answer text="Він намагався переконати султана, що османці пермогли"/></answers><rightanswer value="3"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'3bcbc1d8-f742-41af-84ab-795e84863bef', 25, N'Біля якого острова турки перегородили Дніпро залізним ланцюгом після взяття козаками Варни?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="Тавань"/><answer text="Зміїний"/><answer text="Хортиця"/><answer text="Джарилгач"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'46d085cb-3e67-494f-88db-1fdd7f536feb', 41, N'Шлях на яке місто відкривав Ізмаїл?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><answers><answer text="Добруджа"/><answer text="Київ"/><answer text="Варна"/><answer text="Хотин"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'4d268329-4298-4dcd-9686-ceb113efc7cd', 21, N'Встановіть відповідність між полководцями та їх арміями', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><questions><question code="1" text="Швеція"/><question code="2" text="Річ Посполита"/><question code="3" text="Козацьке військо 1601р."/><question code="4" text="Козацьке військо 1602р."/></questions><answers><answer code="А" text="Самійло Кішка"/><answer code="Б" text="Герцог Нассауський"/><answer code="В" text="Гаврило Крутневич"/><answer code="Г" text="Петро Конашевич-Сагайдачний"/><answer code="Д" text="Ян Замойський"/></answers><rightanswers><rightanswer value="1-Б"/><rightanswer value="2-Д"/><rightanswer value="3-А"/><rightanswer value="4-В"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'52ef3f31-560d-4049-bd5a-930807be7ff0', 44, N'На яку суму завдали збитки козаки Османській імперії нападами на Синоп та Трапезунд?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="40 млн. доларів"/><answer text="40 млн. злотих"/><answer text="5 млн. злотих"/><answer text="100 тис. злотих"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'56e5ebe6-0144-4e28-9242-2b1b94c900da', 29, N'Вкажіть на мапі місто, яке було захоплене та спустошене у результаті нападу на Варну.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><rightanswer value="(43.2047556, 27.8028249)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'5fd94116-42bf-47ae-ac2e-3a2441f10628', 18, N'Який гетьман стояв на чолі козацького війська на початку 1601р.?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Самійло Кішка"/><answer text="Богдан Хмельницький"/><answer text="Петро Конашевич-Сагайдачний"/><answer text="Гаврило Крутневич"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'616d5e95-df79-49a3-b2c6-86e8897f4cab', 42, N'Яку чисельність мало козацьке військо під час нападу на Синоп?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="2 000"/><answer text="500"/><answer text="10 000"/><answer text="200"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'6f7d8431-9496-417b-b4ed-d37eae13b5fd', 39, N'У гирло якої річки були спущені човни Сагайдачного?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="?унай"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'7c5e5972-10f4-414a-9049-30a7b59ad6a7', 19, N'Який гетьман стояв на чолі козацького війська на початку 1602р.?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Самійло Кішка"/><answer text="Богдан Хмельницький"/><answer text="Петро Конашевич-Сагайдачний"/><answer text="Гаврило Крутневич"/></answers><rightanswer value="3"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'80287af1-17b8-4b2d-b230-2b38491e169e', 38, N'Якою була доля фортеці Ізмаїл?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><answers><answer text="Знищена"/><answer text="Продана Римській імперії"/><answer text="Розібране на каміння з якого потім було поставлено пам’ятник Сагайдачному"/><answer text="Передане Польщі"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'832bc78a-9c52-4c4f-a1fc-e425550b4966', 43, N'Хто допомагав козакам при нападі на Трапезунд?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="Колишні полонені"/><answer text="Поляки"/><answer text="Кримські татари"/><answer text="Ніхто"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'865ee0b5-3eba-4e8b-9e76-bc613bb22dfa', 20, N'На боці якої країни виступали козаки?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Річ Посполита"/><answer text="Швеція"/><answer text="Естонія"/><answer text="Захищали свої території"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'8ab0adee-13fd-4efd-af3c-92b70ec692a0', 37, N'Скільки човнів-чайок було у підпорядкування Сагайдачного?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><answers><answer text="10"/><answer text="12"/><answer text="16"/><answer text="19"/></answers><rightanswer value="2"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'9f8fd7cb-8acb-426c-9afa-184029b987fd', 27, N'Скільки золотих становила здобич козаків у битві за Варну?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="1 000"/><answer text="180 000"/><answer text="500 000"/><answer text="80 000"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'b6b15e41-37a8-480b-a6dd-cfff3ef0042d', 24, N'Кому належали фортеці, які штурмували козаки під час морських походів?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="Річ Посполита"/><answer text="Османська імперія"/><answer text="Кримське ханство"/><answer text="Московія"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'bf0d04d6-59fb-429c-8630-0d0299cb6d40', 22, N'Вкажіть на мапі місце, де козаки приєдналися до польської армії.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><rightanswer value="(57.4729414, 25.3146046 )" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'c20f5130-d6da-4924-b31c-4922d430cfd0', 35, N'Що не було одним з основних завдань Сагайдачного у ході кампанії?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="Послаблення економічно-матеріальної бази"/><answer text="Зруйнування найважливіших портів"/><answer text="Знищення ворожого флоту"/><answer text="Поповнення рядів козацької армії"/></answers><rightanswer value="3"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'c8df90cf-e15f-41f4-9dcf-e262382c3fdf', 47, N'Вказати на мапі місто в якому знаходилася найбільша в Малій Азії верф', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><rightanswer value="(42.0141302, 35.0948861)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'ccddb3df-f2cf-4127-b4c4-b9729748b7cd', 34, N'Установіть відповідність між подіями та коли вони відбулися.', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><questions><question code="1" text="Битва Турецького флоту у Чорному морі з козаками"/><question code="2" text="Здобуття Перекопу"/><question code="3" text="Розграблення Очакова"/><question code="4" text="Захоплення Варни"/></questions><answers><answer code="А" text="жовтень 1607"/><answer code="Б" text="березень 1607"/><answer code="В" text="1607"/><answer code="Г" text="1606"/><answer code="Д" text="1609"/></answers><rightanswers><rightanswer value="1-Б"/><rightanswer value="2-А"/><rightanswer value="3-В"/><rightanswer value="4-Г"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'cdd81a51-ba22-4f6d-baff-b433e42474ee', 33, N'Вкажіть на мапі місто Перекоп, захоплене та спустошене внаслідок походу.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><rightanswer value="(46.1612592, 33.6884603)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'e889da3f-f7fa-4da0-b56f-b0873647a4dd', 46, N'І''мя султана, який правив османською імперією під час нападів на Синоп та Трапезунд.', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="Ахмед"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'f92c1c84-ec42-42f6-9a06-d7193dbebf37', 23, N'Яку назву мала кампанія в рамках польсько-шведської війни, у якій брали участь козаки у 1600-1602рр.?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="Лівонська"/><rightanswer text="Лівонська кампанія"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'ffd69629-5013-44bb-83da-974ad632b16a', 30, N'Частиною кампанії проти якої держави були захоплення Очакова та Перекопа?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="Султанська Туреччина"/><answer text="Московське царство"/><answer text="Литовське князівство"/><answer text="Фашистська Німеччина"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[Likes] ON
INSERT INTO [dbo].[Likes] ([gid], [id], [UserGID], [CheckPointGID]) VALUES (N'3241a1e0-c922-47b1-9a66-2b1194f15027', 4, N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df')
SET IDENTITY_INSERT [dbo].[Likes] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'024900db-2a68-4959-a0e9-10069608d923', 1, N'Student')
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'40f816d3-3bb4-4864-97c1-67803413389a', 3, N'Admin')
INSERT INTO [dbo].[Roles] ([gid], [id], [Name]) VALUES (N'4492ed1d-052a-491a-8897-9bbc8d8633ff', 2, N'Teacher')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Errors] ON
INSERT INTO [dbo].[Errors] ([id], [ErrorText], [InnerErrorText], [DateTime]) VALUES (1, N'Выдано исключение типа "System.Web.HttpUnhandledException".', N'Недопустимый знак для указанной кодировки., строка 3, позиция 25.', '20170512 10:53:22.367')
INSERT INTO [dbo].[Errors] ([id], [ErrorText], [InnerErrorText], [DateTime]) VALUES (2, N'Выдано исключение типа "System.Web.HttpUnhandledException".', N'Недопустимый знак для указанной кодировки., строка 4, позиция 25.', '20170512 10:54:02.850')
SET IDENTITY_INSERT [dbo].[Errors] OFF
ALTER TABLE [dbo].[Comments]
    ADD CONSTRAINT [FK_Comments_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Likes]
    ADD CONSTRAINT [FK_Likes_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[TasksToTries]
    ADD CONSTRAINT [FK_TasksToTries_CheckpointsToTries] FOREIGN KEY ([CheckPointToTryGID]) REFERENCES [dbo].[CheckPointsToTries] ([gid])
ALTER TABLE [dbo].[TasksToTries]
    ADD CONSTRAINT [FK_TasksToTries_Tasks] FOREIGN KEY ([TaskGID]) REFERENCES [dbo].[Tasks] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([TaskTypeGID]) REFERENCES [dbo].[TaskTypes] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[UsersInRoles]
    ADD CONSTRAINT [FK_UsersInRoles_Roles] FOREIGN KEY ([RoleGID]) REFERENCES [dbo].[Roles] ([gid])
ALTER TABLE [dbo].[UsersInRoles]
    ADD CONSTRAINT [FK_UsersInRoles_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Users] FOREIGN KEY ([UserGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Tries]
    ADD CONSTRAINT [FK_Tries_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[PupilsToTeachersRequests]
    ADD CONSTRAINT [FK_PupilsToTeachersRequests_Faces] FOREIGN KEY ([TeacherGID]) REFERENCES [dbo].[Faces] ([gid])
ALTER TABLE [dbo].[PupilsToTeachersRequests]
    ADD CONSTRAINT [FK_PupilsToTeachersRequests_Faces1] FOREIGN KEY ([PupilGID]) REFERENCES [dbo].[Faces] ([gid])
ALTER TABLE [dbo].[CheckPointsToTries]
    ADD CONSTRAINT [FK_CheckpointsToTries_Checkpoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPointsToTries]
    ADD CONSTRAINT [FK_CheckpointsToTries_Tries] FOREIGN KEY ([TryGID]) REFERENCES [dbo].[Tries] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_CheckPoints] FOREIGN KEY ([ParentGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[Quests]
    ADD CONSTRAINT [FK_Quests_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [FK_Users_Faces] FOREIGN KEY ([FaceGID]) REFERENCES [dbo].[Faces] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE
COMMIT TRANSACTION
