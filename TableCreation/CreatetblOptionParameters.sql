CREATE TABLE [dbo].[tblOptionParameters](
	[idOption] [int] IDENTITY(1,1) NOT NULL,
	[idOptionType] [int] NOT NULL,
	[strike] [float] NOT NULL,
	[riskFreeRate] [float] NOT NULL,
	[maturity] [date] NOT NULL,
	[volatility] [float] NOT NULL,
	[idUnderlying] [int] NOT NULL,
 CONSTRAINT [PK_tblOptionParameters] PRIMARY KEY CLUSTERED 
(
	[idOption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD  CONSTRAINT [FK_tblOptionParameters_tblOptionType] FOREIGN KEY([idOptionType])
REFERENCES [dbo].[tblOptionType] ([idOptionType])
GO

ALTER TABLE [dbo].[tblOptionParameters] CHECK CONSTRAINT [FK_tblOptionParameters_tblOptionType]
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD  CONSTRAINT [FK_tblOptionParameters_tblUnderlying] FOREIGN KEY([idUnderlying])
REFERENCES [dbo].[tblUnderlying] ([idUnderlying])
GO

ALTER TABLE [dbo].[tblOptionParameters] CHECK CONSTRAINT [FK_tblOptionParameters_tblUnderlying]
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([maturity]>getdate()))
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([maturity]>getdate()))
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([riskFreeRate]>(0)))
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([riskFreeRate]>(0)))
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([strike]>(0)))
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([strike]>(0)))
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([volatility]>(0)))
GO

ALTER TABLE [dbo].[tblOptionParameters]  WITH CHECK ADD CHECK  (([volatility]>(0)))
GO


