CREATE TABLE [dbo].[umbracoWebhook2Events] (
    [webhookId] INT            NOT NULL,
    [event]     NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_webhookEvent2WebhookDto] PRIMARY KEY CLUSTERED ([webhookId] ASC, [event] ASC),
    CONSTRAINT [FK_umbracoWebhook2Events_umbracoWebhook_id] FOREIGN KEY ([webhookId]) REFERENCES [dbo].[umbracoWebhook] ([id]) ON DELETE CASCADE
);

