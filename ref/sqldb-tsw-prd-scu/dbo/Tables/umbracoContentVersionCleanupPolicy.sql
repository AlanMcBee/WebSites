CREATE TABLE [dbo].[umbracoContentVersionCleanupPolicy] (
    [contentTypeId]                  INT      NOT NULL,
    [preventCleanup]                 BIT      NOT NULL,
    [keepAllVersionsNewerThanDays]   INT      NULL,
    [keepLatestVersionPerDayForDays] INT      NULL,
    [updated]                        DATETIME NOT NULL,
    CONSTRAINT [PK_umbracoContentVersionCleanupPolicy] PRIMARY KEY CLUSTERED ([contentTypeId] ASC),
    CONSTRAINT [FK_umbracoContentVersionCleanupPolicy_cmsContentType_nodeId] FOREIGN KEY ([contentTypeId]) REFERENCES [dbo].[cmsContentType] ([nodeId])
);

