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
CREATE TABLE [dbo].[Department]
(
	DepartmentID		int				IDENTITY(1,1),
	DepartmentName		nvarchar(255)	NOT NULL,
	DepartmentDesc		nvarchar(255)	,

	CONSTRAINT PK_department_id PRIMARY KEY(DepartmentID)
)
CREATE TABLE [dbo].[Account]
(
	AccountID			int				IDENTITY(1,1),
	Username			varchar(255)	NOT NULL,
	[Password]			varchar(255)	NOT NULL,
	FName				nvarchar(255)	,
	LName				nvarchar(255)	,
	Gender				bit				,
	Email				varchar(50)		,
	PhoneNumber			varchar(15)		,
	Avatar				varchar(255)	,
	[Role]				int				NOT NULL,
	[Active]			bit				NOT NULL,
	CreatedDate			datetime2		,

	CONSTRAINT PK_account_id PRIMARY KEY(AccountID),
	CONSTRAINT FK_role FOREIGN KEY([Role]) REFERENCES Department(DepartmentID),
)

CREATE TABLE [dbo].[Address]
(
	AccountId			int				,
	[Address]			varchar(255)	NOT NULL,
	
	CONSTRAINT FK_account_id_1 FOREIGN KEY(AccountId) REFERENCES Account(AccountID),
)

CREATE TABLE [dbo].[Category]
(
	CategoryID			int				IDENTITY(1,1),
	CategoryName		nvarchar(255)	NOT NULL,

	CONSTRAINT PK_category_id PRIMARY KEY(CategoryID)
)

CREATE TABLE [dbo].[BookCover]
(
	BookCoverID			int				IDENTITY(1,1),
	BookCoverName		nvarchar(255)	NOT NULL,

	CONSTRAINT PK_bookcover_id PRIMARY KEY(BookCoverID)
)

CREATE TABLE [dbo].[Product]
(
	ProductID			int				IDENTITY(1,1) ,
	CategoryId			int				,
	ProductName			nvarchar(200)	NOT NULL,
	[Image]				varchar(255)	NOT NULL,	
	[Description]		nvarchar(max)	NOT NULL,
	CreatedDate			datetime2		,
	IssuingCompany		nvarchar(255)	NOT NULL,
	PublicationDate		datetime2		NOT NULL,
	CoverTypeId			int				NOT NULL,
	PublishingCompany	nvarchar(255)	,
	Quantity			int				NOT NULL,
	Price				float			NOT NULL,
	NumberPage			int				NOT NULL,

	CONSTRAINT PK_product_id PRIMARY KEY(ProductID),
	CONSTRAINT FK_category_id FOREIGN KEY(CategoryId) REFERENCES Category(CategoryID),
	CONSTRAINT FK_covertype_id FOREIGN KEY(CoverTypeId) REFERENCES BookCover(BookCoverID)
)

CREATE TABLE [dbo].[Coupon]
(
	CouponID			varchar(10)		,
	CouponDesc			nvarchar(255)	,
	DiscountPercent		decimal			NOT NULL,
	Quantity			int				NOT NULL,

	CONSTRAINT PK_discount_id PRIMARY KEY(CouponID),
)

CREATE TABLE [dbo].[Offer]
(
	ProductId			int				,
	CouponId			varchar(10)		,

	CONSTRAINT FK_product_id_0 FOREIGN KEY(ProductId) REFERENCES Product(ProductID),
	CONSTRAINT FK_discount_id FOREIGN KEY(CouponId) REFERENCES Coupon(CouponID)
)

CREATE TABLE [dbo].[WishList]
(
	AccountId			int				NOT NULL,
	ProductId			int				NOT NULL,

	CONSTRAINT PK_account_id_1 FOREIGN KEY(AccountId) REFERENCES Account(AccountID),
	CONSTRAINT FK_product_id_1 FOREIGN KEY(ProductId) REFERENCES Product(ProductID)
)

CREATE TABLE [dbo].[Review]
(
	ReviewID			int				IDENTITY(1,1),
	ProductId			int				,
	AccountId			int				,
	Content				nvarchar(255)	,
	Ratings				int				NOT NULL,
	CONSTRAINT CHK_Ratings CHECK (Ratings > 0 AND Ratings <= 5),
	CreatedDate datetime2				,

	CONSTRAINT PK_review_id PRIMARY KEY(ReviewID),
	CONSTRAINT FK_product_id_2 FOREIGN KEY(ProductId) REFERENCES Product(ProductID),
	CONSTRAINT FK_account_id_2 FOREIGN KEY(AccountId) REFERENCES Account(AccountID)
)

