CREATE TABLE [dbo].[umbracoOpenIddictScopes] (
    [Id]               NVARCHAR (450) NOT NULL,
    [ConcurrencyToken] NVARCHAR (50)  NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [Descriptions]     NVARCHAR (MAX) NULL,
    [DisplayName]      NVARCHAR (MAX) NULL,
    [DisplayNames]     NVARCHAR (MAX) NULL,
    [Name]             NVARCHAR (200) NULL,
    [Properties]       NVARCHAR (MAX) NULL,
    [Resources]        NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_umbracoOpenIddictScopes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoOpenIddictScopes_Name]
    ON [dbo].[umbracoOpenIddictScopes]([Name] ASC) WHERE ([Name] IS NOT NULL);

