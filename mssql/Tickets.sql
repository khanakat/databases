USE [Tickets]
GO
/****** Object:  Table [dbo].[Place] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Place](
	[id] [int] IDENTITY(1,1) NOT NULL,
    [zoneId] [int] NOT NULL,
	[number] [varchar](50) NOT NULL,	
	[row] [int] NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventId] [int] NULL,
	[placeId] [int] NULL,
	[paymentDate] [datetime] NULL,
	[customerName] [varchar](100) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Event] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Event_Price]    Script Date: 12/10/2019 13:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zoneId] [int] NULL,
	[eventId] [int] NULL,
	[price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Event_Price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zone]    Script Date: 12/10/2019 13:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Zone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Place]  WITH CHECK ADD  CONSTRAINT [FK_Place_Zone] FOREIGN KEY([zoneId])
REFERENCES [dbo].[Zone] ([id])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_Zone]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Place] FOREIGN KEY([placeId])
REFERENCES [dbo].[Place] ([id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Place]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Event] FOREIGN KEY([eventId])
REFERENCES [dbo].[Event] ([id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Event]
GO
ALTER TABLE [dbo].[Event_Price]  WITH CHECK ADD  CONSTRAINT [FK_Event_Price_Event] FOREIGN KEY([eventId])
REFERENCES [dbo].[Event] ([id])
GO
ALTER TABLE [dbo].[Event_Price] CHECK CONSTRAINT [FK_Event_Price_Event]
GO
ALTER TABLE [dbo].[Event_Price]  WITH CHECK ADD  CONSTRAINT [FK_Event_Price_Zone] FOREIGN KEY([zoneId])
REFERENCES [dbo].[Zone] ([id])
GO
ALTER TABLE [dbo].[Event_Price] CHECK CONSTRAINT [FK_Event_Price_Zone]
GO