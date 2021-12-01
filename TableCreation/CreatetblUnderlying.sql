CREATE TABLE [dbo].[tblUnderlying](
	[idUnderlying] [int] IDENTITY(1,1) NOT NULL,
	[underlyingName] [varchar](max) NULL,
	[idUnderlyingProduct] [int] NOT NULL,
	[spot] [float] NOT NULL,
 CONSTRAINT [PK_tblUnderlying] PRIMARY KEY CLUSTERED 
(
	[idUnderlying] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblUnderlying]  WITH CHECK ADD  CONSTRAINT [FK_tblUnderlying_tblProduct] FOREIGN KEY([idUnderlyingProduct])
REFERENCES [dbo].[tblProduct] ([idProduct])
GO

ALTER TABLE [dbo].[tblUnderlying] CHECK CONSTRAINT [FK_tblUnderlying_tblProduct]
GO


