/****** Object:  Table [dbo].[tblSchedule]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSchedule](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[OpponentId] [int] NOT NULL,
	[YearValue] [int] NOT NULL,
	[WeekNumber] [int] NOT NULL,
	[GameId] [bigint] NOT NULL,
	[TypeId] [int] NOT NULL,
	[IsHome] [bit] NOT NULL,
 CONSTRAINT [PK_tblSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idxOpponentId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxOpponentId] ON [dbo].[tblSchedule]
(
	[OpponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxTeamId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxTeamId] ON [dbo].[tblSchedule]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblTeams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblSchedule] CHECK CONSTRAINT [FK_tblSchedule_tblTeams]
GO
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblTeams1] FOREIGN KEY([OpponentId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblSchedule] CHECK CONSTRAINT [FK_tblSchedule_tblTeams1]
GO
