CREATE TABLE [dbo].[tblPrice](
	[idPrice] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NOT NULL,
	[idModel] [int] NOT NULL,
	[idOption] [int] NOT NULL,
 CONSTRAINT [PK_tbl.Price] PRIMARY KEY CLUSTERED 
(
	[idPrice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblPrice]  WITH CHECK ADD FOREIGN KEY([idModel])
REFERENCES [dbo].[tblPricingModel] ([idPricingModel])
GO

ALTER TABLE [dbo].[tblPrice]  WITH CHECK ADD  CONSTRAINT [FK_tblPrice_tblOptionParameters] FOREIGN KEY([idOption])
REFERENCES [dbo].[tblOptionParameters] ([idOption])
GO

ALTER TABLE [dbo].[tblPrice] CHECK CONSTRAINT [FK_tblPrice_tblOptionParameters]
GO


