/****** Object:  Table [dbo].[tblPassingStats]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPassingStats](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerId] [bigint] NOT NULL,
	[TeamId] [int] NOT NULL,
	[OpponentId] [int] NOT NULL,
	[Completions] [int] NOT NULL,
	[Attempts] [int] NOT NULL,
	[Yards] [int] NOT NULL,
	[AveragePerAttempt] [float] NOT NULL,
	[Touchdowns] [int] NOT NULL,
	[Interceptions] [int] NOT NULL,
	[Sacks] [int] NOT NULL,
	[Qbr] [float] NOT NULL,
	[Rating] [float] NOT NULL,
	[ScheduleId] [bigint] NOT NULL,
 CONSTRAINT [PK_tblPassingStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idxOpponentId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxOpponentId] ON [dbo].[tblPassingStats]
(
	[OpponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxPlayerId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxPlayerId] ON [dbo].[tblPassingStats]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxScheduleId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxScheduleId] ON [dbo].[tblPassingStats]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxTeamId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxTeamId] ON [dbo].[tblPassingStats]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPassingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblPassingStats_tblPlayers] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[tblPlayers] ([Id])
GO
ALTER TABLE [dbo].[tblPassingStats] CHECK CONSTRAINT [FK_tblPassingStats_tblPlayers]
GO
ALTER TABLE [dbo].[tblPassingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblPassingStats_tblSchedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[tblSchedule] ([Id])
GO
ALTER TABLE [dbo].[tblPassingStats] CHECK CONSTRAINT [FK_tblPassingStats_tblSchedule]
GO
ALTER TABLE [dbo].[tblPassingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblPassingStats_tblTeams] FOREIGN KEY([OpponentId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblPassingStats] CHECK CONSTRAINT [FK_tblPassingStats_tblTeams]
GO
ALTER TABLE [dbo].[tblPassingStats]  WITH CHECK ADD  CONSTRAINT [FK_tblPassingStats_tblTeams1] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblPassingStats] CHECK CONSTRAINT [FK_tblPassingStats_tblTeams1]
GO
