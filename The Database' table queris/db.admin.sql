USE [MaersklineDatabase]
GO

/****** Object:  Table [dbo].[Admin]    Script Date: 3/14/2017 4:21:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Admin](
	[email] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[referer] [varchar](15) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


