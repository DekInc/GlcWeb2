BEGIN
DECLARE @MaxTransaccionId INT;
SELECT @MaxTransaccionId = ISNULL(MAX(a.Id), 0) + 1 FROM EdiDb.dbo.EdiRepSent a
SELECT @MaxTransaccionId, 'IN' + RIGHT('00000'+ CONVERT(VARCHAR(64), @MaxTransaccionId), 5)
END

SELECT CONVERT(DATETIME, '13/05/2019', 103)

--SELECT RIGHT('0000'+ CONVERT(VARCHAR(64), 2), 4);