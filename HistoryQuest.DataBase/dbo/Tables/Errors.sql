CREATE TABLE [dbo].[Errors] (
    [id]             INT            IDENTITY (1, 1) NOT NULL,
    [ErrorText]      NVARCHAR (MAX) NULL,
    [InnerErrorText] NVARCHAR (MAX) NULL,
    [DateTime]       DATETIME       NOT NULL,
    [StackTrace] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK_Errors] PRIMARY KEY CLUSTERED ([id] ASC)
);



