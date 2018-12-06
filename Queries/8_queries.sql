USE Kodune;
GO

-- 1: 10 suurima reitinguga kasutajat

SELECT TOP 10
    UserID,
    TotalRating
FROM
    Kodune.dbo.Rating
ORDER BY Kodune.dbo.Rating.TotalRating DESC

-- 2: Suurima kommentaaride arvuga kasutaja ID, kasutajanimi, kommentaarid

SELECT
    UserID,
    Username,
    CommentText
FROM
	Kodune.dbo.Comment

INNER JOIN Kodune.dbo.[User]
ON Kodune.dbo.Comment.UserID = Kodune.dbo.[User].ID

WHERE 
	UserID = (
		SELECT TOP 1
			UserID
		FROM
			Kodune.dbo.Comment
		GROUP BY UserID
		ORDER BY COUNT(UserID) DESC
	)
    
-- 3: Keskmisest suurema reitinguga kasutajad, järjestatuna kasvavalt

SELECT
    UserID,
    Username,
    TotalRating
FROM
    Kodune.dbo.Rating
INNER JOIN Kodune.dbo.[User]
ON Kodune.dbo.Rating.UserID = Kodune.dbo.[User].ID
WHERE TotalRating > (
	SELECT
		DISTINCT(AVG(TotalRating) OVER())
		FROM Kodune.dbo.Rating
)
ORDER BY TotalRating ASC