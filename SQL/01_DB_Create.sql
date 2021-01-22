USE [master]

IF db_id('Cardio') IS NULL
  CREATE DATABASE [Cardio]
GO

USE [Cardio]
GO


DROP TABLE IF EXISTS [UserProfile];
DROP TABLE IF EXISTS [Board];
DROP TABLE IF EXISTS [List];
DROP TABLE IF EXISTS [Card];
DROP TABLE IF EXISTS [Label];
DROP TABLE IF EXISTS [Comment];
DROP TABLE IF EXISTS [Reaction];
DROP TABLE IF EXISTS [CommentReaction];
DROP TABLE IF EXISTS [BoardMember];
DROP TABLE IF EXISTS [CardLabel];

GO

CREATE TABLE [UserProfile] (
 [Id] integer PRIMARY KEY IDENTITY,
 [FirebaseUserId] varchar(28) NOT NULL,
 [Username] varchar(20) NOT NULL,
 [Email] varchar(555) NOT NULL,
 [ImageLocation] varchar(255) NOT NULL,
 [IsDeleted] bit NOT NULL DEFAULT 0,

 CONSTRAINT UQ_FirebaseUserId UNIQUE(FirebaseUserId)
)

CREATE TABLE [Board] (
  [Id] integer PRIMARY KEY IDENTITY,
  [Title] varchar(55) NOT NULL,
  [Background] varchar(55) NOT NULL,
  [UserId] integer NOT NULL,
  [Starred] bit NOT NULL DEFAULT 0,
  [Archived] bit NOT NULL DEFAULT 0,
  [IsDeleted] bit NOT NULL DEFAULT 0,

  CONSTRAINT [FK_Board_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
)



CREATE TABLE [List] (
 [Id] integer PRIMARY KEY IDENTITY,
 [Title] varchar(55) NOT NULL,
 [Position] integer NOT NULL,
 [BoardId] integer NOT NULL,
 [UserId] integer NOT NULL,
 [Archived] bit NOT NULL DEFAULT 0,
 [IsDeleted] bit NOT NULL DEFAULT 0,

  CONSTRAINT [FK_List_Board] FOREIGN KEY ([BoardId]) REFERENCES [Board] ([Id]),
  CONSTRAINT [FK_List_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
)

CREATE TABLE [Card] (
 [Id] integer PRIMARY KEY IDENTITY,
 [ListId] integer NOT NULL,
 [UserId] integer NOT NULL,
 [Title] varchar(55) NOT NULL,
 [Description] varchar(255) NOT NULL,
 [Sequence] integer NOT NULL,
 [Archived] bit NOT NULL DEFAULT 0,
 [DueDate] datetime NOT NULL,
 [DateModified] datetime NOT NULL,
 [DateCreated] datetime NOT NULL,
 [IsDeleted] bit NOT NULL DEFAULT 0,

  CONSTRAINT [FK_Card_List] FOREIGN KEY ([ListId]) REFERENCES [List] ([Id]),
  CONSTRAINT [FK_Card_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
)

CREATE TABLE [Label] (
  [Id] integer PRIMARY KEY IDENTITY,
  [LabelName] varchar(55) NOT NULL,
  [IsDeleted] bit NOT NULL DEFAULT 0,
)

CREATE TABLE [Comment] (
  [Id] integer PRIMARY KEY IDENTITY,
  [UserId] integer NOT NULL,
  [CardId] integer NOT NULL,
  [Content] varchar(255) NOT NULL,
  [DateCreated] datetime NOT NULL,
  [DateModified] datetime NOT NULL,
  IsDeleted bit NOT NULL DEFAULT 0,

  CONSTRAINT [FK_Comment_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id]),
  CONSTRAINT [FK_Comment_Card] FOREIGN KEY ([CardId]) REFERENCES [Card] ([Id])
)

CREATE TABLE [Reaction] (
  [Id] integer PRIMARY KEY IDENTITY,
  [Reaction] varchar(55) NOT NULL
)

CREATE TABLE [CommentReaction] (
  [Id] integer PRIMARY KEY IDENTITY,
  [CommentId] integer NOT NULL,
  [ReactionId] integer NOT NULL,
  [UserId] integer NOT NULL,

  CONSTRAINT [FK_CommentReaction_Comment] FOREIGN KEY ([CommentId]) REFERENCES [Comment] ([Id]),
  CONSTRAINT [FK_CommentReaction_Reaction] FOREIGN KEY ([ReactionId]) REFERENCES [Reaction] ([Id]),
  CONSTRAINT [FK_CommentReaction_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
)

CREATE TABLE [BoardMember] (
 [Id] integer PRIMARY KEY IDENTITY,
 [BoardId] integer NOT NULL,
 [UserId] integer NOT NULL,

  CONSTRAINT [FK_BoardMember_Board] FOREIGN KEY ([BoardId]) REFERENCES [Board] ([Id]),
  CONSTRAINT [FK_BoardMember_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile] ([Id])
)

CREATE TABLE [CardLabel] (
  [Id] integer PRIMARY KEY IDENTITY,
  [LabelId] integer NOT NULL,
  [CardId] integer NOT NULL
)

GO
