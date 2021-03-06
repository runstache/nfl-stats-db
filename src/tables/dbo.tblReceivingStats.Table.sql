/****** Object:  Table [dbo].[tblReceivingStats]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReceivingStats](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerId] [bigint] NOT NULL,
	[TeamId] [int] NOT NULL,
	[OpponentId] [int] NOT NULL,
	[Receptions] [int] NOT NULL,
	[Yards] [int] NOT NULL,
	[AveragePerReception] [float] NOT NULL,
	[Touchdowns] [int] NOT NULL,
	[LongestReception] [int] NOT NULL,
	[Targets] [int] NOT NULL,
	[ScheduleId] [bigint] NOT NULL,
 CONSTRAINT [PK_tblReceivingStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idxOpponentId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxOpponentId] ON [dbo].[tblReceivingStats]
(
	[OpponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxPlayerId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxPlayerId] ON [dbo].[tblReceivingStats]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxScheduleId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxScheduleId] ON [dbo].[tblReceivingStats]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxTeamId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxTeamId] ON [dbo].[tblReceivingStats]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblReceivingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblReceivingStats_tblPlayers] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[tblPlayers] ([Id])
GO
ALTER TABLE [dbo].[tblReceivingStats] CHECK CONSTRAINT [FK_tblReceivingStats_tblPlayers]
GO
ALTER TABLE [dbo].[tblReceivingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblReceivingStats_tblSchedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[tblSchedule] ([Id])
GO
ALTER TABLE [dbo].[tblReceivingStats] CHECK CONSTRAINT [FK_tblReceivingStats_tblSchedule]
GO
ALTER TABLE [dbo].[tblReceivingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblReceivingStats_tblTeams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblReceivingStats] CHECK CONSTRAINT [FK_tblReceivingStats_tblTeams]
GO
ALTER TABLE [dbo].[tblReceivingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblReceivingStats_tblTeams1] FOREIGN KEY([OpponentId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblReceivingStats] CHECK CONSTRAINT [FK_tblReceivingStats_tblTeams1]
GO
