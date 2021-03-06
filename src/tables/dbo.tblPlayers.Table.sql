/****** Object:  Table [dbo].[tblPlayers]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPlayers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](255) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Dob] [date] NULL,
	[Position] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblPlayers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
