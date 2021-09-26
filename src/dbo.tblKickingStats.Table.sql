/****** Object:  Table [dbo].[tblKickingStats]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKickingStats](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerId] [bigint] NOT NULL,
	[TeamId] [int] NOT NULL,
	[OpponentId] [int] NOT NULL,
	[FieldGoals] [int] NOT NULL,
	[Attempts] [int] NOT NULL,
	[LongFieldGoal] [int] NOT NULL,
	[ExtraPoints] [int] NOT NULL,
	[ExtraPointAttempts] [int] NOT NULL,
	[Punts] [int] NOT NULL,
	[PuntTotalYards] [int] NOT NULL,
	[AveragePunt] [float] NOT NULL,
	[Touchbacks] [int] NOT NULL,
	[PuntInsideTwenty] [int] NOT NULL,
	[PuntLongest] [int] NOT NULL,
	[ScheduleId] [bigint] NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_tblKickingStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idxOpponentId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxOpponentId] ON [dbo].[tblKickingStats]
(
	[OpponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxPlayerId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxPlayerId] ON [dbo].[tblKickingStats]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxScheduleId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxScheduleId] ON [dbo].[tblKickingStats]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxTeamId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxTeamId] ON [dbo].[tblKickingStats]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblKickingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblKickingStats_tblPlayers] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[tblPlayers] ([Id])
GO
ALTER TABLE [dbo].[tblKickingStats] CHECK CONSTRAINT [FK_tblKickingStats_tblPlayers]
GO
ALTER TABLE [dbo].[tblKickingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblKickingStats_tblSchedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[tblSchedule] ([Id])
GO
ALTER TABLE [dbo].[tblKickingStats] CHECK CONSTRAINT [FK_tblKickingStats_tblSchedule]
GO
ALTER TABLE [dbo].[tblKickingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblKickingStats_tblTeams] FOREIGN KEY([OpponentId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblKickingStats] CHECK CONSTRAINT [FK_tblKickingStats_tblTeams]
GO
ALTER TABLE [dbo].[tblKickingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblKickingStats_tblTeams1] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblKickingStats] CHECK CONSTRAINT [FK_tblKickingStats_tblTeams1]
GO
