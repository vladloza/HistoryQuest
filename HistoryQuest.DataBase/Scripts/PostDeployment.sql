/*
Этот скрипт создан Visual Studio на 13.05.2017 в 1:23.
Выполните этот скрипт на DESKTOP-RH7MHP2\SQLEXPRESS.HistoryQuest.DataBase3 (DESKTOP-RH7MHP2\Maggie), чтобы сделать этот объект таким же, как DESKTOP-RH7MHP2\SQLEXPRESS.HistoryQuest.DataBase (DESKTOP-RH7MHP2\Maggie).
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
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Roles]
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [FK_UsersInRoles_Users]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces]
ALTER TABLE [dbo].[PupilsToTeachersRequests] DROP CONSTRAINT [FK_PupilsToTeachersRequests_Faces1]
ALTER TABLE [dbo].[Quests] DROP CONSTRAINT [FK_Quests_Users]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_CheckPoints]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_TaskTypes]
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Users]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_CheckPoints]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Quests]
ALTER TABLE [dbo].[CheckPoints] DROP CONSTRAINT [FK_CheckPoints_Users]
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Faces]
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [SocialName]) VALUES (N'0ef2428a-c961-4526-8a27-69f415c0a255', 2, N'admin', N'1', 0, N'', N'9fa5ea05-86b2-4ce6-9a06-8e3c7b7770b9', NULL)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [SocialName]) VALUES (N'4a5356d4-bb91-4210-9d70-9d1d2c79ebd0', 4, N'Vacya', N'1', 0, N'', N'b7220821-02f7-4915-bed2-c3fb2150cb50', NULL)
INSERT INTO [dbo].[Users] ([gid], [id], [UserName], [Password], [PasswordFormat], [PasswordSalt], [FaceGID], [SocialName]) VALUES (N'f25bffd4-dc88-42d9-94f7-772e873cd8b5', 3, N'Ivanov', N'1', 0, N'', N'9a18946e-bc60-41f3-b2a0-c8a1ff5cd058', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[CheckPoints] ON
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', 17, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Смерть гетьмана', N'50.43; 30.43', N'10 квітня (20 квітня) 1622 року Петро Сагайдачний помер внаслідок ускладнень вогнепального поранення руки, яке отримав під час битви під Хотином. Похорони гетьмана припали на Провідну (Фомину) неділю, 28 квітня 1622 року. На велелюдному похороні зібрались його бойові побратими, мешканці Києва. Під час поховання учні Київської братської школи читали приурочені до цієї скорботної події «Вірші на жалосний погреб гетьмана Сагайдачного», в яких возвеличивулась подвиги українського полководця та його служіння християнській вірі. Петра Сагайдачного поховали у Богоявленському соборі Київського Братського монастиря, який надалі називали «монастирем Сагайдачного». Його срібний хрест знаходився на «престолі св. Йоанна Золотоустого» цього храму. У 1690—1693 роки при реконструкції Богоявленської церкви Києво-Братського монастиря могила гетьмана була перенесена під південну стіну собору. У 1935 році церкву було знищено й відомості про це поховання остаточно втрачено.', 8, NULL, 1, 0, N'fe95d70d-9cd5-4c70-997c-644d10f54e61', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', 14, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва за Кафу', N'45.04;35.37', N'Ставши гетьманом, П.Сагайдачний підготував похід до неприступної османської фортеці Кафи (сучасна Феодосія), що була головним невільничим ринком у Криму. Османи, які ще не оговтались від нещодавньої атаки козаків на міста Румелійського узбережжя, не очікували такого швидкого нападу на добре укріплену фортецю. Кафа була великим та багатим містом, населення якого налічувало від 70 до 100 тисяч мешканців. Кафська фортеця мала міцні оборонні укріплення: 13-метрові зовнішні стіни завдовжки понад 5 км. Гарнізон міста складався з 3 яничарських ортів. Комендант фортеці мав у
своєму розпорядженні близько 300 вояків, ще 200 солдатів були в підпорядкуванні капудана — командира воєнно-морських сил. У липні 1616 року гетьман разом із 6-ма тисячами козаків на 120—150 чайках вирушив у морський похід. На виході з Дніпра в Дніпровсько-Бузькому лимані козаки зустріли ескадру османських галер, яку розгромили та захопили близько половини суден. Аби ввести османів в оману щодо своїх подальших дій, П.Сагайдачний наказав частині війська демонстративно повернутись на Січ із захопленою здобиччю. Решта війська близько тижня переховувалася поблизу Очакова. Приспавши пильність ворога, козаки продовжили свій похід. 22 липня 1616 року П.Сагайдачний разом із 4000 козаків прибув до міста. Уночі козаки висадилися на берег і підійшли до воріт Кафи. Відволікши вартових, вони перебралися через мури фортеці та відкрили ворота міста. Раптовим нападом козаки захопили міську цитадель, взялися грабувати місто та звільняти християнських невільників. Аби забрати якнайбільше бранців на свої чайки, козаки викинули чималу частину захопленого добра, у такий спосіб підтвердивши свою обітницю визволяти з неволі християн, яку давали перед цим.
', 10, NULL, 1, 0, N'a72de113-2eac-4b3e-892f-069f18f29d1f', NULL)
EXEC(N'INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N''564116f3-c0e3-4d5b-8558-3461f5daff5e'', 15, N''ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf'', N''Похід 20-тисячного козацького війська Сагайдачного в Московію'', N''55.72; 37.61'', N''6 квітня 1617 року королевич Владислав вирушив із Варшави в похід до Москви з метою отримати корону московського царя. Наприкінці вересня під Смоленськом військо королевича об''''єдналось з армією Яна Ходкевича. 11 жовтня об’єднана польсько-литовська армія чисельністю близько 8 тисяч чоловік без бою здобули Дорогобуж. Незабаром, 18 жовтня, так само легко була здобута Вязьма. До кінця 1617 року польським підрозділам вдалось завоювати ще Мещовськ, Козельськ, Серпейськ, Рославль. У грудні 1617 року бойові дії припинилися, більша частина польсько-литовського війська розмістилась в таборі поблизу м. Вязьми, очікуючи на підкріплення. Проте ані вояків, ані грошей не надійшло. Тому навесні значна частина жовнірів залишила табір і чисельність армії скоротилась до п''''яти тисяч чоловік. Аби врятувати королевича Владислава і виправити ситуацію, польський уряд звернувся по допомогу до Війська Запорозького. В березні 1618 року дванадцять запорозьких сотників зустрілись із королевичем Владиславом і пообіцяли привести йому 20-тисячне військо. Підготовку до московського походу обговорювали на двох загальних радах в червні 1618 року. На цих переговорах козаки, зокрема, вимагали припинити утиски православного населення. Після переговорів українське командування під керівництвом гетьмана Петра Сагайдачного розробило план майбутнього походу. У другій половині червня 6 полків 20-тисячного козацького війська під проводом Сагайдачного вирушили до Москви. З собою запорожці взяли 17 гармат невеликого калібру, решту артилерії, аби не уповільнювати рух, залишили у Києві. Після переправи через Дніпро, військо
Сагайдачного вийшло на Муравський шлях, що вів від Криму правобережжям Дніпра у напрямку Тули. 7 липня козаки підійшли під одне з найбільш укріплених міст на півдні Московщини — Лівни. В результаті несподіваної атаки запорожці його захопили. Наприкінці липня — початку серпня П.Сагайдачний відправив полковника Михайла Дорошенка на чолі 10000-го загону у рейд по Рязанщині. Його військам вдалося захопити міста Лебедян, Скопин, Данков, Ряжськ. На початку серпня цей загін спалив будівлі Переяславля-Рязанського. При поверненні до військ Сагайдачного були захоплені Песочня, Сапожок та Шацьк. Об''''єднавши власні сили й визначивши через посланців місце зустрічі українського та військ Речі Посполитої у Тушині, український гетьман продовжив похід. Загін на чолі з полковником Милосним, у складі 1000 вершників, було направлено до добре укріпленої фортеці — Михайлова. Однак під Михайловим козаки зазнали першої невдачі. Запорожці планували в ніч з 21 на 22 серпня захопити місто, проте через погану погоду дісталися міста лише 22 серпня. За цей час до міста підійшло підкріплення, тому раптової атаки зірвався. П.Сагайдачний з головним військом прибув під фортецю 26 серпня і був змушений перейти до звичної облоги. Після двох спроб захопити місто штурмом 7 вересня Конашевич вимушений був полишити облогу, аби встигнути на зустріч із королевичем Владиславом біля Москви. Після невдалої облоги Михайлова П.Сагайдачний направив близько 2000 козаків під проводом Федора Бориспільця на близькі підступи Москви з півдня — у Мещерські краї. Одним із завдань цього маневру було відвернути увагу противника від запланованого форсування Оки на північ від Михайлова основним козацьким військом. Загони Федора Бориспільця захопили міста Касимов, Казар, Романов. Наміри П.Сагайдачного щодо Москви були дуже рішучими. Підтвердженням цього є його лист королевичу Владиславу, надісланий після 24 вересня. У листі гетьман пише: «Аби Пан Бог всемогутній у досягненні задуму цього до удостоєння призначеного вашій королевичевій милості царства щастив і благословив, а той народ впертий під ноги маєстату свого підбити сприяв». 11 жовтня військо королевича Владислава та козаки Петра Сагайдачного розпочали наступ на Москву. Штурм тривав з третьої ночі і до світанку. Нападникам вдалося увірватись до міста зі сторони Арбатських воріт, проте, не отримавши належну підтримку, атака зупинилася. Не бачачи можливості пр'', 8, NULL, 1, 0, N''4d320e6b-eac3-42a4-9d2e-bdfa58b447a1'', NULL)')
UPDATE [dbo].[CheckPoints] SET [Info].WRITE(N'одовження атаки, підрозділи Речі Посполитої із невеликими втратами відступили від міста. Наприкінці грудня на козацькій раді було прийнято рішення про припинення бойових дій та повернення на Україну.
',NULL,NULL) WHERE [gid]=N'564116f3-c0e3-4d5b-8558-3461f5daff5e'
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'9175a546-da56-4797-b462-e12c785b3a36', 9, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва за Перекоп і Очаків', N'49;32', N'Основним напрямком наступу на турецькі володіння були береги Анатолії та Малої Азії. Сагайдачний розробив концепцію активної, ініціативної боротьби проти турецької агресії: не тільки давав відсіч нападам татарських орд і турецьких військ на Україну, а й переносив військові дії на територію ворога – володіння султанської Туреччини та Кримського ханства. Ставилося завдання послаблювати військову силу ворога, його економічно-матеріальну базу, знищувати ворожий флот, для чого слід було зруйнувати найважливіші порти. Відповідно цієї концепції, в 1607 році, Сагайдачний спустошив два мусульманських міста – Очаків та Перекоп. У березні 1607 р. добре оснащений великий турецький флот вийшов у Чорне море, щоб протистояти козакам. Однак під Очаковом козацькі чайки розігнали десять турецьких сторожових кораблів. У жовтня 1607 р. козаки здобули Перекоп.', 6, NULL, 3, 0, N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'a72de113-2eac-4b3e-892f-069f18f29d1f', 13, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Гетьманство', N'49.57; 30.26', N'У червні або на початку липня 1616 року П.Сашайдачного було проголошено гетьманом Війська Запорозького. Причиною цього могла стати його обіцянка організувати масштабніший похід, ніж попередні.', 5, NULL, 1, 0, N'ba110e49-9ae6-4764-b5b8-5203dbfe535d', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', 8, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Похід на Варну', N'48;33', N'Похід під проводом гетьмана Григорія Ізаповича, який часто приписують П.Сагайдачному – морський похід на Варну (Османська імперія) влітку 1606 року. Під час цього походу козаки здобули фортецю, що до того вважалася неприступною. Штурм Варни завершився знищенням всіх берегових укріплень та османських кораблів, які стояли на рейді. Результатом битви стало визволення кілька тисяч полонених, запорожці захопили 180 тис. злотих та 10 османських галер із вантажем та екіпажем. Через цей похід султан видав наказ перегородити Дніпро біля острова Тавані залізним ланцюгом і заблокувати козаків, проте ці заходи виявилися неефективними.', 6, NULL, 2, 0, N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'ba110e49-9ae6-4764-b5b8-5203dbfe535d', 12, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва при Константинополі та біля острова Зміїний', N'45.15; 30.12', N'1615 року 80 козацьких чайок підійшли до Константинополя, де спалили вщент гавані Мізевні та Архіокі разом із флотом, що перебував там. Османський султан послав навздогін за козаками цілу флотилію, але в морських битвах біля острова Зміїний та під Очаковом її було розгромлено, а козаки взяли в полон османського адмірала Алі-пашу', 5, NULL, 1, 0, N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', 10, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва за Кілію, Білгород, Ізмаїл', N'49.5;31', N'Напади запорожців завдавали колосальних економічних втрат Османській імперії, зменшували її воєнну могутність, а також справляли стримуючий вплив на татар, оскільки обмежували їхні можливості у спустошенні українських земель. В 1608 — на початку 1609 року, Сагайдачний здійснив морський похід на 16 човнах-«чайках» у гирло Дунаю, під час якого було здійснено напад на Кілію, Білгород та Ізмаїл. Фортеця Ізмаїл була знищена, а Сагайдачний був задоволений важкою перемогою. Стратегічне значення Ізмаїла було дуже велике: тут сходилися шляхи з Галацу, Хотина, Бендер та Кілії; тут було найзручніше місце для вторгнення з півночі за Дунай в Добруджу.', 5, NULL, 1, 0, N'9175a546-da56-4797-b462-e12c785b3a36', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', 7, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Польсько-шведська війна', N'47.5;35', N'Лівонська кампанія 1600-1602 – етап польсько-шведської війни 1600-1629рр. На початку 1601 року король Речі Посполитої Сигізмунд III Ваза оголосив про приєднання до Речі Посполитої Естонії, котра до цього належала Швеції. У 1601р. у битві під Валмієру козаки приєдналися до польського війська на чолі з Яном Замойським проти шведської армії під проводом Герцога Нассауського. Серед інших козаків — П.Сагайдачний, який був під керівництвом спершу Самійла Кішки, з початку 1602-го Гаврила Крутневича', 7, NULL, 1, 0, NULL, NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', 11, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Битва за Трапезунд, Синоп', N'49.2;29', N'У серпні 1614 року 2 тисячі запорожців на 40-ка чайках подалися до берегів Османської імперії: захопили Трапезунд, узяли в облогу Синоп, захопили замок, спалили цитадель і місто, а також набільшу в Малій Азії верф, чим завдали Османській імперії збитків на 40 мли злотих, захопили величезну здобич і звільнили багато полонених. 17 жовтня 1614 р. незадоволений султан Ахмед І наказав стратити великого візира Гемюльлжюнелі Насух-пашу, котрий спробував обдурити султана, зобразивши свої дії як велику перемогу над козаками (для чого до полонених було додано кілька сотень переодягнутих рабів).', 7, NULL, 2, 0, N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', NULL)
INSERT INTO [dbo].[CheckPoints] ([gid], [id], [QuestGID], [Name], [GeoCoordinates], [Info], [TasksCount], [ThresholdScore], [OrderId], [IsBonus], [ParentGID], [AuthorGID]) VALUES (N'fe95d70d-9cd5-4c70-997c-644d10f54e61', 16, N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf', N'Бітва під Хотином', N'48.501425; 26.493112', N'Після розгрому польських військ під Цецорою в 1620 році і татарського нападу на Поділля султан Осман II розробив план завоювання
років — війна султанської Османської імперії проти Речі Посполитої, яка завершилася 4-тижневою битвою об''єднаних сил українського козацького і польського шляхетського військ проти османсько-татарських загарбників під Хотином (звідси її назва) і поразкою османів. України, Речі Посполитої, а згодом і Центральної Європи. 160-тисячній османській та татарській армії протистояло лише 87-тисячне польсько-литовське та козацьке військо. Деякі джерела вказують кількість османсько-татарських військ — 300–700 тис. Щоб знайти собі союзника, уряд Речі Посполитої звернувся до українських козаків по допомогу, побіцявши різні права і привілеї. У наслідок битви османські втрати становили близько 80 тис. чоловік. 29 вересня між командуванням польсько-козацьких і османсько-татарських військ почалися переговори про укладення миру. Вони закінчилися підписанням мирової угоди 8 жовтня 1621 року домовившись про відновлення дипломатичних зв''язків. Наслідки Хотинської битви мали велике міжнародне значення. Ця битва змусила Османську імперію відмовитись від планів завоювання Європи. Розгром османського війська під Хотином призвів до внутрішнього політичного послаблення султанської влади (повсталі яничари вбили у 1622 р. Османа II), а також посилення боротьби слов''янських та арабських народів проти османського поневолення. На честь Хотинської битви Папа Григорій XV та Папа Урбан VIII за мужність війська присвятили день пам''яті — 10 жовтня і католицька церква до кінця 19 ст. відправляла в цей день спеціальну службу.
', 8, NULL, 1, 0, N'564116f3-c0e3-4d5b-8558-3461f5daff5e', NULL)
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
SET IDENTITY_INSERT [dbo].[TaskTypes] ON
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'09daff50-996e-4077-9be0-3c0bf516e56c', 3, N'Map')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', 2, N'Test')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9044bc32-30a7-49a5-8dc2-ba24bece5e39', 4, N'TestWithImage')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'979f14eb-265c-4080-a375-9c10cd49b544', 5, N'Writing')
INSERT INTO [dbo].[TaskTypes] ([gid], [id], [Name]) VALUES (N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', 1, N'Conformity')
SET IDENTITY_INSERT [dbo].[TaskTypes] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'0042e433-0e1a-4c85-9ecb-3bfd78ce921a', 82, N'Що відбулося з місцем поховання Гетьмана?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Нічого. Ми можемо відвідати його могилу до сьогодення"/>
    <answer text="Було знищено під час першої світової війни"/>
    <answer text="Було зруйноване у інтербелум (міжвоєнний період)"/>
    <answer text="Було спалене під час другої світової війни"/>
  </answers>
  <rightanswer value="2"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'0eb94457-6c7a-43f2-892a-3fee2dfa2581', 48, N'Вкажіть на карті, куди, ставши гетьманом, направив свій перший похід Петро Сагайдачний.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <rightanswer value="(45.0520008, 35.343095)" maxError="10"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'0fb37468-19de-41d7-8bc1-2112fa7e4ec5', 26, N'Який гетьман очолював похід на Варну?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="vригор?й ?запович"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'117582c1-3063-4bc1-89fe-52144ca44db2', 17, N'За яку територію боролися Річ Посполита та Швеція у 1600-1602рр?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Україна"/><answer text="Балтійське узбережжя (Естонія)"/><answer text="Литовське князівство"/><answer text="Московське царство"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'13c1af27-3418-402d-bb90-755e4d4eecf3', 40, N'Вкажіть на мапі місто, що серед захоплення мало найбільше стратегічне значення.', 0, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><rightanswer value="(45.3505316, 28.7751867)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'149ea6e3-a5eb-4e26-9eb6-3ef47594e978', 32, N'Вкажіть на мапі місто Очаків, захоплене та спустошене внаслідок походу.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><rightanswer value="(46.6197992, 31.5186809)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'1608b11f-f692-4cc8-bd2c-495f15d32e94', 60, N'Яку назву має перемир''я, укладене 1(11) грудня 1618 між Московським царством і Річчю Посполитою терміном на 14,5 року після спроби польського королевича Владислава в 1617—18 захопити Москву?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <rightanswers>
    <rightanswer text="Деулінське перемир''я"/>
    <rightanswer text="Деулінське"/>
  </rightanswers>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'178dd8be-9699-4f15-b2d7-5563b0ca3655', 36, N'Вкажіть основну морську одиницю козацької армії.', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="Чайка"/><answer text="Тетерів"/><answer text="Трирема"/><answer text="Галера"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'2405c40e-4d45-458f-9e4b-534ed32954cc', 68, N'В яких роках відбувалась Хотинська війна?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="1620-1621"/>
    <answer text="1600-1601"/>
    <answer text="1611-1612"/>
    <answer text="1630-1631"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'2715928c-7c22-4061-8d11-b129376e0734', 31, N'Скільки ворожих кораблів було розігнано козаками під Очаковом?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="8"/><answer text="10"/><answer text="12"/><answer text="16"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'296666c7-8182-45fa-8b82-58e473861cdc', 28, N'У яку пору року відбувся похід?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="Зима"/><answer text="Весна"/><answer text="Літо"/><answer text="Осінь"/></answers><rightanswer value="2"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'2a8f858e-2f4c-4cd5-8c5a-3d6c10dadf9e', 71, N'Коли було підписано мирову угоду польсько-козацьких і османсько-татарських військ (Хотинська війна)?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="1 липня 1601"/>
    <answer text="8 жовтня 1621"/>
    <answer text="31 вересня 1631"/>
    <answer text="19 червня 1612"/>
  </answers>
  <rightanswer value="1"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'2f88123f-8d4c-4355-abf7-00c1a6ce1720', 62, N'Загони Федора Бориспільця захопили міста', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Касимов, Казар, Романов"/>
    <answer text="Песочня, Сапожок та Шацьк"/>
    <answer text="Лебедян, Скопин, Данков, Ряжськ"/>
    <answer text="Мещовськ, Козельськ, Серпейськ, Рославль"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'316506d7-e501-4159-babe-abb5482506d3', 81, N'Куди перенесли могилу гетьмана у 1690-1693 роках?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Під південну стіну Богоявленської церкви Києво-Братського монастира"/>
    <answer text="До кладовиська Іллінської церкви, що у Києві"/>
    <answer text="Байкове Кладовище"/>
    <answer text="Некрополь у Кремліївської стіни"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'3406798e-abb7-41c1-818f-4024e59a8bfc', 45, N'Чому султан наказв стратити візира Гемюльлжюнелі Насух-пашу?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="Він був братом Сагайдачного"/><answer text="Він зрадив султана"/><answer text="Він залицявся до дружини султана"/><answer text="Він намагався переконати султана, що османці пермогли"/></answers><rightanswer value="3"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'344a6de5-3813-482a-9cb4-79be7c3f3089', 65, N'З яких воріт вдалось ввірватись козацькому війську до Москви?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Арабатських"/>
    <answer text="Сухарєва"/>
    <answer text="Таганських"/>
    <answer text="Калузьких"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'3bcbc1d8-f742-41af-84ab-795e84863bef', 25, N'Біля якого острова турки перегородили Дніпро залізним ланцюгом після взяття козаками Варни?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="Тавань"/><answer text="Зміїний"/><answer text="Хортиця"/><answer text="Джарилгач"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'4557ea13-68cb-4a18-aa61-228c565d67ee', 54, N'Співставте дані про кафську фортецю на 1616 рік', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <questions>
    <question code="1" text="Висота зовнішніх стін(м)"/>
    <question code="2" text="Довжина зовнішніх стін(км)"/>
    <question code="3" text="Населення Кафи (тис. осіб.)"/>
    <question code="4" text="Гарнізон міста (тис.осіб.)"/>
  </questions>
  <answers>
    <answer code="А" text="13"/>
    <answer code="Б" text="5"/>
    <answer code="В" text="70-100"/>
    <answer code="Г" text="3.5"/>
    <answer code="Д" text="6"/>
  </answers>
  <rightanswers>
    <rightanswer value="1-А"/>
    <rightanswer value="2-Б"/>
    <rightanswer value="3-В"/>
    <rightanswer value="4-Г"/>
  </rightanswers>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'46d085cb-3e67-494f-88db-1fdd7f536feb', 41, N'Шлях на яке місто відкривав Ізмаїл?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><answers><answer text="Добруджа"/><answer text="Київ"/><answer text="Варна"/><answer text="Хотин"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'4d268329-4298-4dcd-9686-ceb113efc7cd', 21, N'Встановіть відповідність між полководцями та їх арміями', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><questions><question code="1" text="Швеція"/><question code="2" text="Річ Посполита"/><question code="3" text="Козацьке військо 1601р."/><question code="4" text="Козацьке військо 1602р."/></questions><answers><answer code="А" text="Самійло Кішка"/><answer code="Б" text="Герцог Нассауський"/><answer code="В" text="Гаврило Крутневич"/><answer code="Г" text="Петро Конашевич-Сагайдачний"/><answer code="Д" text="Ян Замойський"/></answers><rightanswers><rightanswer value="1-Б"/><rightanswer value="2-Д"/><rightanswer value="3-А"/><rightanswer value="4-В"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'4e7ab747-a5fc-4160-9d8d-ab71438660b0', 73, N'Хто у 1622 р. вбив султана Османа II?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Татари"/>
    <answer text="Козаки"/>
    <answer text="Поляки"/>
    <answer text="Яничари"/>
  </answers>
  <rightanswer value="3"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'52ef3f31-560d-4049-bd5a-930807be7ff0', 44, N'На яку суму завдали збитки козаки Османській імперії нападами на Синоп та Трапезунд?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="40 млн. доларів"/><answer text="40 млн. злотих"/><answer text="5 млн. злотих"/><answer text="100 тис. злотих"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'56e5ebe6-0144-4e28-9242-2b1b94c900da', 29, N'Вкажіть на мапі місто, яке було захоплене та спустошене у результаті нападу на Варну.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><rightanswer value="(43.2047556, 27.8028249)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'5bcb4247-0de2-4200-9303-ddd434788f6e', 75, N'Вкажіть на мапі місце останньої битви Петра Сагайдачного, де він був смертельно поранений', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <rightanswer value="(48.4381972,26.51311)" maxError="10"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'5fd94116-42bf-47ae-ac2e-3a2441f10628', 18, N'Який гетьман стояв на чолі козацького війська на початку 1601р.?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Самійло Кішка"/><answer text="Богдан Хмельницький"/><answer text="Петро Конашевич-Сагайдачний"/><answer text="Гаврило Крутневич"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'616d5e95-df79-49a3-b2c6-86e8897f4cab', 42, N'Яку чисельність мало козацьке військо під час нападу на Синоп?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="2 000"/><answer text="500"/><answer text="10 000"/><answer text="200"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'679de956-5e74-4993-8d0a-7f9c393b42cc', 66, N'Покажіть на карті, де відбувалася Хотинська війна', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <rightanswer value="(48.521744, 26.498382)" maxError="10"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'6f7d8431-9496-417b-b4ed-d37eae13b5fd', 39, N'У гирло якої річки були спущені човни Сагайдачного?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="?унай"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'7400e18f-a5cf-4551-9966-b4837793c14d', 56, N'Яка кількість козаків, з якими П. Сагайдачний захопив Кафу', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="300 козаків"/>
    <answer text="2947 козаків"/>
    <answer text="4000 козаків"/>
    <answer text="6000 козаків"/>
  </answers>
  <rightanswer value="2"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'7c5e5972-10f4-414a-9049-30a7b59ad6a7', 19, N'Який гетьман стояв на чолі козацького війська на початку 1602р.?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Самійло Кішка"/><answer text="Богдан Хмельницький"/><answer text="Петро Конашевич-Сагайдачний"/><answer text="Гаврило Крутневич"/></answers><rightanswer value="3"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'7dd770d3-f8ad-4650-b851-0da602da3812', 51, N'Гарнізон міста Кафа на момент нападу Сагайдачного складався з 3 яничарських орт, 300 вояків коменданта фортеці та 200 солдат воєнно-моських сил. Тобто загалом це було:', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="близько 1400 воїнів"/>
    <answer text="близько 2000 воїнів"/>
    <answer text="5987 воїнів"/>
    <answer text="близько 3500 воїнів"/>
  </answers>
  <rightanswer value="3"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'80287af1-17b8-4b2d-b230-2b38491e169e', 38, N'Якою була доля фортеці Ізмаїл?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><answers><answer text="Знищена"/><answer text="Продана Римській імперії"/><answer text="Розібране на каміння з якого потім було поставлено пам’ятник Сагайдачному"/><answer text="Передане Польщі"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'832bc78a-9c52-4c4f-a1fc-e425550b4966', 43, N'Хто допомагав козакам при нападі на Трапезунд?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><answers><answer text="Колишні полонені"/><answer text="Поляки"/><answer text="Кримські татари"/><answer text="Ніхто"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'835062b3-6eac-4787-9bf7-b76df41e90ce', 76, N'У битві під хотином Сагайдачний здобув вогневе поранення. Куди влучила куля?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <rightanswers>
    <rightanswer text="В руку"/>
    <rightanswer text="в руку"/>
	<rightanswer text="Рука"/>
	<rightanswer text="Руку"/>
  </rightanswers>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'865ee0b5-3eba-4e8b-9e76-bc613bb22dfa', 20, N'На боці якої країни виступали козаки?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><answers><answer text="Річ Посполита"/><answer text="Швеція"/><answer text="Естонія"/><answer text="Захищали свої території"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'8ab0adee-13fd-4efd-af3c-92b70ec692a0', 37, N'Скільки човнів-чайок було у підпорядкування Сагайдачного?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'c720adfa-85ad-4dcb-a50f-c7f9189003fc', CONVERT(xml,N'<TestTask><answers><answer text="10"/><answer text="12"/><answer text="16"/><answer text="19"/></answers><rightanswer value="2"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'90a99377-0421-4b05-a798-566dcfb5bed3', 70, N'З ким об’єднались українські козаки у Хотинській війні?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Річ Посполита"/>
    <answer text="Московія"/>
    <answer text="Османська імперія"/>
    <answer text="Немає правильної відповіді"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'914630fd-7461-40f7-b4c0-462482e80f53', 57, N'Оскільки чайки не мали багато місця на борту, козаки викинули чималу частину захопленого добра, аби забрати якнайбільше бранців. У такий спосіб підтвердивши свою обітницю визволяти з неволі …', 1, N'979f14eb-265c-4080-a375-9c10cd49b544', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <rightanswers>
    <rightanswer text="Християн"/>
    <rightanswer text="Християни"/>
  </rightanswers>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'98c3f1d7-0cc2-4997-a1cb-cce138a65a79', 77, N'Вкажіть відповідність між місцевістю та її відгуком у біографії Сагайдачного', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <questions>
    <question code="1" text="Хотин"/>
    <question code="2" text="Варна"/>
    <question code="3" text="Кафа"/>
    <question code="4" text="Село Кульчиці"/>
  </questions>
  <answers>
    <answer code="А" text="Місце народження"/>
    <answer code="Б" text="Останне місце битви"/>
    <answer code="В" text="Турецька фортеця, яка вважалася неприступною, на яку успішно провів похід САГАЙДАЧИНЙ у 1606 року."/>
    <answer code="Г" text="Турецька фортеця на яку провів похід 1616 року."/>
  </answers>
  <rightanswers>
    <rightanswer value="1-Б"/>
    <rightanswer value="2-В"/>
    <rightanswer value="3-Г"/>
    <rightanswer value="4-А"/>
  </rightanswers>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'9f8fd7cb-8acb-426c-9afa-184029b987fd', 27, N'Скільки золотих становила здобич козаків у битві за Варну?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="1 000"/><answer text="180 000"/><answer text="500 000"/><answer text="80 000"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'aaed3754-db74-452a-b7dc-27b75fb377f4', 55, N'Взяття запорозькими козаками на чолі з П.Сагайдачним турецької фортеці Кафи відбулось', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="22 липня 1616 року"/>
    <answer text="22 вересня 1616 року"/>
    <answer text="22 червня 1615 року"/>
    <answer text="23 липня 1617 року"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'af9e2a24-9ff5-4beb-982a-5762d31e8183', 63, N'Що вимагали козаки на двох загальних радах в червні 1618 року при подготовці до московського походу?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Розширення прав козаків"/>
    <answer text="Збільшення чисельності армії козаків"/>
    <answer text="Припинити утиски православного населення"/>
    <answer text="Змінити план майбутнього походу"/>
  </answers>
  <rightanswer value="2"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'b6b15e41-37a8-480b-a6dd-cfff3ef0042d', 24, N'Кому належали фортеці, які штурмували козаки під час морських походів?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'b9d7454a-1c7a-4841-9fa5-ab3a837c551e', CONVERT(xml,N'<TestTask><answers><answer text="Річ Посполита"/><answer text="Османська імперія"/><answer text="Кримське ханство"/><answer text="Московія"/></answers><rightanswer value="1"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'bd8bb7b1-7e34-4622-8425-da7365df5c55', 80, N'На престолі «св. Йоанна Золотоусого» знаходилася реліквія, яка належала гетьману.', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Шабля Гетьмана"/>
    <answer text="Серебряний хрест Гетьмана"/>
    <answer text="Булава Гетьмана"/>
    <answer text="Пістоль Гетьмана"/>
  </answers>
  <rightanswer value="1"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'bf0d04d6-59fb-429c-8630-0d0299cb6d40', 22, N'Вкажіть на мапі місце, де козаки приєдналися до польської армії.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><rightanswer value="(57.4729414, 25.3146046 )" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'c20f5130-d6da-4924-b31c-4922d430cfd0', 35, N'Що не було одним з основних завдань Сагайдачного у ході кампанії?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="Послаблення економічно-матеріальної бази"/><answer text="Зруйнування найважливіших портів"/><answer text="Знищення ворожого флоту"/><answer text="Поповнення рядів козацької армії"/></answers><rightanswer value="3"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'c8df90cf-e15f-41f4-9dcf-e262382c3fdf', 47, N'Вказати на мапі місто в якому знаходилася найбільша в Малій Азії верф', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><rightanswer value="(42.0141302, 35.0948861)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'ccddb3df-f2cf-4127-b4c4-b9729748b7cd', 34, N'Установіть відповідність між подіями та коли вони відбулися.', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><questions><question code="1" text="Битва Турецького флоту у Чорному морі з козаками"/><question code="2" text="Здобуття Перекопу"/><question code="3" text="Розграблення Очакова"/><question code="4" text="Захоплення Варни"/></questions><answers><answer code="А" text="жовтень 1607"/><answer code="Б" text="березень 1607"/><answer code="В" text="1607"/><answer code="Г" text="1606"/><answer code="Д" text="1609"/></answers><rightanswers><rightanswer value="1-Б"/><rightanswer value="2-А"/><rightanswer value="3-В"/><rightanswer value="4-Г"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'cdd81a51-ba22-4f6d-baff-b433e42474ee', 33, N'Вкажіть на мапі місто Перекоп, захоплене та спустошене внаслідок походу.', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><rightanswer value="(46.1612592, 33.6884603)" maxError="10"/></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'cea14b01-d01d-4e5e-a549-4951f8dd441a', 50, N'На момент отримання Петром Сагайдачним гетьманської булави Кафа була:', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Головним невільничим ринком у Криму"/>
    <answer text="найбільшою фортецею Османської імперії"/>
    <answer text="резиденцією Іоанна Петра 2"/>
    <answer text="резиденцією султана Ахмеда"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'cfa24fc7-8e19-461a-a391-628eb3d14901', 58, N'Укажіть на карті місто, на яке було здійснено похід 20-тисячного козацького війська Сагайдачного. ', 2, N'09daff50-996e-4077-9be0-3c0bf516e56c', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <rightanswer value="(55.7494733,37.3523201)" maxError="10"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'd091178f-66e2-4dfc-90be-88ef1f5cf02c', 67, N'Встановіть відповідність між датою та подією', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <questions>
    <question code="1" text="Хотинська війна"/>
    <question code="2" text="Підписання мирової угоди між польсько-козацькими і османсько-татарськими військами"/>
    <question code="3" text="Повстання яничар та вбивство Османа II"/>
    <question code="4" text="День пам''яті на честь Хотинської битви"/>
  </questions>
  <answers>
    <answer code="А" text="1620–1621рр."/>
    <answer code="Б" text="10 жовтня"/>
    <answer code="В" text="1622р"/>
    <answer code="Г" text="8 жовтня 1621"/>
  </answers>
  <rightanswers>
    <rightanswer value="1-А"/>
    <rightanswer value="2-Г"/>
    <rightanswer value="3-В"/>
    <rightanswer value="4-Б"/>
  </rightanswers>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'd0adb2ba-1024-4718-a0af-399579e810fb', 53, N'Під час свого походу на Кафу козаки зустріли ескадру османських галер, яку розгромили та захопили близько половини суден. Аби ввести османів в оману щодо своїх подальших дій, П.Сагайдачний наказав', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Частині війська демонстративно повернутись на Січ, а решті тиждень переховуватись"/>
    <answer text="Вирушити на Кафу на османських галерах"/>
    <answer text="Побудувати дерев’яного козака, та сховатись всередині. Коли османи затягнули його до міста, козаки вилізли та легко захопили місто"/>
    <answer text="Не продовжувати похід"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'd1025369-00cf-4af8-825f-3b819ec36d50', 78, N'Дата смерті гетьмана?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="10(20) квітня 1622"/>
    <answer text="11(19) березня 1623"/>
    <answer text="11 липня(21 червня ) 1622"/>
    <answer text="17 січня 1621 (28 грудня 1620)"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'd24af5b4-02f9-41ec-89d4-a2f5198d6d11', 49, N'Неприступна османська фортеця Кафа знаходилась на території сучасного міста:', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Феодосія"/>
    <answer text="Одеса"/>
    <answer text="Керч"/>
    <answer text="Татарбунари"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'd5297f57-faa2-47da-861f-c0fa2b131ea4', 69, N'Між ким відбувалась Хотинська війна?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Османської імперія та Річ Посполита"/>
    <answer text="Османська імперія та Запорізька Січ"/>
    <answer text="Річ посполита та Запорізька Січ"/>
    <answer text="Запорізька Січ та Московія"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'd62ee41b-3160-4567-83aa-b6fddf2952cd', 79, N'Де був похоронений Гетьман?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'2e5e6d85-a5b2-4f66-895f-ef4c7462e67c', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Село Кульчиці"/>
    <answer text="Байкове Кладовище"/>
    <answer text="Богоявленська церква Києво-братського монастира"/>
    <answer text="Некрополь у Кремліївської стіни"/>
  </answers>
  <rightanswer value="1"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'd6e07195-bf34-4fac-ba79-6fa878830bb3', 72, N'Чиє військо було розгромлено під Хотином?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Османське"/>
    <answer text="Московське"/>
    <answer text="Польське"/>
    <answer text="Козацьке"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'e3fcdeee-d7e4-49f2-a804-cb3f9b911cdb', 59, N'Установіть відповідність', 4, N'9f3a9b8b-6b56-473e-b88a-ddd33c337396', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <questions>
    <question code="1" text="6 квітня 1617 року"/>
    <question code="2" text="18 жовтня 1617 року"/>
    <question code="3" text="7 липня 1618 року"/>
    <question code="4" text="11 жовтня 1618 року"/>
  </questions>
  <answers>
    <answer code="А" text="Королевич Владислав вирушив із Варшави в похід до Москви з метою отримати корону московського царя."/>
    <answer code="Б" text="Польсько-литовська армія завоювала Вязьму."/>
    <answer code="В" text="Військо королевича Владислава та козаки Петра Сагайдачного розпочали наступ на Москву."/>
    <answer code="Г" text="Козаки підійшли під одне з найбільш укріплених міст на півдні Московщини — Лівни."/>
  </answers>
  <rightanswers>
    <rightanswer value="1-А"/>
    <rightanswer value="2-Б"/>
    <rightanswer value="3-Г"/>
    <rightanswer value="4-В"/>
  </rightanswers>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'e889da3f-f7fa-4da0-b56f-b0873647a4dd', 46, N'І''мя султана, який правив османською імперією під час нападів на Синоп та Трапезунд.', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'ddbfba1b-34f4-4d38-8efb-0c8cf29ee681', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="Ахмед"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'ecc3bbdd-f495-4e28-9de8-a61ab272d573', 61, N'Скільки запорізьких сотників по в березні 1618 року зустрілись з із королевичем Владиславом і пообіцяли привести йому 20-тисячне військо?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="10"/>
    <answer text="12"/>
    <answer text="15"/>
    <answer text="5"/>
  </answers>
  <rightanswer value="1"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'f8b277e3-4012-4112-ac67-0f558e15955c', 52, N'Командир воєнно – морських сил Кафи мав звання', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'4d320e6b-eac3-42a4-9d2e-bdfa58b447a1', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="Капудан-паша"/>
    <answer text="Чорбаджі"/>
    <answer text="Яничар-ага"/>
    <answer text="Баба-яга"/>
  </answers>
  <rightanswer value="0"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'f92c1c84-ec42-42f6-9a06-d7193dbebf37', 23, N'Яку назву мала кампанія в рамках польсько-шведської війни, у якій брали участь козаки у 1600-1602рр.?', 2, N'979f14eb-265c-4080-a375-9c10cd49b544', N'd2ce1ed2-e7f0-4972-864c-b72c5ad0f0df', CONVERT(xml,N'<TestTask><rightanswers><rightanswer text="Лівонська"/><rightanswer text="Лівонська кампанія"/></rightanswers></TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'ff4874b4-763c-4b2b-b964-b2531736817f', 64, N'Скільки полків 20-тисячного козацького війська під проводом Сагайдачного вирушили до Москви у другій половині червня?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'564116f3-c0e3-4d5b-8558-3461f5daff5e', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="9"/>
    <answer text="8"/>
    <answer text="10"/>
    <answer text="6"/>
  </answers>
  <rightanswer value="3"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'ff856b03-3c16-40d2-8e30-4f5e64546641', 74, N'Що зробили на честь Хотинської битви Папа Григорій XV та Папа Урбан VIII за мужність війська?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'fe95d70d-9cd5-4c70-997c-644d10f54e61', CONVERT(xml,N'<TestTask>
  <answers>
    <answer text="змінили церковний календар"/>
    <answer text="присвятили день пам''яті у католицькій церкві"/>
    <answer text="присвятили назву католицькій церкві"/>
    <answer text="нічого"/>
  </answers>
  <rightanswer value="1"/>
</TestTask>',1), NULL)
INSERT INTO [dbo].[Tasks] ([gid], [id], [Text], [MaxScore], [TaskTypeGID], [CheckPointGID], [SourceFile], [AuthorGID]) VALUES (N'ffd69629-5013-44bb-83da-974ad632b16a', 30, N'Частиною кампанії проти якої держави були захоплення Очакова та Перекопа?', 1, N'6d1e2691-3eab-41a7-90c4-8bd9ec7b1fd8', N'9175a546-da56-4797-b462-e12c785b3a36', CONVERT(xml,N'<TestTask><answers><answer text="Султанська Туреччина"/><answer text="Московське царство"/><answer text="Литовське князівство"/><answer text="Фашистська Німеччина"/></answers><rightanswer value="0"/></TestTask>',1), NULL)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[Quests] ON
EXEC(N'INSERT INTO [dbo].[Quests] ([gid], [id], [Name], [FullInfo], [ShortInfo], [ImagePath], [AuthorGID]) VALUES (N''ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf'', 2, N''Петро Сагайдачний'', N''<p>Петро Кононович Конашевич-Сагайдачний народився бл. 1582р. в селі Кульчиці в православній родині (тепер село Самбірського району Львівської області). Упродовж 1589&ndash;1592 рр. здобував початкову освіту у Самборі. З 1592 по 1598 роки навчався в Острозькій академії. Після випуску П.Сагайдачний переїхав до Львова, згодом &mdash; до Києва, де працював домашнім учителем, також помічником київського земського судді. Змалку навчався військовій справі, вмів стріляти з лука, був високоосвіченою, інтелігентною, глибоко релігійною людиною. Брав участь в Молдавській і Лівонської кампаніях 1600-1603 рр.</p>
<p>Вже в ранні часи свого перебування на Січі П.Сагайдачний виявив талант військового лідера, козаки обрали його обозним, доручивши відати всією артилерією Січі. У період між 1605 і 1610 П.Сагайдачний стає кошовим отаманом Запорізької Січі маючи величезний авторитет. Його організаторські здібності добре проявилися в першу чергу у вишколі запорожців та створенні регулярних частин війська. Залізна дисципліна, яку всіляко підтримував Петро Сагайдачний, зробили свою справу досить швидко. Військо стало якісно найкращим в Європі. Надзвичайну сміливість козаки стали поєднувати із тактичними та стратегічними факторами військового мистецтва.</p>
<p>Османська імперія страждала від походів П.Сагайдачного, особливо від нападів з моря. Він очолював відважні морські походи козаків на Стамбул, Трапезунд, Синоп; розробив і вдосконалив козацьку тактику морського бою на &laquo;чайках&raquo; &mdash; швидкохідних човнах. З 1600 року кошовий отаман керував майже всіма значними походами. У лютому 1615 року Конашевич вже був впливовим козацьким полковником, що мав у своєму підпорядкуванні загін чисельністю до 3000 козаків. А вже 1616 року П.Сагайдачного було проголошено Гетьманом Війська Запорозького.</p>
<p>У 1616 році відбувся історичний похід на Кафу, турецьку твердиню в Криму з найбільшим в імперії ринком рабів. Річ Посполита враховувала думку козаків вперше за довгу історію існування Січі. Гетьсан П.Сагайдачний прихильно ставився до ідеї зміцнення позицій України, однак поки що у складі Польщі. Це зумовлювалось продовженням агресивної зовнішньої політики поляками та турками на початку ХVІ століття.</p>
<p>На початку квітня 1617 року польсбкий королевич Владислав вирушив на похід до Москви з метою отримання корони московського царя Михайла Романова. Гетьман П.Сагайдачний і старшина з частиною козацького війська, сподіваючись заслужити у польсько-шляхетського уряду розширення власних прав і прав заможного козацтва, взяли участь у поході польського королевича Владислава 1618 року на Москву.</p>
<p>Поляки дійшли до Москви, але цього ж було укладено Деулінське перемир&rsquo;я. Королевич Владислав відмовився від прав на московський престол, за що Польщі відійшли Смоленська і Чернігівсько-Сіверська землі. Відмова гетьмана П.Сагайдачного від морських походів проти турків викликала невдоволення серед козацтва.</p>
<p>Приблизно наприкінці травня 1619 року гетьман П.Сагайдачного позбавляють влади та обирають запорозьким гетьманом Дмитра Барабаша. Проте вже на початку липня П.Сагайдачний повернув собі гетьманську булаву. Пізніше козаки, незадоволені його командуванням, позбавляють його влади, обираючи новим гетьманом Якова Бородавку.</p>
<p>П.Сагайдачний був гетьманом реєстрових козаків, допоки у 1621 році йому не випала нагода знову з&rsquo;явитися на політичній арені. Він скинув Неродича Бородавку &mdash; керівника нереєстрових козаків з гетьманства, зайнявши його місце.</p>
<p>Згодом очолюване П.Сагайдачним козацьке військо, спільно із польською армією, відіграли вирішальну роль у розгромі 1621 р. під Хотином турецької армії, що загрожувала країнам Європи. Могутня турецька армія із 300 тис.чол. була фактично розгромлена 40-тисячним військом козаків на чолі з Сагайдачним. Навіть сеймовий комісар польської армії магнат Якуб Собеський був змушений визнати: &laquo;Справжніми переможцями під Хотином і рятівниками Польщі були козаки&raquo;'', N''Петро Конашевич-Сагайдачний — український полководець, гетьман реєстрового козацтва, кошовий отаман Запорізької Січі. Організатор успішних походів запорозьких козаків проти Кримського ханства, Османської імперії та Московського царства. Чи не бажаєте краще познайомитись з життєвим шляхом видатного гетьмана?'', N''/libs/img/sagay.jpg"'', NULL)')
UPDATE [dbo].[Quests] SET [FullInfo].WRITE(N'.</p><p>П.Сагайдачний проявив себе в цій війні як неперевершений військовий стратег і тактик.</p><p>10 квітня (20 квітня) 1622 року П.Сагайдачний помер від вогнепального поранення руки, яке отримав під час битви під Хотином.</p>',NULL,NULL) WHERE [gid]=N'ac62ea9d-536c-4c92-b7b1-e3e3e375fdcf'
SET IDENTITY_INSERT [dbo].[Quests] OFF
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
ALTER TABLE [dbo].[Quests]
    ADD CONSTRAINT [FK_Quests_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_CheckPoints] FOREIGN KEY ([CheckPointGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY ([TaskTypeGID]) REFERENCES [dbo].[TaskTypes] ([gid])
ALTER TABLE [dbo].[Tasks]
    ADD CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_CheckPoints] FOREIGN KEY ([ParentGID]) REFERENCES [dbo].[CheckPoints] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Quests] FOREIGN KEY ([QuestGID]) REFERENCES [dbo].[Quests] ([gid])
ALTER TABLE [dbo].[CheckPoints]
    ADD CONSTRAINT [FK_CheckPoints_Users] FOREIGN KEY ([AuthorGID]) REFERENCES [dbo].[Users] ([gid])
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [FK_Users_Faces] FOREIGN KEY ([FaceGID]) REFERENCES [dbo].[Faces] ([gid]) ON DELETE CASCADE ON UPDATE CASCADE
COMMIT TRANSACTION
