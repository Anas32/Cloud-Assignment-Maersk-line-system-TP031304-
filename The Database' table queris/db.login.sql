USE [MaersklineDatabase]
GO

/****** Object:  Table [dbo].[Login]    Script Date: 3/14/2017 4:20:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Login](
	[usernm] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[type] [varchar](15) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


