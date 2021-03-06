USE Kodune;
GO

CREATE SEQUENCE dbo.UserSequence AS Int
    START WITH 1
    INCREMENT BY 1
;

CREATE SEQUENCE dbo.PostSequence AS Int
    START WITH 1
    INCREMENT BY 1
;

CREATE SEQUENCE dbo.CommentSequence AS Int
    START WITH 1
    INCREMENT BY 1
;
GO

ALTER TABLE dbo.[User] ADD CONSTRAINT [DF_User_ID] DEFAULT (NEXT VALUE FOR UserSequence) FOR [ID]
ALTER TABLE dbo.Post ADD CONSTRAINT [DF_Post_ID] DEFAULT (NEXT VALUE FOR PostSequence) FOR [ID]
ALTER TABLE dbo.Comment ADD CONSTRAINT [DF_Comment_ID] DEFAULT (NEXT VALUE FOR CommentSequence) FOR [ID]
GO