CREATE TABLE [dbo].[OrderStatus]
(
	[ID]				int				IDENTITY(1,1),
	[Description]		nvarchar(255)	NOT NULL,

	CONSTRAINT PK_orderstatus_id PRIMARY KEY(ID)
)

CREATE TABLE [dbo].[Shipper]
(
	ShipperID			int				IDENTITY(1,1),
	ShipperName			nvarchar(255)	NOT NULL,
	Email				varchar(255)	NOT NULL,
	Phone				varchar(15)		NOT NULL

	CONSTRAINT PK_shipper_id PRIMARY KEY(ShipperID),
	CONSTRAINT UNI_email_phone_Shipper UNIQUE(Email, Phone)
)

CREATE TABLE [dbo].[Order]
(
	OrderID				int				IDENTITY(1,1),
	ShipperId			int				,
	AccountId			int				,
	OrderDate			datetime2		NOT NULL,
	EstimateDelivery	datetime2		NOT NULL,
	Total				money			NOT NULL,
	StatusId			int				,

	CONSTRAINT PK_order_id PRIMARY KEY(OrderID),
	CONSTRAINT FK_shipper_id FOREIGN KEY(ShipperId) REFERENCES Shipper(ShipperID),
	CONSTRAINT FK_account_id_3 FOREIGN KEY(AccountId) REFERENCES Account(AccountID),
	CONSTRAINT FK_status_id FOREIGN KEY(StatusId) REFERENCES OrderStatus(ID)
)

CREATE TABLE [dbo].[OrderDetail]
(
	OrderId				int				,
	ProductId			int				,
	Quantity			int				NOT NULL,
	
	CONSTRAINT FK_order_id FOREIGN KEY(OrderId) REFERENCES [Order](OrderID),
	CONSTRAINT FK_product_id_3 FOREIGN KEY(ProductId) REFERENCES Product(ProductID)
)

CREATE TABLE [dbo].[Post]
(
	PostID				int				IDENTITY(1,1),
	AuthorId			int				,
	Title				nvarchar(255)	NOT NULL,
	ShortDesc			nvarchar(max)	NOT NULL,
	Content				nvarchar(max)	NOT NULL,
	CreatedDate			datetime2		,

	CONSTRAINT PK_post_id PRIMARY KEY(PostID),
	CONSTRAINT FK_account_id_4 FOREIGN KEY(AuthorId) REFERENCES Account(AccountID),
)

CREATE TABLE [dbo].[PostComment]
(
	PostCommentID		int			IDENTITY(1,1),
	PostId				int				,
	AccountId			int				,
	Comment				nvarchar(255)	NOT NULL,
	CreatedDate			datetime2		,

	CONSTRAINT PK_postcomment_id PRIMARY KEY(PostCommentID),
	CONSTRAINT FK_account_id_5 FOREIGN KEY(AccountId) REFERENCES Account(AccountID),
	CONSTRAINT FK_post_id FOREIGN KEY(PostId) REFERENCES Post(PostID),
)

CREATE TABLE [dbo].[Tag]
(
	TagID				int				IDENTITY(1,1),
	TagName				varchar(50)		NOT NULL,

	CONSTRAINT PK_tag_id PRIMARY KEY(TagID)
)

CREATE TABLE [dbo].[PostTag]
(
	PostId				int				,
	TagId				int				,

	CONSTRAINT PK_posttag_id PRIMARY KEY(PostId, TagId),
	CONSTRAINT FK_post_id_1 FOREIGN KEY(PostId) REFERENCES Post(PostID),
	CONSTRAINT FK_tag_id FOREIGN KEY(TagId) REFERENCES Tag(TagID)
)

CREATE TABLE [dbo].[Contact]
(
	Email				varchar(255)	NOT NULL,
	Phone				varchar(30)		NOT NULL,
	[Address]			varchar(255)	NOT NULL,

)

CREATE TABLE [dbo].[Subcribe]
(
	Email				varchar(255)	,
	SubcribeDate		datetime2		NOT NULL

	CONSTRAINT PK_email_s PRIMARY KEY(Email)
)

