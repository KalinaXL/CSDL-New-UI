USE HighSchoolDB
GO
CREATE PROC insert_teacher
	@Id VARCHAR(9),
	@Fullname NVARCHAR(50),
	@Gender CHAR(1),
	@Email VARCHAR(20),
	@Address NVARCHAR(100),
	@Phonenumber CHAR(11),
	@CardId VARCHAR(12),
	@Birthdate DATE,
	@Group_id INT
AS
BEGIN
	-- check fullname is valid
	IF @Fullname LIKE '%[0-9!@#$%^&*();:,<.>/?`|\_~-=]%'
	BEGIN
		RAISERROR(N'Tên giáo viên không chứa số hay các ký tự đặc biệt', 16, 1)
		RETURN
    END
	
	-- check email is valid
	IF @Email NOT LIKE '%_@__%.__%'
	BEGIN
		RAISERROR(N'Email không hợp lệ', 16, 1)
		RETURN
	END

	-- check gender is valid
	IF @Gender NOT IN ('M', 'F')
	BEGIN
		RAISERROR(N'Giới tính phải là M (Nam) hoặc F (Nữ)', 16, 1)
		RETURN
	END

	-- check phone number is valid
	IF ISNUMERIC(@Phonenumber) = 0 OR CAST (@Phonenumber AS INT) <= 0
	BEGIN
		RAISERROR(N'Số điện thoại không phải là 1 số hợp lệ', 16, 1)
		RETURN
	END

	IF SUBSTRING(@Phonenumber, 2, 1) NOT LIKE '[1-9]'
	BEGIN
		RAISERROR(N'Ký tự thứ 2 của số điện thoại phải khác 0', 16, 1)
		RETURN		
	END
	IF LEN(@Phonenumber) NOT IN (10, 11)
	BEGIN
		RAISERROR(N'Độ dài số điện thoại phải là 10 hoặc 11', 16, 1)
		RETURN
    END

	-- check card id is valid
	IF ISNUMERIC(@CardId) = 0 OR CAST (@CardId AS INT) < 0
	BEGIN
		RAISERROR(N'Số CMND không phải là 1 số hợp lệ', 16, 1)
		RETURN
	END
	IF LEN(@CardId) NOT IN (9, 12)
	BEGIN
		RAISERROR(N'Độ dài số CMND phải là 9 hoặc 12', 16, 1)
		RETURN
    END

	-- check age of teacher
	IF YEAR(GETDATE()) - YEAR(@Birthdate) < 22
	BEGIN
		RAISERROR(N'Số tuổi của giáo viên phải không nhỏ hơn 22 tuổi', 16, 1)
		RETURN
    END
	ELSE IF YEAR(GETDATE()) - YEAR(@Birthdate) > 60
	BEGIN
		RAISERROR(N'Giáo viên này đã nghỉ hưu', 16, 1)
		RETURN
    END

	INSERT dbo.Teacher
	(
	    Id,
	    Fullname,
	    Gender,
	    Email,
	    Address,
	    Phonenumber,
	    Identitycardnumber,
	    Birthdate,
	    Group_id
	)
	VALUES
	(   @Id,        -- Id - char(9)
	    @Fullname,       -- Fullname - nvarchar(50)
	    @Gender,        -- Gender - char(1)
	    @Email,        -- Email - varchar(20)
	    @Address,       -- Address - nvarchar(100)
	    @Phonenumber,        -- Phonenumber - char(11)
	    @CardId,        -- Identitycardnumber - varchar(12)
	    @Birthdate, -- Birthdate - date
	    @Group_id          -- Group_id - int
	)
END

GO

CREATE PROC update_teacher
	@Id VARCHAR(9),
	@Fullname NVARCHAR(50),
	@Gender CHAR(1),
	@Email VARCHAR(20),
	@Address NVARCHAR(100),
	@Phonenumber CHAR(11),
	@CardId VARCHAR(12),
	@Birthdate DATE,
	@Group_id INT
