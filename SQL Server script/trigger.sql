CREATE TRIGGER TG_Teacher
ON dbo.Teacher
FOR INSERT
AS 
BEGIN
	UPDATE dbo.[Group]
	SET Num_teachers += T.number_tc
	FROM dbo.[Group]
	JOIN
	(
		SELECT Inserted.Group_id, COUNT(*) AS [number_tc]
		FROM Inserted
		GROUP BY Inserted.Group_id
	) AS T
	ON dbo.[Group].Id = T.Group_id
END

