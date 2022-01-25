IF DB_ID('OnlineShopDB') IS NOT NULL
BEGIN
	USE master
	DROP DATABASE [OnlineShopDB]
END

GO
CREATE DATABASE [OnlineShopDB]

GO
USE [OnlineShopDB]
GO

CREATE TABLE [dbo].[Account]
(
	AccountID	int				IDENTITY(1,1),
	Username	varchar(255)	NOT NULL,
	[Password]	varchar(255)	NOT NULL,
	FName		varchar(255)	,
	LName		varchar(255)	,
	Gender		bit				,
	Email		varchar(50)		NOT NULL,
	PhoneNumber varchar(15)		NOT NULL,
	Avatar		varchar(255)	,
	[Role]		char(3)			NOT NULL,
	[Active]	bit				NOT NULL,
	CreatedDate datetime2		NOT NULL,

	CONSTRAINT PK_account_id PRIMARY KEY(AccountID)
)

CREATE TABLE [dbo].[Address]
(
	AccountId	int				,
	[Address]	varchar(255)	NOT NULL,
	
	CONSTRAINT FK_accinfor_id FOREIGN KEY(AccountId) REFERENCES Account(AccountID),
)

CREATE TABLE [dbo].[Category]
(
	CategoryID	int				IDENTITY(1,1),
	CategoryName varchar(255)	NOT NULL,

	CONSTRAINT PK_category_id PRIMARY KEY(CategoryID)
)

CREATE TABLE [dbo].[Product]
(
	ProductID	int				IDENTITY(1,1) ,
	CategoryId	int				,
	ProductName varchar(200)	NOT NULL,
	[Image]		varchar(255)	NOT NULL,	
	[Description] varchar(max)	NOT NULL,
	CreatedDate datetime2		NOT NULL,

	CONSTRAINT PK_product_id PRIMARY KEY(ProductID),
	CONSTRAINT FK_category_id FOREIGN KEY(CategoryId) REFERENCES Category(CategoryID),
)

CREATE TABLE [dbo].[ProductDetail]
(
	ProductId	int				,
	Size		int				NOT NULL,
	Color		varchar(255)	NOT NULL,
	Quantity	int				NOT NULL,
	Price		money			NOT NULL,

	CONSTRAINT FK_product_id FOREIGN KEY(ProductId) REFERENCES Product(ProductID)
)

CREATE TABLE [dbo].[Review]
(
	ReviewID	int				IDENTITY(1,1),
	ProductId	int				,
	AccountId	int				,
	Content		varchar(255)	,
	Ratings		int				NOT NULL,
	CONSTRAINT CHK_Ratings CHECK (Ratings > 0 AND Ratings <= 5),
	CreatedDate datetime2		NOT NULL,

	CONSTRAINT PK_review_id PRIMARY KEY(ReviewID),
	CONSTRAINT FK_product_id_1 FOREIGN KEY(ProductId) REFERENCES Product(ProductID),
	CONSTRAINT FK_account_id_1 FOREIGN KEY(AccountId) REFERENCES Account(AccountID)
)

CREATE TABLE [dbo].[OrderStatus]
(
	[ID]		int				IDENTITY(1,1),
	[Description] varchar(255)	NOT NULL,

	CONSTRAINT PK_orderstatus_id PRIMARY KEY(ID)
)

CREATE TABLE [dbo].[Order]
(
	OrderID		int				IDENTITY(1,1),
	AccountId	int				,
	OrderDate	datetime2		NOT NULL,
	EstimateDelivery datetime2	NOT NULL,
	Total		money			NOT NULL,
	StatusId	int				,

	CONSTRAINT PK_order_id PRIMARY KEY(OrderID),
	CONSTRAINT FK_account_id FOREIGN KEY(AccountId) REFERENCES Account(AccountID),
	CONSTRAINT FK_status_id FOREIGN KEY(StatusId) REFERENCES OrderStatus(ID)
)

CREATE TABLE [dbo].[OrderDetail]
(
	OrderId		int				,
	ProductId	int				,
	Quantity	int				NOT NULL,
	
	CONSTRAINT FK_order_id FOREIGN KEY(OrderId) REFERENCES [Order](OrderID),
	CONSTRAINT FK_product_id_2 FOREIGN KEY(ProductId) REFERENCES Product(ProductID)
)

CREATE TABLE [dbo].[Post]
(
	PostID		int				IDENTITY(1,1),
	AuthorId	int				,
	Title		varchar(255)	NOT NULL,
	Content		varchar(max)	NOT NULL,
	CreatedDate datetime2		NOT NULL,

	CONSTRAINT PK_post_id PRIMARY KEY(PostID),
	CONSTRAINT FK_account_id_2 FOREIGN KEY(AuthorId) REFERENCES Account(AccountID),
)

