CREATE TABLE [dbo].[umbracoWebhookRequest] (
    [id]            INT              IDENTITY (1, 1) NOT NULL,
    [webhookKey]    UNIQUEIDENTIFIER NOT NULL,
    [eventName]     NVARCHAR (255)   NOT NULL,
    [requestObject] NVARCHAR (MAX)   NULL,
    [retryCount]    INT              NOT NULL,
    CONSTRAINT [PK_umbracoWebhookRequest] PRIMARY KEY CLUSTERED ([id] ASC)
);

