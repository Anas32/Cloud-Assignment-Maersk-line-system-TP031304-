USE [MaersklineDatabase]
GO

/****** Object:  Table [dbo].[Shipment]    Script Date: 3/14/2017 4:24:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Shipment](
	[PackageID] [varchar](15) NOT NULL,
	[email] [varchar](50) NULL,
	[weght] [varchar](20) NULL,
	[phone] [varchar](15) NULL,
	[value] [varchar](10) NULL,
	[number] [varchar](10) NULL,
	[Price] [varchar](30) NULL,
	[status] [varchar](50) NULL DEFAULT ('In_Yard'),
PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


