USE HighSchoolDB
GO

--Trigger cho việc chèn nhiều giáo viên tổ trưởng
CREATE OR ALTER TRIGGER trigger_1 ON dbo.GroupLeader
FOR INSERT
AS 
BEGIN
     DECLARE @numberOfTeacher INT
	 DECLARE @numberForCheck INT

	 SELECT @numberForCheck = COUNT(*) FROM Inserted

	 SELECT @numberOfTeacher = COUNT(*) FROM 
	 (
		(Inserted I INNER JOIN dbo.[Group] G ON G.Id = I.Id_group) 
		INNER JOIN dbo.Teacher T ON T.Id = I.Id_leader AND T.Group_id = G.Id
	 )
	 
	 IF @numberForCheck <> @numberOfTeacher
	 BEGIN
		RAISERROR(N'Chèn giáo viên không khớp với tổ',16,1)
		ROLLBACK TRANSACTION
	 END
	 ELSE
     BEGIN
		DECLARE @checkValidTime INT = 0
		
		SELECT @checkValidTime = COUNT(*) FROM Inserted I INNER JOIN dbo.GroupLeader GL 
		ON I.Id_group = GL.Id_group
		AND I.start_date > GL.start_date

		IF @checkValidTime <> @numberForCheck
		BEGIN
			RAISERROR(N'Thời gian truyền vào không hợp lệ',16,1)
			ROLLBACK TRANSACTION
        END
        ELSE
        BEGIN
			RAISERROR(N'Success',16,1)
			--ROLLBACK TRANSACTION
        end
	 END
END

IF DATEDIFF(DAY, '2015-07-21','2015-07-23') > 0
PRINT N'Chán'
INSERT INTO dbo.GroupLeader
        ( Id_leader, start_date, Id_group )
VALUES  ( '008395', -- Id_leader - char(9)
          '2015-07-09', -- start_date - date
          1  -- Id_group - int
          ),
		  ( '008231', -- Id_leader - char(9)
          '2018-07-09', -- start_date - date
          4  -- Id_group - int
          )

SELECT * FROM dbo.GroupLeader

GO

-- Trigger chèn giáo viên và môn học cho bảng Teacher_Subject

ALTER TRIGGER Trigger_2 ON dbo.Teacher_Subject
FOR INSERT 
AS 
BEGIN
	DECLARE @numberOfTeacher_Subject INT 
	DECLARE @numberForCheck INT

	SELECT @numberOfTeacher_Subject = COUNT(*) FROM Inserted

	SELECT @numberForCheck = COUNT(*) FROM
	(
		(
			(
				Inserted I INNER JOIN dbo.Subject S
				ON I.Id_subject = S.Id
			)
			INNER JOIN dbo.[Group] G ON S.Id_group = G.Id
		)
		INNER JOIN dbo.Teacher T ON T.Group_id = G.Id AND T.Id = I.Id_teacher
	)

	IF @numberOfTeacher_Subject = @numberForCheck
	BEGIN	
		RAISERROR(N'Thành công',16,1)
		--ROLLBACK TRANSACTION
    END
    ELSE 
	BEGIN
		RAISERROR(N'Thông tin điền vào sai',16,1)
		ROLLBACK TRANSACTION
	END
END 
Go

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '000529', -- Id_teacher - char(9)
          'T10HH'  -- Id_subject - char(6)
          ),
		  ( '003778', -- Id_teacher - char(9)
          'H10HH'  -- Id_subject - char(6)
          )




ALTER TRIGGER Trigger_2_Update ON dbo.Teacher_Subject
FOR UPDATE
AS
BEGIN
	DECLARE @id_teacher char(9)
	DECLARE @id_subject_del CHAR(6)
	DECLARE @id_subject_in CHAR(6)

	SELECT @id_teacher = Deleted.Id_teacher, @id_subject_del = Deleted.Id_subject FROM Deleted

	IF @id_teacher IS NULL OR @id_subject_del IS NULL
	BEGIN
		RAISERROR(N'Giáo viên hoặc môn học không tồn tại hoặc chưa tồn tại cặp giá trị này trong bảng',16,1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		SELECT @id_subject_in = Inserted.Id_subject FROM Inserted
		IF EXISTS
		(
			SELECT * FROM 
			( 
				(
					dbo.Subject S INNER JOIN dbo.[Group] G ON S.Id_group = G.Id
				)
				INNER JOIN dbo.Teacher T ON T.Id = @id_teacher AND T.Group_id = G.Id AND S.Id = @id_subject_in
			) 
		)
		BEGIN
			RAISERROR(N'Successful',16,1)
			--ROLLBACK TRANSACTION
        END
        ELSE
        BEGIN
			IF EXISTS
			(
				SELECT * FROM dbo.Subject WHERE id = @id_subject_in
			)
			BEGIN
				RAISERROR(N'Môn học và giáo viên không cùng tổ',16,1)
				ROLLBACK TRANSACTION
			END
			ELSE
            BEGIN
				RAISERROR(N'Môn học không tồn tại',16,1)
				ROLLBACK TRANSACTION
            END
        END	
	END	
END
Go

UPDATE dbo.Teacher_Subject SET Id_subject = 'S10VSV' WHERE Id_teacher ='000529' AND Id_subject = 'T10DS'
UPDATE dbo.Teacher_Subject SET Id_subject = 'T10HH' WHERE Id_teacher ='000529' AND Id_subject = 'T10DS'
SELECT * FROM dbo.Teacher_Subject

GO

ALTER TRIGGER Trigger_2_delete ON dbo.Teacher_Subject
FOR DELETE
AS
BEGIN
	DECLARE @id_teacher CHAR(9)
	DECLARE @totalDel INT = 0
	
	SELECT @id_teacher = Deleted.Id_teacher, @totalDel = COUNT(*) FROM Deleted
	GROUP BY Deleted.Id_teacher

	IF @id_teacher IS NULL
	BEGIN
		RAISERROR(N'Giáo viên không tồn tại hoặc giáo viên không dạy môn học đó',16,1)
		ROLLBACK TRANSACTION
	END
    ELSE 
	BEGIN
		IF @totalDel <> 0
		BEGIN
			RAISERROR(N'Successful',16,1)
			--ROLLBACK TRANSACTION		
		END
		ELSE
		BEGIN
			RAISERROR(N'Giá trị truyền vào lỗi',16,1)
			ROLLBACK TRANSACTION
		END
    END  
END

SELECT * FROM dbo.Teacher_Subject

--DELETE dbo.Teacher_Subject WHERE Id_teacher = '000529' AND Id_subject = 'T10GT'

GO

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

SELECT * FROM dbo.Room
SELECT * FROM dbo.Class
SELECT * FROM dbo.Building
SELECT * FROM dbo.[User]
SELECT * FROM dbo.Join_Class

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

--Sửa lại data:   UPDATE dbo.Class SET Id_building = 'H2' WHERE Id LIKE '11%'
insert INTO dbo.Class
VALUES  ( '10H1_2019' , -- Id - char(9)
          N'10 Hóa 1' , -- name - nvarchar(20)
          '2019' , -- Id_Year - char(10)
          'H1' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          '1812881' , -- Id_monitor - char(9)
          '002920'  -- Id_form_teacher - char(9)
        )

SELECT *FROM dbo.Join_Class
SELECT * FROM dbo.Building