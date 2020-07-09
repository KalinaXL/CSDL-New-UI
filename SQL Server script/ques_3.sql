CREATE OR ALTER PROC SP_GET_GROUP_WITH_NUMBER @count INT, @gender CHAR(1), @ColumnName VARCHAR(20)
AS
BEGIN
	SELECT [Group].Id AS [Ma_to], [Group].Name AS [Ten_to], COUNT(*) AS [So_luong_giao_vien]
	FROM [Group]
	JOIN [Teacher]
	ON Teacher.Group_id = [Group].Id
	WHERE Teacher.Gender = @gender
	GROUP BY [Group].Id, [Group].Name
	HAVING COUNT(*) > @count
	ORDER BY 
	CASE WHEN @ColumnName='ma_to' THEN [Group].Id
    --    WHEN @ColumnName='ten_to' THEN [Group].Name
       WHEN @ColumnName='so_luong_giao_vien' THEN COUNT(*)
  	END
END
GO
CREATE OR ALTER PROC SP_GET_CLASS @id_year CHAR(10)
AS
BEGIN
	SELECT Class.Id AS class_id, Class.name AS class_name, Teacher.Id AS teacher_id, Teacher.Fullname AS teacher_name, COUNT(*) AS [Number_of_students]
	FROM
	(
		(
			(
				Class
				JOIN [Year]
				ON [Year].Id = Class.Id_Year
			)
			JOIN Join_Class
			ON Join_Class.Id_class = Class.Id
		)
		JOIN Student
		ON Student.Id = Join_Class.Id_student
	)
	JOIN dbo.Teacher
	ON Teacher.Id = Class.Id_form_teacher
	WHERE [Year].Id = @id_year
	GROUP BY Class.Id, Class.name, Teacher.Id, Teacher.Fullname
	ORDER BY COUNT(*) DESC
END
