CREATE TABLE [dbo].[cmsContentNu] (
    [nodeId]    INT             NOT NULL,
    [published] BIT             NOT NULL,
    [data]      NVARCHAR (MAX)  NULL,
    [rv]        BIGINT          NOT NULL,
    [dataRaw]   VARBINARY (MAX) NULL,
    CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED ([nodeId] ASC, [published] ASC),
    CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoContent] ([nodeId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_cmsContentNu_published]
    ON [dbo].[cmsContentNu]([published] ASC, [nodeId] ASC, [rv] ASC)
    INCLUDE([dataRaw]);