CREATE TABLE [dbo].[PostComment]
(
	PostCommentID int			IDENTITY(1,1),
	PostId		int				,
	AccountId	int				,
	Comment		varchar(255)	NOT NULL,
	CreatedDate datetime2		NOT NULL,

	CONSTRAINT PK_postcomment_id PRIMARY KEY(PostCommentID),
	CONSTRAINT FK_account_id_3 FOREIGN KEY(AccountId) REFERENCES Account(AccountID),
	CONSTRAINT FK_post_id FOREIGN KEY(PostId) REFERENCES Post(PostID),
)

CREATE TABLE [dbo].[Tag]
(
	TagID		int				IDENTITY(1,1),
	TagName		varchar(50)		NOT NULL,

	CONSTRAINT PK_tag_id PRIMARY KEY(TagID)
)

CREATE TABLE [dbo].[PostTag]
(
	PostId		int				,
	TagId		int				,

	CONSTRAINT PK_posttag_id PRIMARY KEY(PostId, TagId),
	CONSTRAINT FK_post_id_1 FOREIGN KEY(PostId) REFERENCES Post(PostID),
	CONSTRAINT FK_tag_id FOREIGN KEY(TagId) REFERENCES Tag(TagID)
)
GO
INSERT [dbo].[Account] ([Username], [Password], [FName], [LName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'admin', N'admin', NULL, NULL, NULL, N'admin@gmail.com', N'0111111111', NULL, N'1  ', 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FName], [LName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang123', N'khang123', NULL, NULL, NULL, N'khang@gmail.com', N'0123456789', NULL, N'0  ', 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Address] ([AccountId], [Address]) VALUES (1, N'Hanoi')
INSERT [dbo].[Address] ([AccountId], [Address]) VALUES (1, N'Hung Yen')
GO
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Men')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Women')
GO
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate]) VALUES (1, N'Men Hat', N'men2.jpg', N'good quality', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate]) VALUES (2, N'Hanes Women''s EcoSmart Crewneck Sweatshirt', N'anh2.jpg', N'cheap', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[ProductDetail] ([ProductId], [Size], [Color], [Quantity], [Price]) VALUES (2, 36, N'Green', 10, 11.0000)
INSERT [dbo].[ProductDetail] ([ProductId], [Size], [Color], [Quantity], [Price]) VALUES (2, 35, N'Red', 5, 12.0000)
GO
INSERT [dbo].[OrderStatus] ([Description]) VALUES (N'Pending')
INSERT [dbo].[OrderStatus] ([Description]) VALUES (N'Completed')
GO
INSERT [dbo].[Order] ([AccountId], [OrderDate], [EstimateDelivery], [Total], [StatusId]) VALUES (2, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-02T00:00:00.0000000' AS DateTime2), 24.0000, 1)

GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity]) VALUES (1, 2, 2)
GO

INSERT [dbo].[Post] ([AuthorId], [Title], [Content], [CreatedDate]) VALUES (1, N'The best fashion influencers to follow for sartorial inspiration', N'From our favourite UK influencers to the best missives from Milan and the coolest New Yorkers, read on some of the best fashion blogs out there, and for even more inspiration, do head to our separate black fashion influencer round-up.

Fancy some shopping deals? Check out these amazing sales: Zara Black Friday, ASOS Black Friday, Missoma Black Friday and Gucci Black Friday.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Post] ([AuthorId], [Title], [Content], [CreatedDate]) VALUES (1, N'THE HOLIDAY HOSTING HACK I LIVE BY', N'If there’s one holiday hosting hack that I live by, it’s to have your food (and drink!) double as decorations. Nothing brings more ambience to a holiday party than an on-theme spread of food and drinks and it might be easier than you think. From charcuterie boards laid out in wreaths to festive-shaped desserts, or festive drinks bring the holiday spirit to your table spread for your holiday gatherings.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))

GO
INSERT [dbo].[PostComment] ([PostId], [AccountId], [Comment], [CreatedDate]) VALUES (1, 2, N'good', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[PostComment] ([PostId], [AccountId], [Comment], [CreatedDate]) VALUES (1, 1, N'ok', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Tag] ([TagName]) VALUES (N'Share')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'blog')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'name')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'wine')
GO
INSERT [dbo].[PostTag] ([PostId], [TagId]) VALUES (1, 1)
INSERT [dbo].[PostTag] ([PostId], [TagId]) VALUES (1, 2)
INSERT [dbo].[PostTag] ([PostId], [TagId]) VALUES (2, 4)