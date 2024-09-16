CREATE TABLE [dbo].[umbracoWebhook2ContentTypeKeys] (
    [webhookId] INT              NOT NULL,
    [entityKey] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_webhookEntityKey2Webhook] PRIMARY KEY CLUSTERED ([webhookId] ASC, [entityKey] ASC),
    CONSTRAINT [FK_umbracoWebhook2ContentTypeKeys_umbracoWebhook_id] FOREIGN KEY ([webhookId]) REFERENCES [dbo].[umbracoWebhook] ([id]) ON DELETE CASCADE
);

