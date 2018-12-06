USE Kodune;
GO

ALTER TABLE [dbo].[Post] ADD CONSTRAINT [DF_Post_CreationTime] DEFAULT (SYSDATETIME()) FOR [CreationTime]
GO

ALTER TABLE [dbo].[Comment] ADD CONSTRAINT [DF_Comment_CreationTime] DEFAULT (SYSDATETIME()) FOR [CreationTime]
GO


ALTER TABLE [dbo].[Post] WITH CHECK ADD CONSTRAINT [FK_Post_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO


ALTER TABLE [dbo].[Comment] WITH CHECK ADD CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO

ALTER TABLE [dbo].[Comment] WITH CHECK ADD CONSTRAINT [FK_Comment_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO


ALTER TABLE [dbo].[Rating] WITH CHECK ADD CONSTRAINT [FK_Rating_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO