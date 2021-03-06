USE [master]
GO
/****** Object:  Database [Ski_resort]    Script Date: 24.06.2022 15:11:32 ******/
CREATE DATABASE [Ski_resort]
GO
USE [Ski_resort]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 24.06.2022 15:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Client_code] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Patronymic] [nvarchar](255) NULL,
	[Passport_series] [int] NULL,
	[Passport_number] [int] NULL,
	[Birthday_date] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
 CONSTRAINT [PK__Clients$__AF7A20283A994ED9] PRIMARY KEY CLUSTERED 
(
	[Client_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24.06.2022 15:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_code] [nvarchar](255) NULL,
	[Create_date] [date] NULL,
	[Order_time] [time](7) NULL,
	[Client_code] [int] NULL,
	[Status] [nvarchar](255) NULL,
	[Close_date] [date] NULL,
	[Rental_time] [int] NULL,
 CONSTRAINT [PK__Orders$__3214EC27D813C7EB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Services]    Script Date: 24.06.2022 15:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NULL,
	[Service_ID] [int] NULL,
 CONSTRAINT [PK_Orders_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 24.06.2022 15:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] NOT NULL,
	[Service_name] [nvarchar](255) NULL,
	[Service_code] [nvarchar](255) NULL,
	[Cost] [int] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 24.06.2022 15:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Post] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Patronymic] [nvarchar](255) NULL,
	[Login] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Last_entry] [smalldatetime] NULL,
	[Entry_type] [nvarchar](255) NULL,
	[Preview] [varbinary](max) NULL,
 CONSTRAINT [PK__Staff$__3214EC273A2FFEBE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([Client_code])
REFERENCES [dbo].[Clients] ([Client_code])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders_Services]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Services_Orders] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Orders_Services] CHECK CONSTRAINT [FK_Orders_Services_Orders]
GO
ALTER TABLE [dbo].[Orders_Services]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Services_Services] FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[Orders_Services] CHECK CONSTRAINT [FK_Orders_Services_Services]
GO
USE [master]
GO
ALTER DATABASE [Ski_resort] SET  READ_WRITE 
GO
