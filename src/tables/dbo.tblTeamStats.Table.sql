/****** Object:  Table [dbo].[tblTeamStats]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeamStats](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[OpponentId] [int] NOT NULL,
	[PassingFirstDowns] [int] NOT NULL,
	[RushingFirstDowns] [int] NOT NULL,
	[PenaltyFirstDowns] [int] NOT NULL,
	[ThirdDowns] [int] NOT NULL,
	[ThirdDownsConverted] [int] NOT NULL,
	[FourthDownAttempt] [int] NOT NULL,
	[FourthDownConverted] [int] NOT NULL,
	[TotalPlays] [int] NOT NULL,
	[TotalYards] [int] NOT NULL,
	[TotalDrives] [int] NOT NULL,
	[YardsPerPlay] [float] NOT NULL,
	[PassingAttempts] [int] NOT NULL,
	[PassingCompletions] [int] NOT NULL,
	[YardsPerPass] [float] NOT NULL,
	[PassingYards] [int] NOT NULL,
	[PassOverFifteen] [int] NOT NULL,
	[Interceptions] [int] NOT NULL,
	[RushingAttempts] [int] NOT NULL,
	[YardsPerRush] [float] NOT NULL,
	[RushingYards] [int] NOT NULL,
	[RushOverTen] [int] NOT NULL,
	[RedzoneAttempts] [int] NOT NULL,
	[RedzoneConverted] [int] NOT NULL,
	[FumblesLost] [int] NOT NULL,
	[TotalTurnovers] [int] NOT NULL,
	[DefensiveTouchdowns] [int] NOT NULL,
	[TimeOfPossession] [bigint] NOT NULL,
	[PointsScored] [int] NOT NULL,
	[PointsAllowed] [int] NOT NULL,
	[ScheduleId] [bigint] NOT NULL,
	[Penalties] [int] NOT NULL,
	[PenaltyYards] [int] NOT NULL,
	[Sacks] [int] NOT NULL,
	[SackYardsLost] [int] NOT NULL,
 CONSTRAINT [PK_tblTeamStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idxOpponentId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxOpponentId] ON [dbo].[tblTeamStats]
(
	[OpponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxScheduleId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxScheduleId] ON [dbo].[tblTeamStats]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxTeamId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxTeamId] ON [dbo].[tblTeamStats]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTeamStats]  WITH CHECK ADD  CONSTRAINT [FK_tblTeamStats_tblSchedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[tblSchedule] ([Id])
GO
ALTER TABLE [dbo].[tblTeamStats] CHECK CONSTRAINT [FK_tblTeamStats_tblSchedule]
GO
ALTER TABLE [dbo].[tblTeamStats]  WITH CHECK ADD  CONSTRAINT [FK_tblTeamStats_tblTeams] FOREIGN KEY([OpponentId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblTeamStats] CHECK CONSTRAINT [FK_tblTeamStats_tblTeams]
GO
ALTER TABLE [dbo].[tblTeamStats]  WITH CHECK ADD  CONSTRAINT [FK_tblTeamStats_tblTeams1] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblTeamStats] CHECK CONSTRAINT [FK_tblTeamStats_tblTeams1]
GO