GO
INSERT [dbo].[Department] ([DepartmentName], [DepartmentDesc]) VALUES ('Admin', '')
INSERT [dbo].[Department] ([DepartmentName], [DepartmentDesc]) VALUES ('Customer', '')
GO
INSERT [dbo].[Account] ([Username], [Password], [FName], [LName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'admin', N'admin', NULL, NULL, NULL, N'hotroswp@gmail.com', N'0111111111', NULL, 1 , 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FName], [LName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang123', N'khang123', NULL, NULL, NULL, N'khacongkenh@gmail.com', N'0123456789', NULL, 2, 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Address] ([AccountId], [Address]) VALUES (1, N'Hanoi')
INSERT [dbo].[Address] ([AccountId], [Address]) VALUES (1, N'Hung Yen')
GO
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Literature')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Economic Book')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Dictionary')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Education-Teaching')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Chilren Book')
GO
INSERT [dbo].[BookCover] ([BookCoverName]) VALUES (N'Hardcover')
INSERT [dbo].[BookCover] ([BookCoverName]) VALUES (N'Paperback')
GO
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Cây Cam Ngọt Của Tôi', N'camngot.jpg', N'good quality', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Nhã Nam', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Nhà Xuất Bản Hội Nhà Văn', 10, 15000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Payback Time - Ngày Đòi Nợ', N'ngaydoino.jpg', N'cheap', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'HappyLive', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 15, 20000, 280)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'English & Countries - Việt Nam và Đất Nước Học', N'vndatnuoc.jpg', N'good', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 30, 85000, 300)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'Oxford Learner Pocket Phrasal Verbs and Idioms', N'oxfordpv.jpg', N'good', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 2, '', 22, 71000, 870)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (4, N'English Grammar in Use Book w Ans', N'englishga.jpg', N'good', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 2, '', 17, 63000, 470)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (5, N'English Vocabulary In Use Upper Inter', N'englishvup.jpg', N'good', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 150, 55000, 250)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (5, N'A Year in Nature: A Carousel Book of the Seasons (Pop-Up)', N'ayearn.jpg', N'good', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 15, 15000, 300)
GO
INSERT [dbo].[Coupon] ([CouponID], [CouponDesc], [DiscountPercent], [Quantity]) VALUES ('NAMMOI2022', N'Chúc mừng năm mới', 50, 10)
INSERT [dbo].[Coupon] ([CouponID], [CouponDesc], [DiscountPercent], [Quantity]) VALUES ('VALUNLUON', N'', 10, 10)
INSERT [dbo].[Coupon] ([CouponID], [CouponDesc], [DiscountPercent], [Quantity]) VALUES ('CHUCMUNG', N'', 50, 10)
INSERT [dbo].[Coupon] ([CouponID], [CouponDesc], [DiscountPercent], [Quantity]) VALUES ('HOMNAY', N'', 10, 10)
INSERT [dbo].[Coupon] ([CouponID], [CouponDesc], [DiscountPercent], [Quantity]) VALUES ('WARZONE', N'', 50, 10)
GO
INSERT [dbo].[Offer] ([ProductId], [CouponId]) VALUES (1, 'NAMMOI2022')
INSERT [dbo].[Offer] ([ProductId], [CouponId]) VALUES (2, 'VALUNLUON')
GO
INSERT INTO [dbo].[WishList] ([AccountId], [ProductId]) VALUES (2, 1)
INSERT INTO [dbo].[WishList] ([AccountId], [ProductId]) VALUES (2, 2)
GO
INSERT [dbo].[OrderStatus] ([Description]) VALUES (N'Pending')
INSERT [dbo].[OrderStatus] ([Description]) VALUES (N'Completed')
GO
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Nguyen Van An','an@gmail.com', '0111111111')
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Phan Van Be','bgio@gmail.com', '0111112222')
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Pham Van Bach','vlback@gmail.com', '0111111111')
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Nguyen Thai Binh','binhnv@gmail.com', '0111112222')
GO
INSERT [dbo].[Order] ([ShipperId], [AccountId], [OrderDate], [EstimateDelivery], [Total], [StatusId]) VALUES (1, 2, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-02T00:00:00.0000000' AS DateTime2), 24.0000, 1)

GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductID], [Quantity]) VALUES (1, 2, 2)
GO
INSERT [dbo].[Post] ([AuthorId], [Title], [ShortDesc], [Content], [CreatedDate]) VALUES (1, N'The best fashion influencers to follow for sartorial inspiration', N'From our favourite UK influencers to the best missives from Milan and the coolest New Yorkers, read on some of the best fashion blogs out there, and for even more inspiration, do head to our separate black fashion influencer round-up.', N'From our favourite UK influencers to the best missives from Milan and the coolest New Yorkers, read on some of the best fashion blogs out there, and for even more inspiration, do head to our separate black fashion influencer round-up.
Fancy some shopping deals? Check out these amazing sales: Zara Black Friday, ASOS Black Friday, Missoma Black Friday and Gucci Black Friday.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Post] ([AuthorId], [Title], [ShortDesc], [Content], [CreatedDate]) VALUES (1, N'THE HOLIDAY HOSTING HACK I LIVE BY', N'If there’s one holiday hosting hack that I live by, it’s to have your food (and drink!) double as decorations.', N'If there’s one holiday hosting hack that I live by, it’s to have your food (and drink!) double as decorations. Nothing brings more ambience to a holiday party than an on-theme spread of food and drinks and it might be easier than you think. From charcuterie boards laid out in wreaths to festive-shaped desserts, or festive drinks bring the holiday spirit to your table spread for your holiday gatherings.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Post] ([AuthorId], [Title], [ShortDesc], [Content], [CreatedDate]) VALUES (1, N'The Pacific Spiny Lumpsucker Is Armed to the Teeth', N'The nightmare of the Pacific spiny lumpsucker starts with the teeth: needle-sharp, lining the rim of bulbous lips. ', N'The nightmare of the Pacific spiny lumpsucker starts with the teeth: needle-sharp, lining the rim of bulbous lips. A single fin crowns the fish’s head like a mohawk, and spiked studs cover nearly every inch of its body, recalling an armored car from a “Mad Max” movie.
But the nightmare passes quickly: The Pacific spiny lumpsucker is barely three inches long.
“Pacific spiny lumpsuckers are certainly one of the cutest fish that you can find,” Karly Cohen, a Ph.D. candidate in biology at the University of Washington, said recently.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Post] ([AuthorId], [Title], [ShortDesc], [Content], [CreatedDate]) VALUES (1, N'The Paradox of the Lizard Tail, Solved', N'It can break off in an instant but also stay firmly attached. Scientists have figured out the microscopic structures that make this survival skill possible.', N'It can break off in an instant but also stay firmly attached. Scientists have figured out the microscopic structures that make this survival skill possible. When choosing between life and limb, many animals willingly sacrifice the limb. The ability to drop appendages is known as autotomy, or self-amputation. When backed into a corner, spiders let go of legs, crabs drop claws and some small rodents shed clumps of skin. Some sea slugs will even decapitate themselves to rid themselves of their parasite-infested bodies.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Post] ([AuthorId], [Title], [ShortDesc], [Content], [CreatedDate]) VALUES (1, N'On Mars, a Year of Surprise and Discovery', N'The past 12 months on Mars have been both “exciting” and “exhausting” for scientists and engineers minding the Perseverance rover and Ingenuity helicopter. ', N'The past 12 months on Mars have been both “exciting” and “exhausting” for scientists and engineers minding the Perseverance rover and Ingenuity helicopter. A year ago, NASA’s Perseverance rover was accelerating to a collision with Mars, nearing its destination after a 290-million-mile, seven-month journey from Earth.
On Feb. 18 last year, the spacecraft carrying the rover pierced the Martian atmosphere at 13,000 miles per hour. In just seven minutes — what NASA engineers call “seven minutes of terror” — it had to pull off a series of maneuvers to place Perseverance gently on the surface.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
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
GO
INSERT [dbo].[Review] ([ProductId], [AccountId], [Content], [Ratings], [CreatedDate]) VALUES (1, 2, 'good', 5, CAST(N'2022-02-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Review] ([ProductId], [AccountId], [Content], [Ratings], [CreatedDate]) VALUES (1, 2, 'hay', 5, CAST(N'2022-02-12T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Contact] ([Email], [Phone], [Address]) VALUES ('hotroswp@gmail.com', '+84 1122 3344 11', 'Hanoi, Vietnam')
GO
INSERT [dbo].[Subcribe] ([Email], [SubcribeDate]) VALUES ('khang@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subcribe] ([Email], [SubcribeDate]) VALUES ('abcxyz@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subcribe] ([Email], [SubcribeDate]) VALUES ('khang2@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subcribe] ([Email], [SubcribeDate]) VALUES ('khang3@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subcribe] ([Email], [SubcribeDate]) VALUES ('khang4@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subcribe] ([Email], [SubcribeDate]) VALUES ('khang5@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
/*Gmail:
hotroswp@gmail.com
admin123@
*/