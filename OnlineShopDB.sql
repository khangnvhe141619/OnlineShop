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
	FullName			nvarchar(255)	,
	Gender				bit				,
	Email				varchar(50)		,
	PhoneNumber			varchar(15)		,
	Avatar				varchar(255)	,
	[Role]				int				NOT NULL,
	[Active]			bit				NOT NULL,
	CreatedDate			datetime2		,

	CONSTRAINT PK_account_id PRIMARY KEY(AccountID),
	CONSTRAINT FK_role FOREIGN KEY([Role]) REFERENCES Department(DepartmentID) ON DELETE NO ACTION,
)

CREATE TABLE [dbo].[Address]
(
	AccountId			int				,
	[Address]			varchar(255)	NOT NULL,
	
	CONSTRAINT FK_account_id_1 FOREIGN KEY(AccountId) REFERENCES Account(AccountID) ON DELETE CASCADE,
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
	Author				nvarchar(255)	NOT NULL,
	CreatedDate			datetime2		,
	IssuingCompany		nvarchar(255)	NOT NULL,
	PublicationDate		datetime2		NOT NULL,
	CoverTypeId			int				NOT NULL,
	PublishingCompany	nvarchar(255)	,
	Quantity			int				NOT NULL,
	Price				float			NOT NULL,
	NumberPage			int				NOT NULL,

	CONSTRAINT PK_product_id PRIMARY KEY(ProductID),
	CONSTRAINT FK_category_id FOREIGN KEY(CategoryId) REFERENCES Category(CategoryID) ON DELETE CASCADE,
	CONSTRAINT FK_covertype_id FOREIGN KEY(CoverTypeId) REFERENCES BookCover(BookCoverID) ON DELETE CASCADE
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
	CreatedDate			datetime2		,

	CONSTRAINT PK_review_id PRIMARY KEY(ReviewID),
	CONSTRAINT PK_account_id_a1 FOREIGN KEY(AccountId) REFERENCES Account(AccountID) ON DELETE CASCADE,
	CONSTRAINT FK_product_id_2 FOREIGN KEY(ProductId) REFERENCES Product(ProductID) ON DELETE CASCADE
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

CREATE TABLE [dbo].[Cart](
	AccountId			int				,
	ProductId			int				,
	Quantity			int				NOT NULL,

	CONSTRAINT PK_account_id_a2 FOREIGN KEY(AccountId) REFERENCES Account(AccountID) ON DELETE CASCADE,
	CONSTRAINT FK_product_id_a2 FOREIGN KEY(ProductId) REFERENCES Product(ProductID) ON DELETE CASCADE
)

CREATE TABLE [dbo].[Order]
(
	OrderID				int				IDENTITY(1,1),
	ShipperId			int				,
	AccountId			int				,
	OrderDate			datetime2		NOT NULL,
	Total				money			NOT NULL,
	StatusId			int				,

	CONSTRAINT PK_order_id PRIMARY KEY(OrderID),
	CONSTRAINT FK_shipper_id FOREIGN KEY(ShipperId) REFERENCES Shipper(ShipperID) ON DELETE NO ACTION,
	CONSTRAINT PK_account_id_2 FOREIGN KEY(AccountId) REFERENCES Account(AccountID) ON DELETE NO ACTION,
	CONSTRAINT FK_status_id FOREIGN KEY(StatusId) REFERENCES OrderStatus(ID) ON DELETE NO ACTION
)

CREATE TABLE [dbo].[OrderDetail]
(
	OrderId				int				,
	ProductId			int				,
	Quantity			int				NOT NULL,

	CONSTRAINT FK_order_id FOREIGN KEY(OrderId) REFERENCES [Order](OrderID)ON DELETE NO ACTION,
	CONSTRAINT FK_product_id_3 FOREIGN KEY(ProductId) REFERENCES Product(ProductID) ON DELETE NO ACTION
)

CREATE TABLE [dbo].[Post]
(
	PostID				int				IDENTITY(1,1),
	Author				nvarchar(255)	NOT NULL,
	Title				nvarchar(255)	NOT NULL,
	ShortDesc			nvarchar(max)	NOT NULL,
	Content				nvarchar(max)	NOT NULL,
	CreatedDate			datetime2		,
	Active				bit				NOT NULL,

	CONSTRAINT PK_post_id PRIMARY KEY(PostID),
)

CREATE TABLE [dbo].[PostComment]
(
	PostCommentID		int			IDENTITY(1,1),
	PostId				int				,
	AccountId			int				,
	Comment				nvarchar(255)	NOT NULL,
	CreatedDate			datetime2		,

	CONSTRAINT PK_postcomment_id PRIMARY KEY(PostCommentID),
	CONSTRAINT FK_account_id_5 FOREIGN KEY(AccountId) REFERENCES Account(AccountID) ON DELETE CASCADE,
	CONSTRAINT FK_post_id FOREIGN KEY(PostId) REFERENCES Post(PostID)  ON DELETE CASCADE,
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
	CONSTRAINT FK_post_id_1 FOREIGN KEY(PostId) REFERENCES Post(PostID) ON DELETE CASCADE,
	CONSTRAINT FK_tag_id FOREIGN KEY(TagId) REFERENCES Tag(TagID) ON DELETE CASCADE
)

CREATE TABLE [dbo].[Contact]
(
	ShopName			nvarchar(255)	NOT NULL,
	[Desc]				nvarchar(255)	NOT NULL,
	Email				varchar(255)	NOT NULL,
	Phone				varchar(30)		NOT NULL,
	[Address]			varchar(255)	NOT NULL,

)

CREATE TABLE [dbo].[Subscriber]
(
	ID					int				IDENTITY(1,1),
	FullName			nvarchar(255)	NOT NULL,
	Email				varchar(255)	NOT NULL,
	SubscribeDate		datetime2		NOT NULL

	CONSTRAINT PK_id_s PRIMARY KEY(ID),
	CONSTRAINT UNI_email UNIQUE(Email)
)

GO
INSERT [dbo].[Department] ([DepartmentName], [DepartmentDesc]) VALUES ('Admin', '')
INSERT [dbo].[Department] ([DepartmentName], [DepartmentDesc]) VALUES ('Customer', '')
INSERT [dbo].[Department] ([DepartmentName], [DepartmentDesc]) VALUES ('Sales', '')
INSERT [dbo].[Department] ([DepartmentName], [DepartmentDesc]) VALUES ('Marketing', '')
GO
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'admin', N'admin', NULL, NULL, N'hotroswp@gmail.com', N'0111111111', NULL, 1 , 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang123', N'khang123', NULL, NULL, N'khacongkenh@gmail.com', N'0123456789', NULL, 2, 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang456', N'khang456', NULL, NULL, N'khacongkenh1@gmail.com', N'0123456789', NULL, 3, 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang789', N'khang789', NULL, NULL, N'khacongkenh@2gmail.com', N'0123456789', NULL, 4, 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
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
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Cây Cam Ngọt Của Tôi', N'camngot.jpg', N'good quality', N'Trác Phong',CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Nhã Nam', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Nhà Xuất Bản Hội Nhà Văn', 10, 15000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Payback Time - Ngày Đòi Nợ', N'ngaydoino.png', N'cheap', 'Phil Town', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'HappyLive', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 15, 20000, 280)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'English & Countries - Việt Nam và Đất Nước Học', N'vndatnuoc.jpg', N'good', N'Lê Huy Bắc', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 30, 85000, 300)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'Oxford Learner Pocket Phrasal Verbs and Idioms', N'oxfordidioms.jpg', N'good', 'Varios Autores', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 2, '', 22, 71000, 870)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (4, N'English Grammar in Use Book w Ans', N'englishga.jpg', N'good', '	Raymond Murphy', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 2, '', 17, 63000, 470)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (5, N'English Vocabulary In Use Upper Inter', N'englishvupin.jpg', N'good', 'Michael McCarthy and Felicity ODell', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 150, 55000, 250)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (5, N'A Year in Nature: A Carousel Book of the Seasons (Pop-Up)', N'ayearn.jpg', N'good', 'Hazel Maskell', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, '', 15, 15000, 300)

INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Nhà Giả Kim (Tái Bản 2020)', N'nhagiakim.jpg', N'good quality', 'Paulo Coelho', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Nhã Nam', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Nhà Xuất Bản Hội Nhà Văn', 50, 20000, 204)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Rèn Luyện Tư Duy Phản Biện', N'renluyentd.jpg', N'good quality', 'Albert Rutherford', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Cambridge University', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1, N'Nhà Xuất Bản Hội Nhà Văn', 10, 35000, 200)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Tâm Lý Học Về Tiền', N'tamlihoctien.jpg', N'good quality', 'Morgan Housel', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'NXB Khoa Học & Kỹ Thuật', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1, N'Bloomsbury', 20, 15000, 247)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'Oxford Phrasal Verbs Dictionary (Elt)', N'oxfordphverb.png', N'good quality', 'Oxford Edt', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Đại Trường Phát', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1, N'Oxford University Press', 30, 41000, 290)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'How to Sound Really Clever', N'howtosound.jpg', N'good quality', 'Hubert van den Bergh', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'NXB Khoa Học & Kỹ Thuật', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Bloomsbury', 60, 67000, 244)

INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Blink: The Power of Thinking Without Thinking', N'blinkpower.jpg', N'good quality', 'Malcolm Gladwell', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Alphabooks', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Bloomsbury', 18, 91000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Cuộc Cách Mạng Blockchain', N'cmblock.jpg', N'good quality', 'Don Tapscott & Alex Tapscott- Fonos', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Nhã Nam', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Bloomsbury', 30, 56000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Phân Tích Chứng Khoán', N'ptck.jpg', N'good quality', 'Benjamin Graham and David Dodd', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Alphabooks', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Nhà Xuất Bản Lao Động', 10, 16000, 822)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Money: Vintage Minis', N'moneyvt.png', N'good quality', 'Yuval Noah Harari', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Grantham Book Services', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Vintage Classics', 120, 100000, 600)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (4, N'VOCA Junior', N'vocaju.png', N'good quality', N'Nhiều tác giả', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'NXB Khoa Học & Kỹ Thuật', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'NXB Khoa Học & Kỹ Thuật', 30, 82000, 500)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [Author], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (4, N'Access Grade 9 Workbook', N'accessgrade.jpg', N'good quality', 'Virginia Evans - Jenny Dooley', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Đại Trường Phát', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Oxford University Press', 5, 150000, 444)

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
INSERT [dbo].[Order] ([ShipperId], [AccountId], [OrderDate], [Total], [StatusId]) VALUES (1, 2, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 24.0000, 1)

GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductID], [Quantity]) VALUES (1, 2, 2)

GO
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('David', N'The best fashion influencers to follow for sartorial inspiration', N'From our favourite UK influencers to the best missives from Milan and the coolest New Yorkers, read on some of the best fashion blogs out there, and for even more inspiration, do head to our separate black fashion influencer round-up.', N'From our favourite UK influencers to the best missives from Milan and the coolest New Yorkers, read on some of the best fashion blogs out there, and for even more inspiration, do head to our separate black fashion influencer round-up. Fancy some shopping deals? Check out these amazing sales: Zara Black Friday, ASOS Black Friday, Missoma Black Friday and Gucci Black Friday.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Ha Lan', N'THE HOLIDAY HOSTING HACK I LIVE BY', N'If there’s one holiday hosting hack that I live by, it’s to have your food (and drink!) double as decorations.', N'If there’s one holiday hosting hack that I live by, it’s to have your food (and drink!) double as decorations. Nothing brings more ambience to a holiday party than an on-theme spread of food and drinks and it might be easier than you think. From charcuterie boards laid out in wreaths to festive-shaped desserts, or festive drinks bring the holiday spirit to your table spread for your holiday gatherings.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Tom', N'The Pacific Spiny Lumpsucker Is Armed to the Teeth', N'The nightmare of the Pacific spiny lumpsucker starts with the teeth: needle-sharp, lining the rim of bulbous lips. ', N'The nightmare of the Pacific spiny lumpsucker starts with the teeth: needle-sharp, lining the rim of bulbous lips. A single fin crowns the fish’s head like a mohawk, and spiked studs cover nearly every inch of its body, recalling an armored car from a “Mad Max” movie.
But the nightmare passes quickly: The Pacific spiny lumpsucker is barely three inches long.
“Pacific spiny lumpsuckers are certainly one of the cutest fish that you can find,” Karly Cohen, a Ph.D. candidate in biology at the University of Washington, said recently.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Jerry Mous', N'The Paradox of the Lizard Tail, Solved', N'It can break off in an instant but also stay firmly attached. Scientists have figured out the microscopic structures that make this survival skill possible.', N'It can break off in an instant but also stay firmly attached. Scientists have figured out the microscopic structures that make this survival skill possible. When choosing between life and limb, many animals willingly sacrifice the limb. The ability to drop appendages is known as autotomy, or self-amputation. When backed into a corner, spiders let go of legs, crabs drop claws and some small rodents shed clumps of skin. Some sea slugs will even decapitate themselves to rid themselves of their parasite-infested bodies.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Zessika', N'On Mars, a Year of Surprise and Discovery', N'The past 12 months on Mars have been both “exciting” and “exhausting” for scientists and engineers minding the Perseverance rover and Ingenuity helicopter. ', N'The past 12 months on Mars have been both “exciting” and “exhausting” for scientists and engineers minding the Perseverance rover and Ingenuity helicopter. A year ago, NASA’s Perseverance rover was accelerating to a collision with Mars, nearing its destination after a 290-million-mile, seven-month journey from Earth.
On Feb. 18 last year, the spacecraft carrying the rover pierced the Martian atmosphere at 13,000 miles per hour. In just seven minutes — what NASA engineers call “seven minutes of terror” — it had to pull off a series of maneuvers to place Perseverance gently on the surface.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Rutherford', 'Lenovo made its first ThinkPad powered by a Snapdragon chip', 'Unlike Apple’s M1 MacBooks, ARM-based Windows on Snapdragon laptops haven’t enjoyed quite the same level of success or popularity.', 'Unlike Apple’s M1 MacBooks, ARM-based Windows on Snapdragon laptops haven’t enjoyed quite the same level of success or popularity. But Lenovo is hoping to change that – at least for enterprise customers – with the new ThinkPad X13s.The ThinkPad X13s’ secret weapon is its Snapdragon 8cx Gen 3 chip, which Lenovo says is the first time Qualcomm’s newest laptop processor has been featured in a commercial device. By leveraging improved energy efficiency and a low-power 400-nit 13.3-inch display, Lenovo says the ThinkPad X13s can last up to 28 hours on a single charge.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Arjun', 'China’s Huawei launches a rival to the Amazon Kindle in bid to revive struggling consumer business', 'The Huawei MatePad Paper is the company’s first e-reader device and features a 10.3-inch display. Huawei is positioning this as a product useful for the work environment.', 'The Huawei MatePad Paper is the company’s first e-reader device and features a 10.3-inch display. Huawei is positioning this as a product useful for the work environment.

It is compatible with the Huawei M-Pencil, which can be used across other products.

Huawei said that writing on the MatePad Paper with the electronic pencil feels like writing on actual paper due to the slight bit of friction and the sound given off. Users can convert handwritten notes into text as well.', CAST(N'2022-02-27T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Kameron', 'Lenovo’s new IdeaPad Gaming 3 is a more budget-friendly 16:10 aspect ratio laptop', 'Lenovo has made some hefty updates to its mid-range IdeaPad Gaming 3 lineup for 2022, which includes two Intel 12th Gen- and two AMD Ryzen 6000-series-equipped models, each with a 15.6-inch and 16-inch option', 'Lenovo has made some hefty updates to its mid-range IdeaPad Gaming 3 lineup for 2022, which includes two Intel 12th Gen- and two AMD Ryzen 6000-series-equipped models, each with a 15.6-inch and 16-inch option. Notably, the 16-inch option for either CPU you opt for has a 16:10 aspect ratio display with the option to go up to 2560 x 1600, like the Legion 5 Pro, which is more desirable because it offers more vertical space for browsing, gaming, or anything else you want to do on a PC. The only thing they’re not particularly great for is watching movies or TV shows, which are traditionally presented in 16:9 aspect ratio.', CAST(N'2022-02-20T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Garth Franky', '‘More Power’ For Valve’s Steam Deck 2?', 'Valve’s portable PC gaming handheld, the Steam Deck, finally began shipping to customers this past week. Reviews for the machine have been very positive across the board even as there are the standard launch teething issues with software and compatibility which will improve with time.', 'Valve’s portable PC gaming handheld, the Steam Deck, finally began shipping to customers this past week. Reviews for the machine have been very positive across the board even as there are the standard launch teething issues with software and compatibility which will improve with time. With the hardware, the most common complaint seems to be about sacrifices made to bring the machine in on a budget so there’s no OLED screen, limited battery life, and various minor quibbles expected from any ‘first iteration’ of a piece of hardware.', CAST(N'2022-03-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Phillip Tracy', 'Samsung Galaxy Book2 Pro Debuts With Intel Arc Graphics', 'Samsung announced Sunday a new fleet of premium Galaxy laptops led by the Galaxy Book2 Pro and Galaxy Book2 Pro 360. The leading Android phone maker has a mixed track record in the notebook market but the Galaxy Book Pro 360 impressed us last year .', 'Samsung announced Sunday a new fleet of premium Galaxy laptops led by the Galaxy Book2 Pro and Galaxy Book2 Pro 360. The leading Android phone maker has a mixed track record in the notebook market but the Galaxy Book Pro 360 impressed us last year and these two additions bring several nice upgrades to the table, including Intel’s long-awaited discrete Arc graphics. The Galaxy Book2 Pro and Book2 Pro 360 will be available in 13.3-inch and 15.6-inch versions. Whichever you choose, it will come with a 1080p AMOLED display with a max brightness of 500 nits (a 33% increase from the previous model). If you’ve kept tabs on the laptop space in recent years, these specs are a bit old school.', CAST(N'2022-02-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Post] ([Author], [Title], [ShortDesc], [Content], [CreatedDate], [Active]) VALUES ('Golden Kelly', 'New Apple Leak Reveals iPhone 14 Design Shock', 'In its latest exclusive, The Elec (which has been on fire recently) reveals that Apple has secured next generation OLED technology for iPhone 14 Pro models from Samsung. And the surprising part: Samsung didn’t even include the tech in its new Galaxy S22 range. ', 'In its latest exclusive, The Elec (which has been on fire recently) reveals that Apple has secured next generation OLED technology for iPhone 14 Pro models from Samsung. And the surprising part: Samsung didn’t even include the tech in its new Galaxy S22 range. . 02/27 Update: Apples iPhone display changes continue to leak. Building on the cutting edge panels coming to this years iPhone 14 lineup, respected industry display specialist Ross Young has revealed that there will be no escaping the controversial i-shaped cutout in 2023. Young states that Apple will introduce the double cutout across all iPhone 15 models, it is Pro-exclusive in 2022, finally killing off the notch for good. Young flawless track record also indicates this is information you can take to the bank.', CAST(N'2022-03-04T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[PostComment] ([PostId], [AccountId], [Comment], [CreatedDate]) VALUES (1, 2, N'good', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[PostComment] ([PostId], [AccountId], [Comment], [CreatedDate]) VALUES (1, 1, N'ok', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Tag] ([TagName]) VALUES (N'share')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'blog')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'name')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'wine')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'image')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'theme')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'map')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'people')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'learn')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'science')
INSERT [dbo].[Tag] ([TagName]) VALUES (N'art')
GO
INSERT [dbo].[PostTag] ([PostId], [TagId]) VALUES (1, 1)
INSERT [dbo].[PostTag] ([PostId], [TagId]) VALUES (1, 2)
INSERT [dbo].[PostTag] ([PostId], [TagId]) VALUES (2, 4)
GO
INSERT [dbo].[Review] ([ProductId], [AccountId], [Content], [Ratings], [CreatedDate]) VALUES (1, 2, 'good', 5, CAST(N'2022-02-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Review] ([ProductId], [AccountId], [Content], [Ratings], [CreatedDate]) VALUES (1, 2, 'hay', 5, CAST(N'2022-02-12T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Contact] ([ShopName], [Desc], [Email], [Phone], [Address]) VALUES ('Tomee', 'This is our website.', 'hotroswp@gmail.com', '+84 1122 3344 11', 'Km29 Highway 08, Thach Hoa, Thach That, Hanoi, Vietnam')
GO
INSERT [dbo].[Subscriber] ([FullName], [Email], [SubscribeDate]) VALUES ('Khang', 'khang@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subscriber] ([FullName], [Email], [SubscribeDate]) VALUES ('Khang', 'abcxyz@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subscriber] ([FullName], [Email], [SubscribeDate]) VALUES ('Khang', 'khang2@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subscriber] ([FullName], [Email], [SubscribeDate]) VALUES ('Khang', 'khang3@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subscriber] ([FullName], [Email], [SubscribeDate]) VALUES ('Khang', 'khang4@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Subscriber] ([FullName], [Email], [SubscribeDate]) VALUES ('Khang', 'khang5@gmail.com', CAST(N'2022-02-16T00:00:00.0000000' AS DateTime2))
/*Gmail:
hotroswp@gmail.com
admin123@
*/
GO
CREATE PROCEDURE procedure_decrease_product
	 (@id int , @amount int)
AS
BEGIN
	DECLARE @total int;
SET @total=(SELECT Quantity FROM Product WHERE ProductID = @id);
SET @amount=@amount
UPDATE Product 
SET Quantity=@total-@amount
WHERE ProductID = @id
END
GO