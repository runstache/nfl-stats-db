/****** Object:  Table [dbo].[tblRosterEntries]    Script Date: 9/26/2021 1:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRosterEntries](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerId] [bigint] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_tblRosterEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idxPlayerId]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxPlayerId] ON [dbo].[tblRosterEntries]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxTeam]    Script Date: 9/26/2021 1:51:27 PM ******/
CREATE NONCLUSTERED INDEX [idxTeam] ON [dbo].[tblRosterEntries]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRosterEntries]  WITH CHECK ADD  CONSTRAINT [FK_tblRosterEntries_tblPlayers] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[tblPlayers] ([Id])
GO
ALTER TABLE [dbo].[tblRosterEntries] CHECK CONSTRAINT [FK_tblRosterEntries_tblPlayers]
GO
ALTER TABLE [dbo].[tblRosterEntries]  WITH CHECK ADD  CONSTRAINT [FK_tblRosterEntries_tblTeams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeams] ([Id])
GO
ALTER TABLE [dbo].[tblRosterEntries] CHECK CONSTRAINT [FK_tblRosterEntries_tblTeams]
GO
