USE [master]

IF db_id('Cardio') IS NULL
  CREATE DATABASE [Cardio]
GO

USE [Cardio]
GO


DROP TABLE IF EXISTS [UserProfile];
DROP TABLE IF EXISTS [Board];
DROP TABLE IF EXISTS [BoardMember];
DROP TABLE IF EXISTS [List];
DROP TABLE IF EXISTS [Card];
DROP TABLE IF EXISTS [Label];
DROP TABLE IF EXISTS [CardLabel];
DROP TABLE IF EXISTS [Comment];
DROP TABLE IF EXISTS [Reaction];
DROP TABLE IF EXISTS [CommentReaction];
GO

CREATE TABLE [UserProfile] (
 [Id] integer PRIMARY KEY IDENTITY,
  [FirebaseUserId] varchar(28) NOT NULL,
  [Username] varchar(20) NOT NULL,
  [Email] varchar(555) NOT NULL,
  [ImageLocation] varchar(255) NOT NULL,
  [IsDeleted] bit NOT NULL DEFAULT 0
)
GO

CREATE TABLE [Board] (
   [Id] integer PRIMARY KEY IDENTITY,
  [Title] varchar(55) NOT NULL,
  [Background] varchar(55) NOT NULL,
  [UserId] integer NOT NULL,
  [Starred] bit NOT NULL DEFAULT 0,
  [Archived] bit NOT NULL DEFAULT 0,
  [IsDeleted] bit NOT NULL DEFAULT 0

)
GO

CREATE TABLE [BoardMember] (
 [Id] integer PRIMARY KEY IDENTITY,
  [BoardId] integer NOT NULL,
  [UserId] integer NOT NULL
)
GO

CREATE TABLE [List] (
 [Id] integer PRIMARY KEY IDENTITY,
  [Title] varchar(55) NOT NULL,
  [Sequence] integer NOT NULL,
  [BoardId] integer NOT NULL,
  [UserId] integer NOT NULL,
  [Archived] bit NOT NULL DEFAULT 0,
  [IsDeleted] bit NOT NULL DEFAULT 0
)
GO

CREATE TABLE [Card] (
 [Id] integer PRIMARY KEY IDENTITY,
  [ListId] integer NOT NULL,
  [Title] varchar(55) NOT NULL,
  [Description] varchar(255) NOT NULL,
  [Sequence] integer NOT NULL,
  [Archived] bit NOT NULL DEFAULT 0,
  [DueDate] datetime NOT NULL,
  [DateModified] datetime NOT NULL,
  [DateCreated] datetime NOT NULL,
  [IsDeleted] bit NOT NULL DEFAULT 0
)
GO

CREATE TABLE [Label] (
  [Id] integer PRIMARY KEY IDENTITY,
  [LabelName] varchar(55) NOT NULL,
  [IsDeleted] bit NOT NULL DEFAULT 0
)
GO

CREATE TABLE [CardLabel] (
  [Id] integer PRIMARY KEY IDENTITY,
  [LabelId] integer NOT NULL,
  [CardId] integer NOT NULL
)
GO

CREATE TABLE [Comment] (
   [Id] integer PRIMARY KEY IDENTITY,
  [UserId] integer NOT NULL,
  [CardId] integer NOT NULL,
  [Text] varchar(255) NOT NULL,
  [DateCreated] datetime NOT NULL,
  [DateModified] datetime NOT NULL,
  IsDeleted bit NOT NULL DEFAULT 0
)
GO

CREATE TABLE [Reaction] (
   [Id] integer PRIMARY KEY IDENTITY,
  [Reaction] varchar(55) NOT NULL
)
GO

CREATE TABLE [CommentReaction] (
  [Id] integer PRIMARY KEY IDENTITY,
  [CommentId] integer NOT NULL,
  [ReactionId] integer NOT NULL,
  [UserId] integer NOT NULL
)
GO

ALTER TABLE [BoardMember] ADD FOREIGN KEY ([BoardId]) REFERENCES [Board] ([Id])
GO

ALTER TABLE [BoardMember] ADD FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [Board] ADD FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [List] ADD FOREIGN KEY ([BoardId]) REFERENCES [Board] ([Id])
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
