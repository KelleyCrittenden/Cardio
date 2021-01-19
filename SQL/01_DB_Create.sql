USE [master]

IF db_id('Cardio') IS NULL
  CREATE DATABASE [Cardio]
GO

USE [Cardio]
GO


DROP TABLE IF EXISTS [UserProfile];
DROP TABLE IF EXISTS [Boards];
DROP TABLE IF EXISTS [BoardMembers];
DROP TABLE IF EXISTS [List];
DROP TABLE IF EXISTS [Cards];
DROP TABLE IF EXISTS [Label];
DROP TABLE IF EXISTS [CardLabel];
DROP TABLE IF EXISTS [Comment];
DROP TABLE IF EXISTS [Reaction];
DROP TABLE IF EXISTS [CommentReaction];
GO

CREATE TABLE [UserProfile] (
  [Id] integer PRIMARY KEY,
  [FirebaseUserId] varchar(28) NOT NULL,
  [Username] varchar(20) NOT NULL,
  [Email] varchar(555) NOT NULL,
  [ImageLocation] varchar(255) NOT NULL
)
GO

CREATE TABLE [Boards] (
  [Id] integer PRIMARY KEY,
  [Name] varchar(55) NOT NULL,
  [Background] varchar(55) NOT NULL,
  [CreaterId] integer NOT NULL,
  [Starred] integer NOT NULL
)
GO

CREATE TABLE [BoardMembers] (
  [Id] integer PRIMARY KEY,
  [BoardId] integer NOT NULL,
  [UserId] integer NOT NULL
)
GO

CREATE TABLE [List] (
  [Id] integer PRIMARY KEY,
  [Title] varchar(55) NOT NULL,
  [Order] integer NOT NULL,
  [BoardId] integer NOT NULL,
  [UserId] integer NOT NULL,
  [Archived] integer NOT NULL
)
GO

CREATE TABLE [Card] (
  [Id] integer PRIMARY KEY,
  [ListId] integer NOT NULL,
  [Title] varchar(55) NOT NULL,
  [Description] varchar(255) NOT NULL,
  [Order] integer NOT NULL,
  [Archived] integer NOT NULL,
  [DueDate] datetime NOT NULL,
  [DateModified] datetime NOT NULL,
  [DateCreated] datetime NOT NULL
)
GO

CREATE TABLE [Label] (
  [Id] integer PRIMARY KEY,
  [LabelName] varchar(55) NOT NULL
)
GO

CREATE TABLE [CardLabel] (
  [Id] integer PRIMARY KEY,
  [LabelId] integer NOT NULL,
  [CardId] integer NOT NULL
)
GO

CREATE TABLE [Comment] (
  [Id] integer PRIMARY KEY,
  [UserId] integer NOT NULL,
  [CardId] integer NOT NULL,
  [Text] varchar(255) NOT NULL,
  [DateCreated] datetime NOT NULL,
  [DateModified] datetime NOT NULL
)
GO

CREATE TABLE [Reaction] (
  [Id] integer PRIMARY KEY,
  [Reaction] varchar(55) NOT NULL
)
GO

CREATE TABLE [CommentReaction] (
  [Id] integer PRIMARY KEY,
  [CommentId] integer NOT NULL,
  [ReactionId] integer NOT NULL,
  [UserId] integer NOT NULL
)
GO

ALTER TABLE [BoardMembers] ADD FOREIGN KEY ([BoardId]) REFERENCES [Boards] ([Id])
GO

ALTER TABLE [BoardMembers] ADD FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [Boards] ADD FOREIGN KEY ([CreaterId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [List] ADD FOREIGN KEY ([BoardId]) REFERENCES [Boards] ([Id])
GO

ALTER TABLE [List] ADD FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [CardLabel] ADD FOREIGN KEY ([LabelId]) REFERENCES [Label] ([Id])
GO

ALTER TABLE [CardLabel] ADD FOREIGN KEY ([CardId]) REFERENCES [Card] ([Id])
GO

ALTER TABLE [Card] ADD FOREIGN KEY ([ListId]) REFERENCES [List] ([Id])
GO

ALTER TABLE [Comment] ADD FOREIGN KEY ([CardId]) REFERENCES [Card] ([Id])
GO

ALTER TABLE [Comment] ADD FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [CommentReaction] ADD FOREIGN KEY ([CommentId]) REFERENCES [Comment] ([Id])
GO

ALTER TABLE [CommentReaction] ADD FOREIGN KEY ([ReactionId]) REFERENCES [Reaction] ([Id])
GO

ALTER TABLE [CommentReaction] ADD FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
GO
