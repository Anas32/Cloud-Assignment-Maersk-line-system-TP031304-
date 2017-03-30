USE [MaersklineDatabase]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 3/14/2017 4:22:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pID] [varchar](15) NULL,
	[email] [varchar](50) NULL,
	[weght] [varchar](30) NULL,
	[fone] [varchar](20) NULL,
	[package_Value] [varchar](30) NULL,
	[routename] [varchar](50) NULL,
	[stat] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


