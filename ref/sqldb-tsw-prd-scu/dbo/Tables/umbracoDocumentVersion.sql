CREATE TABLE [dbo].[umbracoDocumentVersion] (
    [id]         INT NOT NULL,
    [templateId] INT NULL,
    [published]  BIT NOT NULL,
    CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY ([templateId]) REFERENCES [dbo].[cmsTemplate] ([nodeId]),
    CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY ([id]) REFERENCES [dbo].[umbracoContentVersion] ([id])
);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentVersion_id_published]
    ON [dbo].[umbracoDocumentVersion]([id] ASC, [published] ASC)
    INCLUDE([templateId]);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentVersion_published]
    ON [dbo].[umbracoDocumentVersion]([published] ASC)
    INCLUDE([id], [templateId]);

