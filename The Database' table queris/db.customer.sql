USE [MaersklineDatabase]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 3/14/2017 4:22:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Customer](
	[usernm] [varchar](50) NOT NULL,
	[fname] [varchar](50) NOT NULL,
	[lname] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[DOB] [varchar](15) NOT NULL,
	[topup] [varchar](10) NULL,
	[shipment] [varchar](15) NULL,
	[status] [varchar](50) NULL DEFAULT ('ACTIVE')
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


