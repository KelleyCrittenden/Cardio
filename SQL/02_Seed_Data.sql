USE [Cardio]; 

GO 


set identity_insert [Reaction] on 

insert into Reaction (Id, Reaction) VALUES (1, 'Like');

insert into Reaction (Id, Reaction) VALUES (2, 'Dislike'); 

set identity_insert [Reaction] off 

 
set identity_insert [UserProfile] on 

insert into UserProfile (Id, FirebaseUserId, Username, Email, ImageLocation, IsDeleted) VALUES (1, 'Wz3YwroL1RdLCQJZ4hkf5necNvh1', 'Kelley1983', 'kelley@gmail.com', 'https://res.cloudinary.com/kelleycrittenden/image/upload/v1604541382/Tails_of_Joy/m0f29ukq4swkva22gme7.jpg', 0); 

 
insert into UserProfile (Id, FirebaseUserId, Username, Email, ImageLocation, IsDeleted) VALUES (2, 'lzchf6wkX4VoSkZYGovVRICLpNC2', 'Jeff1980', 'jeff@gmail.com', 'https://res.cloudinary.com/kelleycrittenden/image/upload/v1604518579/Tails_of_Joy/enios8ora8tprdrmn8ax.jpg', 0); 

 
insert into UserProfile (Id, FirebaseUserId, Username, Email, ImageLocation, IsDeleted) VALUES (3, 'EsaRLfTKwVVvSvUrobeI6KDgkJ23', 'Aralyn2006', 'aralyn@gmail.com', 'https://res.cloudinary.com/kelleycrittenden/image/upload/v1604518795/Tails_of_Joy/ujzdwl7iuqoaqxw2nqsp.jpg', 0); 

 
insert into UserProfile (Id, FirebaseUserId, Username, Email, ImageLocation, IsDeleted) VALUES (4, '48D0CvRAaXf1adHzcZURBLz2MSv2', 'Harper2009', 'harper@gmail.com', 'https://res.cloudinary.com/kelleycrittenden/image/upload/v1604518937/Tails_of_Joy/zt9innu0glgba2fbtxzr.jpg', 0); 

 
set identity_insert [UserProfile] off 

set identity_insert [Card] on

insert into Card (Id, ListId, UserId, Title, Description, Sequence, Archived, DateCreated, DueDate, DateModified, IsDeleted) VALUES (1, 1, 1, 'New Banner', 'Need New Banner for Food Truck', 1, 0, 2021-01-17, 2021-2-30, 2021-01-19, 0);

insert into Card (Id, ListId, UserId, Title, Description, Sequence, Archived, DateCreated, DueDate, DateModified, IsDeleted) VALUES (2, 1, 1,  'Need New Food Truck', 'Need bigger food truck for new location', 2, 0, 2021-01-17, 2021-2-30, 2021-01-19, 0);

insert into Card (Id, ListId, UserId, Title, Description, Sequence, Archived, DateCreated, DueDate, DateModified, IsDeleted) VALUES (3, 1, 2, 'Need More Cooks', 'Need More Cooks for Newer, Bigger Food Truck', 1, 0, 2021-01-17, 2021-2-30, 2021-01-19, 0);

insert into Card (Id, ListId, UserId, Title, Description, Sequence, Archived, DateCreated, DueDate, DateModified, IsDeleted) VALUES (4, 2, 2, 'Pay Raise?', 'Need to think about pay raise for current employees', 1, 0, 2021-01-17, 2021-2-30, 2021-01-19, 0);

set identity_insert [Card] off

 
set identity_insert [Comment] on 

insert into Comment (Id, UserId, CardId, Content, DateCreated, DateModified, IsDeleted) VALUES (1, 1, 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-05-19', '2020-05-19', 0); 

insert into Comment (Id, UserId, CardId, Content, DateCreated, DateModified, IsDeleted) VALUES  (2, 1, 3, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-05-19', '2020-05-21', 0); 

insert into Comment (Id, UserId, CardId, Content, DateCreated, DateModified, IsDeleted) VALUES  (3, 2, 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-05-19', '2020-05-31', 0); 

 insert into Comment (Id, UserId, CardId, Content, DateCreated, DateModified, IsDeleted) VALUES  (4, 3, 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-05-15', '2020-05-30', 0); 

 set identity_insert [Comment] off 


set identity_insert [Label] on 

insert into Label (Id, LabelName, IsDeleted) VALUES  (1, 'Working On it', 0);

insert into Label (Id, LabelName, IsDeleted) VALUES (2, 'Almost Done', 0); 

insert into Label (Id, LabelName, IsDeleted) VALUES (3, 'Needs Work', 0);

insert into Label (Id, LabelName, IsDeleted) VALUES (4, 'Put on Back Burner', 0);

set identity_insert [Label] off 





set identity_insert [List] on

insert into List (Id, Title, Position, BoardId, UserId, Archived, IsDeleted) VALUES (1, 'To Do', 1, 1, 1, 0, 0);

insert into List (Id, Title, Position, BoardId, UserId, Archived, IsDeleted) VALUES (2, 'In Process', 2, 1, 1, 0, 0);

insert into List (Id, Title, Position, BoardId, UserId, Archived, IsDeleted) VALUES (3, 'Needs Checking', 3, 1, 1, 0, 0);

insert into List (Id, Title, Position, BoardId, UserId, Archived, IsDeleted) VALUES (4, 'Completed', 4, 1, 1, 0, 0);

set identity_insert [List] off


set identity_insert [Board] on

insert into Board (Id, Title, Background, UserId, Starred, Archived, IsDeleted) VALUES (1, 'Test Board One', 'www.cloudinary.com', 1, 1, 0, 0);

insert into Board (Id, Title, Background, UserId, Starred, Archived, IsDeleted) VALUES (2, 'Test Board Two', 'www.cloudinary.com', 1, 0, 0, 0);

set identity_insert [Board] off


set identity_insert [CommentReaction] on

insert into CommentReaction (Id, CommentId, ReactionId, UserId) VALUES (1, 1, 1, 1);

insert into CommentReaction (Id, CommentId, ReactionId, UserId) VALUES (2, 1, 2, 2);

insert into CommentReaction (Id, CommentId, ReactionId, UserId) VALUES (3, 2, 1, 3);

set identity_insert [CommentReaction] off


set identity_insert [CardLabel] on 

insert into CardLabel (Id, LabelId, CardId) VALUES (1, 1, 1);

insert into CardLabel (Id, LabelId, CardId) VALUES (2, 2, 1);

insert into CardLabel (Id, LabelId, CardId) VALUES (3, 3, 2);

insert into CardLabel (Id, LabelId, CardId) VALUES (4, 1, 2);
 
set identity_insert [CardLabel] off 


set identity_insert [BoardMember] on 

insert into BoardMember (Id, BoardId, UserId) VALUES (1, 1, 2); 

insert into BoardMember (Id, BoardId, UserId) VALUES (2, 1, 3); 

set identity_insert [BoardMember] off 
