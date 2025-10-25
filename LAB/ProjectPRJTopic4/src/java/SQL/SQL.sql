USE [master]
GO
/****** Object:  Database [Project_PRJ301_Topic4]    Script Date: 24/10/2025 9:29:39 SA ******/
CREATE DATABASE [Project_PRJ301_Topic4]
ALTER DATABASE [Project_PRJ301_Topic4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_PRJ301_Topic4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET  MULTI_USER 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project_PRJ301_Topic4]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountId] [nvarchar](50) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NULL,
	[roleId] [int] NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[rating] [int] NULL,
	[createdAt] [datetime] NULL,
	[recipeId] [int] NOT NULL,
	[accountId] [nvarchar](50) NOT NULL,
	[parentCommentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[accountId] [nvarchar](50) NOT NULL,
	[recipeId] [int] NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC,
	[recipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[accountId] [nvarchar](50) NOT NULL,
	[recipeId] [int] NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC,
	[recipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[recipeId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[ingredients] [nvarchar](max) NOT NULL,
	[steps] [nvarchar](max) NOT NULL,
	[image] [nvarchar](255) NULL,
	[cookingTime] [int] NULL,
	[difficulty] [nvarchar](50) NULL,
	[createdAt] [datetime] NULL,
	[accountId] [nvarchar](50) NOT NULL,
	[categoryId] [int] NOT NULL,
	[isActive] [bit] NULL,
	[servings] [int] NULL,
	[videoUrl] [nvarchar](255) NULL,
	[viewCount] [int] NULL,
	[likeCount] [int] NULL,
 CONSTRAINT [PK__Recipes__C114EE830814952B] PRIMARY KEY CLUSTERED 
(
	[recipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 24/10/2025 9:29:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[accountId] [nvarchar](50) NOT NULL,
	[displayName] [nvarchar](100) NULL,
	[avatar] [nvarchar](255) NULL,
	[bio] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([accountId], [username], [password], [email], [roleId], [createdAt]) VALUES (N'1', N'phatmvp', N'123', N'phat@gmail.com', 1, CAST(N'2002-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Accounts] ([accountId], [username], [password], [email], [roleId], [createdAt]) VALUES (N'101', N'chef_anh', N'123456', N'anh@example.com', 2, CAST(N'2025-10-17T09:00:38.937' AS DateTime))
INSERT [dbo].[Accounts] ([accountId], [username], [password], [email], [roleId], [createdAt]) VALUES (N'102', N'cook_mai', N'123456', N'cook.mai@example.com', 2, CAST(N'2025-10-17T09:00:38.937' AS DateTime))
INSERT [dbo].[Accounts] ([accountId], [username], [password], [email], [roleId], [createdAt]) VALUES (N'103', N'homechef_viet', N'123456', N'viet.chef@example.com', 2, CAST(N'2025-10-17T09:00:38.937' AS DateTime))
INSERT [dbo].[Accounts] ([accountId], [username], [password], [email], [roleId], [createdAt]) VALUES (N'2', N'phat1', N'123', N'phat1@gmail.com', 2, CAST(N'2003-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Accounts] ([accountId], [username], [password], [email], [roleId], [createdAt]) VALUES (N'9MNMTQYA', N'Vũ Chu Bin', N'123', N'binbeo@gmail.com', 2, CAST(N'2025-10-20T20:36:34.840' AS DateTime))
INSERT [dbo].[Accounts] ([accountId], [username], [password], [email], [roleId], [createdAt]) VALUES (N'OGL2JY5B', N'phatmvp', N'123', N'phatmvp@gmail.com', 2, CAST(N'2025-10-19T15:36:50.793' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (1, N'Đồ Âu')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (2, N'Món Ngon Mỗi Ngày')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (3, N'Món cơm')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (4, N'Món canh')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (5, N'Món nước')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (6, N'Món bún')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (7, N'Món kho')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (8, N'Món chiên')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (9, N'Món cháo')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (10, N'Món xào')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (11, N'Món cuốn')
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (12, N'Thức uống')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([commentId], [content], [rating], [createdAt], [recipeId], [accountId], [parentCommentId]) VALUES (2, N'Món này rất ngon và dễ làm, cả nhà mình đều thích!', 5, CAST(N'2025-10-17T09:06:56.297' AS DateTime), 5, N'101', NULL)
INSERT [dbo].[Comments] ([commentId], [content], [rating], [createdAt], [recipeId], [accountId], [parentCommentId]) VALUES (3, N'Món này rất ngon và dễ làm, cả nhà mình đều thích!', 5, CAST(N'2025-10-17T09:07:29.220' AS DateTime), 3, N'102', NULL)
INSERT [dbo].[Comments] ([commentId], [content], [rating], [createdAt], [recipeId], [accountId], [parentCommentId]) VALUES (4, N'Món này rất ngon và dễ làm, cả nhà mình đều thích!', 5, CAST(N'2025-10-17T09:07:39.993' AS DateTime), 3, N'101', NULL)
INSERT [dbo].[Comments] ([commentId], [content], [rating], [createdAt], [recipeId], [accountId], [parentCommentId]) VALUES (5, N'Món này rất ngon và dễ làm, cả nhà mình đều thích!', 5, CAST(N'2025-10-17T09:07:47.663' AS DateTime), 3, N'103', NULL)
INSERT [dbo].[Comments] ([commentId], [content], [rating], [createdAt], [recipeId], [accountId], [parentCommentId]) VALUES (6, N'Hương vị đậm đà, nhưng mình giảm bớt muối thì ngon hơn.', 4, CAST(N'2025-10-17T09:08:31.553' AS DateTime), 4, N'103', NULL)
INSERT [dbo].[Comments] ([commentId], [content], [rating], [createdAt], [recipeId], [accountId], [parentCommentId]) VALUES (7, N'Hương vị đậm đà, nhưng mình giảm bớt muối thì ngon hơn.', 4, CAST(N'2025-10-17T09:08:38.410' AS DateTime), 4, N'101', NULL)
INSERT [dbo].[Comments] ([commentId], [content], [rating], [createdAt], [recipeId], [accountId], [parentCommentId]) VALUES (8, N'Hương vị đậm đà', 4, CAST(N'2025-10-17T09:08:53.133' AS DateTime), 4, N'102', NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
INSERT [dbo].[Favorites] ([accountId], [recipeId], [createdAt]) VALUES (N'101', 3, CAST(N'2025-10-17T09:03:57.300' AS DateTime))
INSERT [dbo].[Favorites] ([accountId], [recipeId], [createdAt]) VALUES (N'101', 4, CAST(N'2025-10-17T09:03:57.300' AS DateTime))
INSERT [dbo].[Favorites] ([accountId], [recipeId], [createdAt]) VALUES (N'101', 5, CAST(N'2025-10-17T09:03:57.300' AS DateTime))
INSERT [dbo].[Favorites] ([accountId], [recipeId], [createdAt]) VALUES (N'102', 14, CAST(N'2025-10-17T09:04:32.850' AS DateTime))
INSERT [dbo].[Favorites] ([accountId], [recipeId], [createdAt]) VALUES (N'102', 18, CAST(N'2025-10-17T09:04:32.850' AS DateTime))
INSERT [dbo].[Favorites] ([accountId], [recipeId], [createdAt]) VALUES (N'102', 19, CAST(N'2025-10-17T09:04:32.850' AS DateTime))
GO
INSERT [dbo].[Likes] ([accountId], [recipeId], [createdAt]) VALUES (N'1', 3, CAST(N'2025-10-09T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Recipes] ON 

INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (3, N'Thịt Kho', N'adssa', N'sadsa', N'ád', 10, N'1', CAST(N'2025-10-01T00:00:00.000' AS DateTime), N'1', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (4, N'Cơm chiên trứng', N'Cơm, trứng, hành lá, nước mắm, dầu ăn', N'1. Đánh trứng. 2. Chiên trứng và cơm. 3. Nêm gia vị.', N'/images/fried_rice.jpg', 15, N'Dễ', CAST(N'2025-10-17T08:48:22.030' AS DateTime), N'1', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (5, N'Canh chua cá lóc', N'Cá lóc, me, cà chua, dứa, rau thơm', N'1. Nấu nước dùng. 2. Cho cá và rau vào. 3. Nêm chua ngọt vừa ăn.', N'/images/sour_fish_soup.jpg', 25, N'Trung bình', CAST(N'2025-10-17T08:48:22.030' AS DateTime), N'2', 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (14, N'Canh chua cá lóc', N'Cá lóc, me, cà chua, dứa, rau thơm', N'1. Nấu nước dùng. 2. Cho cá và rau vào. 3. Nêm chua ngọt vừa ăn.', N'/images/sour_fish_soup.jpg', 25, N'Trung bình', CAST(N'2025-10-17T08:48:29.533' AS DateTime), N'2', 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (18, N'Cơm chiên trứng', N'Cơm, trứng, hành lá, nước mắm, dầu ăn', N'1. Đánh trứng. 2. Chiên trứng và cơm. 3. Nêm gia vị.', N'/images/fried_rice.jpg', 15, N'Dễ', CAST(N'2025-10-17T08:57:38.740' AS DateTime), N'1', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (19, N'Canh chua cá lóc', N'Cá lóc, me, cà chua, dứa, rau thơm', N'1. Nấu nước dùng. 2. Cho cá và rau vào. 3. Nêm chua ngọt vừa ăn.', N'/images/sour_fish_soup.jpg', 25, N'Trung bình', CAST(N'2025-10-17T08:57:38.740' AS DateTime), N'2', 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (21, N'Bún thịt nướng', N'Thịt heo, bún, rau sống, nước mắm', N'1. Ướp thịt và nướng. 2. Chuẩn bị bún và rau. 3. Chan nước mắm.', N'/images/bun_thit_nuong.jpg', 30, N'Trung bình', CAST(N'2025-10-17T08:57:38.740' AS DateTime), N'1', 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (22, N'Gà kho gừng', N'Thịt gà, gừng, nước mắm, tiêu, hành', N'1. Ướp gà. 2. Kho với gừng và gia vị. 3. Rim cho sánh nước.', N'/images/ga_kho_gung.jpg', 40, N'Trung bình', CAST(N'2025-10-17T08:57:38.740' AS DateTime), N'2', 5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (24, N'Cháo gà', N'Gạo, thịt gà, hành, tiêu, gừng', N'1. Luộc gà. 2. Nấu cháo. 3. Xé gà cho vào cháo và nêm nếm.', N'/images/chao_ga.jpg', 50, N'Dễ', CAST(N'2025-10-17T08:57:38.740' AS DateTime), N'1', 7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (25, N'Mì xào bò', N'Mì, thịt bò, rau cải, tỏi, dầu hào', N'1. Xào thịt bò. 2. Cho mì và rau vào xào chung. 3. Nêm gia vị.', N'/images/mi_xao_bo.jpg', 20, N'Dễ', CAST(N'2025-10-17T08:57:38.740' AS DateTime), N'2', 8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Recipes] ([recipeId], [title], [ingredients], [steps], [image], [cookingTime], [difficulty], [createdAt], [accountId], [categoryId], [isActive], [servings], [videoUrl], [viewCount], [likeCount]) VALUES (27, N'Cà phê sữa đá', N'Cà phê, sữa đặc, đá viên', N'1. Pha cà phê. 2. Thêm sữa đặc. 3. Khuấy đều và thêm đá.', N'/images/ca_phe_sua_da.jpg', 5, N'Dễ', CAST(N'2025-10-17T08:57:38.740' AS DateTime), N'1', 10, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Recipes] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[UserProfiles] ([accountId], [displayName], [avatar], [bio]) VALUES (N'1', N'Vũ Đại Phát', NULL, N'Thần Đồng 2k3 ')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E6164F7287774]    Script Date: 24/10/2025 9:29:39 SA ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Favorites] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Recipes] ADD  CONSTRAINT [DF__Recipes__created__4E88ABD4]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Recipes] ADD  DEFAULT ((0)) FOR [viewCount]
GO
ALTER TABLE [dbo].[Recipes] ADD  DEFAULT ((0)) FOR [likeCount]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([parentCommentId])
REFERENCES [dbo].[Comments] ([commentId])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__recipe__5535A963] FOREIGN KEY([recipeId])
REFERENCES [dbo].[Recipes] ([recipeId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK__Comments__recipe__5535A963]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK__Favorites__recip__5AEE82B9] FOREIGN KEY([recipeId])
REFERENCES [dbo].[Recipes] ([recipeId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK__Favorites__recip__5AEE82B9]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([recipeId])
REFERENCES [dbo].[Recipes] ([recipeId])
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK__Recipes__account__4F7CD00D] FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK__Recipes__account__4F7CD00D]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK__Recipes__categor__5070F446] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK__Recipes__categor__5070F446]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [Project_PRJ301_Topic4] SET  READ_WRITE 
GO
ALTER TABLE Accounts ADD avatar nvarchar(255) NULL;
