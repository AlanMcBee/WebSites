CREATE TABLE [dbo].[umbracoWebhookLog] (
    [id]               INT              IDENTITY (1, 1) NOT NULL,
    [webhookKey]       UNIQUEIDENTIFIER NOT NULL,
    [key]              UNIQUEIDENTIFIER NOT NULL,
    [statusCode]       NVARCHAR (255)   NOT NULL,
    [date]             DATETIME         NOT NULL,
    [eventAlias]       NVARCHAR (255)   NOT NULL,
    [retryCount]       INT              NOT NULL,
    [requestHeaders]   NVARCHAR (MAX)   NOT NULL,
    [requestBody]      NVARCHAR (MAX)   NOT NULL,
    [responseHeaders]  NVARCHAR (MAX)   NOT NULL,
    [responseBody]     NVARCHAR (MAX)   NOT NULL,
    [exceptionOccured] BIT              NOT NULL,
    [url]              NVARCHAR (MAX)   NOT NULL,
    CONSTRAINT [PK_umbracoWebhookLog] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoWebhookLog_date]
    ON [dbo].[umbracoWebhookLog]([date] ASC);

