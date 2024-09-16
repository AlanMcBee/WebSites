CREATE TABLE [dbo].[umbracoOpenIddictTokens] (
    [Id]               NVARCHAR (450) NOT NULL,
    [ApplicationId]    NVARCHAR (450) NULL,
    [AuthorizationId]  NVARCHAR (450) NULL,
    [ConcurrencyToken] NVARCHAR (50)  NULL,
    [CreationDate]     DATETIME2 (7)  NULL,
    [ExpirationDate]   DATETIME2 (7)  NULL,
    [Payload]          NVARCHAR (MAX) NULL,
    [Properties]       NVARCHAR (MAX) NULL,
    [RedemptionDate]   DATETIME2 (7)  NULL,
    [ReferenceId]      NVARCHAR (100) NULL,
    [Status]           NVARCHAR (50)  NULL,
    [Subject]          NVARCHAR (400) NULL,
    [Type]             NVARCHAR (50)  NULL,
    CONSTRAINT [PK_umbracoOpenIddictTokens] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_umbracoOpenIddictTokens_umbracoOpenIddictApplications_ApplicationId] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[umbracoOpenIddictApplications] ([Id]),
    CONSTRAINT [FK_umbracoOpenIddictTokens_umbracoOpenIddictAuthorizations_AuthorizationId] FOREIGN KEY ([AuthorizationId]) REFERENCES [dbo].[umbracoOpenIddictAuthorizations] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoOpenIddictTokens_ApplicationId_Status_Subject_Type]
    ON [dbo].[umbracoOpenIddictTokens]([ApplicationId] ASC, [Status] ASC, [Subject] ASC, [Type] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoOpenIddictTokens_AuthorizationId]
    ON [dbo].[umbracoOpenIddictTokens]([AuthorizationId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoOpenIddictTokens_ReferenceId]
    ON [dbo].[umbracoOpenIddictTokens]([ReferenceId] ASC) WHERE ([ReferenceId] IS NOT NULL);

