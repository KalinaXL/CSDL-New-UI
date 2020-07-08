CREATE FUNCTION FN_COUNT_TC
(@id_group INT, @gender CHAR(1), @age INT)
RETURNS INT
AS BEGIN
	IF @gender NOT IN ('F', 'M')
	BEGIN
		RETURN -1
	END
	IF NOT EXISTS
	(
		SELECT *
		FROM dbo.[Group]
		WHERE Id = @id_group
	)
	BEGIN
		RETURN -1
	END

	IF @age < 22
	BEGIN
		RETURN -1
	END

	DECLARE cursorTeacher CURSOR FOR
	SELECT Group_id, Gender, YEAR(GETDATE()) - YEAR(Birthdate) 
	FROM Teacher

	DECLARE @id_gr CHAR(9), @gender_tc CHAR(1), @age_tc INT
	DECLARE @count INT = 0

	OPEN cursorTeacher

	FETCH NEXT FROM cursorTeacher
	INTO @id_gr, @gender_tc, @age_tc
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @id_gr = @id_group AND @gender = @gender_tc AND @age_tc >= @age
			SET @count = @count + 1
		FETCH NEXT FROM cursorTeacher
		INTO @id_gr, @gender_tc, @age_tc
    END

	CLOSE cursorTeacher
	DEALLOCATE cursorTeacher

	DECLARE @count_checker INT
	SELECT @count_checker = COUNT(*)
	FROM dbo.Teacher
	WHERE Group_id = @id_group AND Gender = @gender_tc AND YEAR(GETDATE()) - YEAR(Birthdate) >= @age

	IF @count <> @count_checker
		RETURN -2

	RETURN @count
END


GO


CREATE FUNCTION FN_COUNT_DEPENDENTS
(@id_st VARCHAR(9))
RETURNS INT
AS BEGIN
	IF NOT EXISTS
	(
		SELECT *
		FROM dbo.Student
		WHERE Id = @id_st
	)
	BEGIN
		RETURN -1
	END

	DECLARE @Id_student INT, @count INT = 0, @count_check INT = 0

	DECLARE cursorSt CURSOR FOR
	SELECT Id_student
	FROM dbo.Dependents

	OPEN cursorSt

	FETCH NEXT FROM cursorSt
	INTO @Id_student
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @Id_student = @id_st
			SET @count = @count + 1
		FETCH NEXT FROM cursorSt
		INTO @Id_student
    END

	CLOSE cursorSt
	DEALLOCATE cursorSt

	DECLARE @count_checker INT
	SELECT @count_checker = COUNT(*)
	FROM dbo.Dependents
	WHERE Id_student = @id_st

	IF @count <> @count_checker
		RETURN -1

	RETURN @count
END
