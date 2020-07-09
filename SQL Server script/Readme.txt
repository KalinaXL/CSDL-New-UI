1. Bổ sung thông tin cho tòa nhà

INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '01' , -- Id_room - char(6)
          N'Phòng 01 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '02' , -- Id_room - char(6)
          N'Phòng 02 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '03' , -- Id_room - char(6)
          N'Phòng 03 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          N'Phòng 04 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

-----
INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '01' , -- Id_room - char(6)
          N'Phòng 01 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '02' , -- Id_room - char(6)
          N'Phòng 02 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '03' , -- Id_room - char(6)
          N'Phòng 03 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          N'Phòng 04 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )


2. Sửa lại thông tin của trong class bị sai
UPDATE dbo.Class SET Id_building = 'H2' WHERE Id LIKE '11%'

Kết quả: SELECT *FROM dbo.Class
Id		name		Id_Year		Id_building	Id_monitor	Id_form_teacher
10L1_2019	10 Lý 1		2019      	H1  	03    	1810887  	002603   
10T1_2019	10 Toán 1	2019      	H1  	01    	1810173  	000529   
11L1_2020	11 Lý 1		2020      	H2  	03    	1810887  	002603   
11T1_2020	11 Toán 1	2020      	H2  	01    	1810173  	000529 

3. Insert User và Student để test trigger_3_insert
INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1812881', -- Id - char(9)
          'long.le03082000', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )
INSERT INTO dbo.Student
VALUES  ( '1812881' , -- Id - char(9)
          N'Lê Long' , -- Fullname - nvarchar(50)
          N'Quảng Bình' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-08-03'  -- Birthdate - date
        )  


4. Viết trigger_3_insert 
ALTER TRIGGER Trigger_3_insert ON dbo.Class
FOR INSERT
AS
BEGIN
	DECLARE @id_class CHAR(9)
	DECLARE @id_teacher CHAR(9)
	DECLARE @id_monitor CHAR(9)
	DECLARE @id_room CHAR(6)
	DECLARE @id_building CHAR(4)
	DECLARE @id_year CHAR(10)
	DECLARE @number_check INT = 0

	SELECT @id_class = I.Id, @id_teacher = I.Id_form_teacher, @id_monitor = I.Id_monitor,
		   @id_room = I.Id_room, @id_building = I.Id_building, @id_year = I.Id_Year FROM Inserted I
	
	--Kiểm tra học sinh đó đã học lớp khác trong năm học đó hay chưa
	IF @id_class IS NOT NULL
	BEGIN
		IF EXISTS
		(
			SELECT  * FROM 
			(
				(
					dbo.Join_Class JC INNER JOIN dbo.Class C
					ON JC.Id_class = C.Id
				) INNER JOIN dbo.Year Y ON C.Id_Year = Y.Id AND JC.Id_student = @id_monitor
			)
		)
		BEGIN
			RAISERROR(N'Học sinh này đã học lớp nào đó trong năm học này',16,1)
			ROLLBACK TRANSACTION
		END
        ELSE 
		BEGIN
			DECLARE @isValid BIT = 1
			-- Kiểm tra dãy nhà có phù hợp, lớp 10 H1, lớp 11 H2, lớp 12 H3
			IF @id_class LIKE '10%'
			BEGIN
				IF @id_building <> 'H1'
				BEGIN
					SET @isValid = 0
                END
				GOTO nextStep
            END
			ELSE IF @id_class LIKE '11%'
			BEGIN
				IF @id_building <> 'H2'
				BEGIN
					SET @isValid = 0
                END
				GOTO nextStep
            END
			ELSE IF @id_class LIKE '12%'
			BEGIN
				IF @id_building <> 'H3'
				BEGIN
					SET @isValid = 0
                END
				GOTO nextStep
            END
            
			nextStep:
				IF @isValid = 1
				BEGIN
					-- Kiểm tra giáo viên đó đã chủ nhiệm lớp nào trong năm học hay chưa
					DECLARE @number_for_check INT = 0
					SELECT @number_for_check = COUNT(*) FROM dbo.Class WHERE Id_Year = @id_year AND Id_form_teacher = @id_teacher
					IF @number_for_check > 1
					BEGIN
						RAISERROR(N'Giáo viên không thể chủ nhiệm hai lớp trong một năm',16,1)
						ROLLBACK TRANSACTION
                    END
                    ELSE 
					BEGIN
						RAISERROR(N'Successful',16,1)
						ROLLBACK TRANSACTION
					END
                END
                ELSE
                BEGIN
					RAISERROR(N'Học sinh học sai tòa nhà',16,1)
					ROLLBACK TRANSACTION
                END
        END
	END
    ELSE
    BEGIN
		RAISERROR(N'Vi phạm khóa chính hoặc khóa ngoại',16,1)
		ROLLBACK TRANSACTION
    END
END

5. Các trường hợp để test trigger
**********
insert INTO dbo.Class
VALUES  ( '10H1_2019' , -- Id - char(9)
          N'10 Hóa 1' , -- name - nvarchar(20)
          '2019' , -- Id_Year - char(10)
          'H1' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          '1812881' , -- Id_monitor - char(9)
          '002920'  -- Id_form_teacher - char(9)
        )
*************
insert INTO dbo.Class
VALUES  ( '10H1_2019' , -- Id - char(9)
          N'10 Hóa 1' , -- name - nvarchar(20)
          '2019' , -- Id_Year - char(10)
          'H2' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          '1812881' , -- Id_monitor - char(9)
          '002920'  -- Id_form_teacher - char(9)
        )
**********
insert INTO dbo.Class
VALUES  ( '10H1_2019' , -- Id - char(9)
          N'10 Hóa 1' , -- name - nvarchar(20)
          '2019' , -- Id_Year - char(10)
          'H1' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          '1810887'  , -- Id_monitor - char(9)
          '002920'  -- Id_form_teacher - char(9)
        )

insert INTO dbo.Class
VALUES  ( '10H1_2019' , -- Id - char(9)
          N'10 Hóa 1' , -- name - nvarchar(20)
          '2019' , -- Id_Year - char(10)
          'H1' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          '1812881' , -- Id_monitor - char(9)
          '002603'  -- Id_form_teacher - char(9)
        )

6. Comment hoặc xóa 
RAISERROR(N'Successful',16,1)
ROLLBACK TRANSACTION


