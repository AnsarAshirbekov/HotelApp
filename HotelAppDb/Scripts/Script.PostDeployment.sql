/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if not exists (select 1 from RoomTypes)
begin
insert into RoomTypes(Title, Description, Price)
values 
('King Size Bed', 'A room with a king size bed a window.', 100),
('Two Queen Size Bed', 'A room with two queen size beds and a window', 115),
('Executive Suited', 'Two rooms, each with a king size bed and a window', 205)
end

if not exists (select 1 from Rooms)
begin
declare @roomId1 int
declare @roomId2 int
declare @roomId3 int

select @roomId1 = Id from RoomTypes where Title = 'King Size Bed'; 
select @roomId2 = Id from RoomTypes where Title = 'Two Queen Size Bed';
select @roomId3 = Id from RoomTypes where Title = 'Executive Suited';

insert into Rooms(RoomNumber, RoomTypeId)
values
('101', @roomId1),
('102', @roomId2),
('103', @roomId3),
('201', @roomId2),
('202', @roomId2),
('301', @roomId3)
end;