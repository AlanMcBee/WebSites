CREATE TABLE [dbo].[umbracoWebhook2Headers] (
    [webhookId] INT            NOT NULL,
    [Key]       NVARCHAR (255) NOT NULL,
    [Value]     NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_heaeders2WebhookDto] PRIMARY KEY CLUSTERED ([webhookId] ASC, [Key] ASC),
    CONSTRAINT [FK_umbracoWebhook2Headers_umbracoWebhook_id] FOREIGN KEY ([webhookId]) REFERENCES [dbo].[umbracoWebhook] ([id]) ON DELETE CASCADE
);

