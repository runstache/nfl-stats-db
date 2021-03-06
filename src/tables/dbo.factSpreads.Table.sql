/****** Object:  Table [dbo].[factSpreads]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factSpreads](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WeekNumber] [int] NOT NULL,
	[YearValue] [int] NOT NULL,
	[Season] [varchar](25) NOT NULL,
	[HomeTeam] [varchar](150) NOT NULL,
	[HomeTeamRank] [float] NOT NULL,
	[HomeTeamAvgPoints] [int] NOT NULL,
	[AwayTeam] [varchar](150) NOT NULL,
	[AwayTeamRank] [float] NOT NULL,
	[AwayTeamAvgPoints] [int] NOT NULL,
	[SpreadHome] [float] NOT NULL,
	[SpreadAway] [float] NOT NULL,
	[OverUnder] [int] NOT NULL,
 CONSTRAINT [PK_factSpreads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
