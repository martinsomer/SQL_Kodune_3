USE Kodune;
GO

-- 1

CREATE NONCLUSTERED INDEX IDX_Rating_UserID_TotalRating
    ON dbo.Rating (UserID)
    INCLUDE (TotalRating)

-- 2

CREATE NONCLUSTERED INDEX
    IDX_Comment_UserID_incl_CommentText
	ON dbo.Comment (UserID)
	INCLUDE (CommentText)

-- 3

CREATE NONCLUSTERED INDEX IDX_User_ID
    ON dbo.[User] (ID)