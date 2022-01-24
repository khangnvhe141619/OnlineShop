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
	CreatedDate timestamp		NOT NULL,

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
	CreatedDate timestamp		NOT NULL,

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
	CreatedDate timestamp		NOT NULL,

	CONSTRAINT PK_review_id PRIMARY KEY(ReviewID),
	CONSTRAINT FK_product_id_1 FOREIGN KEY(ProductId) REFERENCES Product(ProductID),
	CONSTRAINT FK_account_id_1 FOREIGN KEY(AccountId) REFERENCES Account(AccountID)
)

CREATE TABLE [dbo].[OrderStatus]
(
	[ID]		int				,
	[Description] varchar(255)	NOT NULL,

	CONSTRAINT PK_orderstatus_id PRIMARY KEY(ID)
)

CREATE TABLE [dbo].[Order]
(
	OrderID		int				IDENTITY(1,1),
	AccountId	int				,
	OrderDate	timestamp		NOT NULL,
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
	CreatedDate timestamp		NOT NULL,

	CONSTRAINT PK_post_id PRIMARY KEY(PostID),
	CONSTRAINT FK_account_id_2 FOREIGN KEY(AuthorId) REFERENCES Account(AccountID),
)

CREATE TABLE [dbo].[PostComment]
(
	PostCommentID int			IDENTITY(1,1),
	PostId		int				,
	AccountId	int				,
	Comment		varchar(255)	NOT NULL,
	CreatedDate timestamp		NOT NULL,

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