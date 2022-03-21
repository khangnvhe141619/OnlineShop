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
	ReceiptDate			datetime2		,
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
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'admin', N'admin', 'Admin', 1, N'hotroswp@gmail.com', N'0111111111', NULL, 1 , 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang123', N'khang123', 'Khang', 1, N'khacongkenh@gmail.com', N'0123456789', NULL, 2, 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang456', N'khang456', 'Khang 2', 1, N'khacongkenh1@gmail.com', N'0123456789', NULL, 3, 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Username], [Password], [FullName], [Gender], [Email], [PhoneNumber], [Avatar], [Role], [Active], [CreatedDate]) VALUES (N'khang789', N'khang789', 'Khang 3', 1, N'khacongkenh@2gmail.com', N'0123456789', NULL, 4, 1, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Address] ([AccountId], [Address]) VALUES (1, N'Hanoi')
INSERT [dbo].[Address] ([AccountId], [Address]) VALUES (2, N'Hung Yen')
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
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Cây Cam Ngọt Của Tôi', N'camngot.jpg', N'Giáo trình ACCESS – Lớp 6-9 là bộ giáo trình tiếng Anh được thiết kế dành riêng cho học sinh đang học tiếng Anh tại các trường Trung học Cơ sở, chương trình tiếng Anh tăng cường, dựa trên phương pháp Tổng hợp ngôn ngữ.Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Nhã Nam', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Nhà Xuất Bản Hội Nhà Văn', 10, 15000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Payback Time - Ngày Đòi Nợ', N'ngaydoino.png', N'Trong chứng khoán và thị trường tài chính, dám tham gia đầu tư cũng là một thành công tâm lý ban đầu. Dù vậy, 95% nhà đầu tư Việt Nam thuộc nhóm nhà đầu tư nhỏ lẻ với vốn kiến thức tài chính vô cùng hạn chế. Họ tham gia vào thị trường chứng khoán với 100% ý chí và sự quyết tâm chiến thắng thị trường, nhưng thật không may mắn kết cục cuối cùng của họ luôn là sự thất bại và mất tiền.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'HappyLive', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, N'', 15, 20000, 280)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'English & Countries - Việt Nam và Đất Nước Học', N'vndatnuoc.jpg', N'Không hẳn vậy. Có rất nhiều người dù không được đào tạo bài bản về các kiến thức tài chính, dù vẫn là những người đầu tư nhỏ lẻ họ vẫn chiến thắng thị trường và làm giàu được từ chứng khoán. Đó là bởi vì họ có được một hệ thống đầu tư chuẩn mực, biết vận dụng các công cụ phân tích, biết tuân thủ các nguyên tắc trong đầu tư.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, N'', 30, 85000, 300)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'Oxford Learner Pocket Phrasal Verbs and Idioms', N'oxfordidioms.jpg', N'Có một hệ thống đầu tư chuẩn mực đã và đang được những nhà đầu tư bậc thầy trên thế giới như Warren Buffett, Charlie Munger… áp dụng. Hệ thống đầu tư và phương pháp đầu tư ưu việt đó đã được gói gọn và thực sự dễ hiểu trong cuốn PayBack Time – Ngày đòi nợ của tác giả Phil Town.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 2, N'', 22, 71000, 870)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (4, N'English Grammar in Use Book w Ans', N'englishga.jpg', N'The worlds best-selling grammar series for learners of English. English Grammar in Use Fourth edition is an updated version of the world''s best-selling grammar title. It has a fresh, appealing new design and clear layout, with revised and updated examples, but retains all the key features of clarity and accessibility that have made the book popular with millions of learners and teachers around the world. This with answers version is ideal for self-study. An online version, book without answers, and book with answers and CD-ROM are available separately.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 2, N'', 17, 63000, 470)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (5, N'English Vocabulary In Use Upper Inter', N'englishvupin.jpg', N'The worlds best-selling grammar series for learners of English. English Grammar in Use Fourth edition is an updated version of the world''s best-selling grammar title. It has a fresh, appealing new design and clear layout, with revised and updated examples, but retains all the key features of clarity and accessibility that have made the book popular with millions of learners and teachers around the world. This with answers version is ideal for self-study. An online version, book without answers, and book with answers and CD-ROM are available separately.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, N'', 150, 55000, 250)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (5, N'A Year in Nature: A Carousel Book of the Seasons (Pop-Up)', N'ayearn.jpg', N'The worlds best-selling grammar series for learners of English. English Grammar in Use Fourth edition is an updated version of the world''s best-selling grammar title. It has a fresh, appealing new design and clear layout, with revised and updated examples, but retains all the key features of clarity and accessibility that have made the book popular with millions of learners and teachers around the world. This with answers version is ideal for self-study. An online version, book without answers, and book with answers and CD-ROM are available separately.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-08-08T00:00:00.0000000' AS DateTime2), 1, N'', 15, 15000, 300)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Nhà Giả Kim (Tái Bản 2020)', N'nhagiakim.jpg', N'Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Nhã Nam', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Nhà Xuất Bản Hội Nhà Văn', 50, 20000, 204)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Rèn Luyện Tư Duy Phản Biện', N'renluyentd.jpg', N'Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện! Bạn cần phải nhận ra được rằng con người, kể từ khi sinh ra, rất giỏi việc đưa ra những lý do lý giải cho những suy nghĩ khiếm khuyết của mình. Nếu bạn đang có những kết luận sai lệch này thì có một sự thật là những đức tin của bạn thường mâu thuẫn với nhau và đó thường là kết quả của thiên kiến xác nhận, nhưng nếu bạn biết điều này, thì bạn đã tiến gần hơn tới sự thật rồi!', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Cambridge University', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1, N'Nhà Xuất Bản Hội Nhà Văn', 10, 35000, 200)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (1, N'Tâm Lý Học Về Tiền', N'tamlihoctien.jpg', N'Tiền bạc có ở khắp mọi nơi, nó ảnh hưởng đến tất cả chúng ta, và khiến phần lớn chúng ta bối rối. Mọi người nghĩ về nó theo những cách hơi khác nhau một chút. Nó mang lại những bài học có thể được áp dụng tới rất nhiều lĩnh vực trong cuộc sống, như rủi ro, sự tự tin, và hạnh phúc. Rất ít chủ đề cung cấp một lăng kính phóng to đầy quyền lực giúp giải thích vì sao mọi người lại hành xử theo cách họ làm hơn là về tiền bạc. Đó mới là một trong những chương trình hoành tráng nhất trên thế giới.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'NXB Khoa Học & Kỹ Thuật', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1, N'Bloomsbury', 20, 15000, 247)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'Oxford Phrasal Verbs Dictionary (Elt)', N'oxfordphverb.png', N'Chúng ta đều làm những điều điên rồ với tiền bạc, bởi vì chúng ta đều còn khá mới mẻ với trò chơi này và điều có vẻ điên rồ với bạn lại có khi hợp lý với tôi. Nhưng không ai là điên rồ cả – chúng ta đều đưa ra các quyết định dựa trên những trải nghiệm độc đáo riêng có mang vẻ hợp lý với mình ở bất cứ thời điểm nào.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Đại Trường Phát', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 1, N'Oxford University Press', 30, 41000, 290)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (3, N'How to Sound Really Clever', N'howtosound.jpg', N'Mục đích của cuốn sách này là sử dụng những câu chuyện ngắn để thuyết phục bạn rằng những kỹ năng mềm còn quan trọng hơn khía cạnh lý thuyết của đồng tiền. Thông qua một tập hợp những thử nghiệm và sai lầm của nhiều năm chúng ta đã học được cách trở thành những nông dân giỏi giang hơn, những thợ sửa ống nước nhiều kỹ năng hơn, và những nhà hóa học tiên tiến hơn. Nhưng liệu việc thử nghiệm và sai lầm có dạy chúng ta trở nên giỏi hơn trong cách quản lý tài chính cá nhân của chính mình không?', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'NXB Khoa Học & Kỹ Thuật', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Bloomsbury', 60, 67000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Blink: The Power of Thinking Without Thinking', N'blinkpower.jpg', N'In his landmark bestseller The Tipping Point, Malcolm Gladwell redefined how we understand the world around us.

Now, in Blink, he revolutionizes the way we understand the world within.

Blink is a book about how we think without thinking, about choices that seem to be made in an instant-in the blink of an eye-that actually aren''t as simple as they seem.

Why are some people brilliant decision makers, while others are consistently inept?

Why do some people follow their instincts and win, while others end up stumbling into error?

How do our brains really work-in the office, in the classroom, in the kitchen, and in the bedroom?', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Alphabooks', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Bloomsbury', 18, 91000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Cuộc Cách Mạng Blockchain', N'cmblock.jpg', N'Công nghệ có thể tác động lớn đến tương lai của nền kinh tế thế giới đã xuất hiện, đó không phải là ô tô tự lái, là năng lượng mặt trời hay trí thông minh nhân tạo. Đó chính là Blockchain.

Thế hệ thứ nhất của cuộc cách mạng số hóa đã đưa chúng ta đến với kỷ nguyên Internet của thông tin. Thế hệ thứ hai – được tiếp sức bởi công nghệ blockchain – đang đưa chúng ta đến với Internet của giá trị: một nền tảng phi tập trung mới mẻ, thứ có thể giúp chúng ta tái định hình ngày.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Nhã Nam', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Bloomsbury', 30, 56000, 244)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Phân Tích Chứng Khoán', N'ptck.jpg', N'Với 8 chương sách, Phân tích chứng khoán không chỉ đưa ra những bài học vô giá trong đầu tư giá trị mà còn khiến các nhà đầu tư có được sự tỉnh táo, lựa chọn khôn ngoan khi đối mặt với sự biến động thất thường trong quá trình đầu tư.

Các tác giả đã chứng kiến ​​và sống sót sau cuộc Đại suy thoái cũng như những bất ổn chính trị và tài chính của Thế chiến II và giờ đây họ có thể dễ dàng hơn trong việc phác thảo một chương trình đầu tư hợp lý và có lợi nhuận trong nửa sau của thế kỷ này.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Alphabooks', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Nhà Xuất Bản Lao Động', 10, 16000, 822)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (2, N'Money: Vintage Minis', N'moneyvt.png', N'Kho từ vựng khổng lồ được cập nhật, thêm mới liên tục, định kỳ của 6 ngôn ngữ phổ biến trên thế giới với 8 chương trình học, các audio chuẩn bản xứ, lộ trình học bài bản áp dụng các phương pháp Giáo dục sớm giúp bé bắt đầu học ngôn ngữ, đặc biệt là tiếng Anh dễ dàng hơn, hiệu quả hơn .', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Grantham Book Services', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Vintage Classics', 120, 100000, 600)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (4, N'VOCA Junior', N'vocaju.png', N'Monkey Junior tiên phong và dẫn đầu tại Việt Nam về học tiếng Anh cho trẻ mới bắt đầu. 

Monkey Junior mang đến chương trình học tiếng Anh bài bản, áp dụng các phương pháp Giáo dục sớm với lộ trình được các chuyên gia xây dựng phân chia thành nhiều cấp độ, với mức chi phí chỉ vài nghìn đồng/ngày – là khởi đầu hoàn hảo cho mọi trẻ em bắt đầu học tiếng Anh dễ dàng hơn, vui hơn, hiệu quả hơn.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'NXB Khoa Học & Kỹ Thuật', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'NXB Khoa Học & Kỹ Thuật', 30, 82000, 500)
INSERT [dbo].[Product] ([CategoryId], [ProductName], [Image], [Description], [CreatedDate], [IssuingCompany], [PublicationDate], [CoverTypeId], [PublishingCompany], [Quantity], [Price], [NumberPage]) VALUES (4, N'Access Grade 9 Workbook', N'accessgrade.jpg', N'Giáo trình ACCESS – Lớp 6-9 là bộ giáo trình tiếng Anh được thiết kế dành riêng cho học sinh đang học tiếng Anh tại các trường Trung học Cơ sở, chương trình tiếng Anh tăng cường, dựa trên phương pháp Tổng hợp ngôn ngữ.Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu.', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), N'Đại Trường Phát', CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), 2, N'Oxford University Press', 5, 150000, 444)


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
INSERT [dbo].[OrderStatus] ([Description]) VALUES (N'Cancel')
GO
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Nguyen Van An','an@gmail.com', '0111111111')
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Phan Van Be','bgio@gmail.com', '0111112222')
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Pham Van Bach','vlback@gmail.com', '0111111111')
INSERT [dbo].[Shipper] ([ShipperName], [Email], [Phone]) VALUES ('Nguyen Thai Binh','binhnv@gmail.com', '0111112222')
GO
INSERT [dbo].[Order] ([ShipperId], [AccountId], [OrderDate], [ReceiptDate], [Total], [StatusId]) VALUES (1, 2, CAST(N'2022-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-29T00:00:00.0000000' AS DateTime2), 24.0000, 1)

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
CREATE PROCEDURE procedure_decrease_coupon
	 (@id varchar(10))
AS
BEGIN
	DECLARE @total int;
SET @total=(SELECT Quantity FROM Coupon WHERE CouponID LIKE @id);
UPDATE Coupon 
SET Quantity=@total-1
WHERE CouponID LIKE @id
END
GO