AS
BEGIN
	IF @Id NOT IN (SELECT Id FROM dbo.Teacher)
	BEGIN
		PRINT N'Giáo viên có mã ' + @Id + ' không tồn tại'
		RETURN
	END
	-- check fullname is valid
	IF @Fullname LIKE '%[0-9!@#$%^&*();:,<.>/?`|\_~-=]%'
	BEGIN
		PRINT N'Tên giáo viên không chứa số hay các ký tự đặc biệt'
		RETURN
    END
	
	-- check email is valid
	IF @Email NOT LIKE '%_@__%.__%'
	BEGIN
		PRINT N'Email không hợp lệ'
		RETURN
	END

	-- check gender is valid
	IF @Gender NOT IN ('M', 'F')
	BEGIN
		PRINT N'Giới tính phải là M (Nam) hoặc F (Nữ)'
		RETURN
	END

	-- check phone number is valid
	IF ISNUMERIC(@Phonenumber) = 0 OR CAST (@Phonenumber AS INT) <= 0
	BEGIN
		PRINT N'Số điện thoại không phải là 1 số hợp lệ'
		RETURN
	END
	IF SUBSTRING(@Phonenumber, 2, 1) NOT LIKE '[1-9]'
	BEGIN
		PRINT N'Ký tự thứ 2 của số điện thoại phải khác 0'
		RETURN		
	END
	IF LEN(@Phonenumber) NOT IN (10, 11)
	BEGIN
		PRINT N'Độ dài số điện thoại phải là 10 hoặc 11'
		RETURN
    END

	-- check card id is valid
	IF ISNUMERIC(@CardId) = 0 OR CAST (@CardId AS INT) <= 0
	BEGIN
		PRINT N'Số CMND không phải là 1 số hợp lệ'
		RETURN
	END
	IF LEN(@CardId) NOT IN (9, 12)
	BEGIN
		PRINT N'Độ dài số CMND phải là 9 hoặc 12'
		RETURN
    END

	-- check age of teacher
	IF YEAR(GETDATE()) - YEAR(@Birthdate) < 22
	BEGIN
		PRINT N'Số tuổi của giáo viên phải không nhỏ hơn 22 tuổi'
		RETURN
    END
	ELSE IF YEAR(GETDATE()) - YEAR(@Birthdate) > 60
	BEGIN
		PRINT N'Giáo viên này đã nghỉ hưu'
		RETURN
    END

	UPDATE dbo.Teacher
	SET Fullname = @Fullname,
		Gender = @Gender,
		Address = @Address,
		Email = @Email,
		Phonenumber = @Phonenumber,
		Birthdate = @Birthdate,
		Identitycardnumber = @CardId,
		Group_id = @Group_id
	WHERE Id = @Id
END

GO

CREATE PROC delete_teacher
	@Id CHAR(9)
AS
BEGIN
	DECLARE @count INT
	SELECT @count = COUNT(*)
	FROM dbo.Teacher
	WHERE Id = @Id

	IF NOT EXISTS
	(
		SELECT *
		FROM dbo.Teacher
		WHERE Id = @Id
	)
	BEGIN
		PRINT N'Giáo viên có mã số ' + @Id + N' không tồn tại'
		RETURN
    END
	DELETE dbo.Teacher_degrees
	WHERE Id = @Id
	
	
	DELETE dbo.Teacher_scores
	WHERE Id_assessor = @Id OR Id_judged = @Id

	UPDATE dbo.Class
	SET Id_form_teacher = NULL
	WHERE Id_form_teacher = @Id

	DELETE dbo.GroupLeader
	WHERE Id_leader = @Id

	DELETE dbo.Teacher_Subject
	WHERE Id_teacher = @Id

	DELETE dbo.Scheduler
	WHERE Id_teacher = @Id

	DELETE dbo.ContractTeacher
	WHERE Id = @Id

	DELETE dbo.PayrollTeacher
	WHERE Id = @Id

	DELETE dbo.Teacher
	WHERE Id = @Id
	
	DELETE dbo.[User]
	WHERE Id = @Id
END

EXEC dbo.insert_teacher @Id = '01423',                  -- varchar(9)
                        @Fullname = N'123',           -- nvarchar(50)
                        @Gender = '',              -- char(1)
                        @Email = '',               -- varchar(20)
                        @Address = N'',            -- nvarchar(100)
                        @Phonenumber = '',         -- char(11)
                        @CardId = '',              -- varchar(12)
                        @Birthdate = '2020-07-08', -- date
                        @Group_id = 1             -- int
SELECT * FROM dbo.Teacher