USE [master]
GO

CREATE DATABASE [Kodune]
GO

USE Kodune;
GO

CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[GenderID] [int] NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] nvarchar(250) NOT NULL

	CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	)
) 
GO

CREATE TABLE [dbo].[Post](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
    [Views] [int] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,

	CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	)
)
GO

CREATE TABLE [dbo].[Comment](
	[ID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,

	CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	)
)
GO

CREATE TABLE [dbo].[Rating](
	[UserID] [int] NOT NULL,
	[TotalRating] [int] NOT NULL
)
GO