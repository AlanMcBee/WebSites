CREATE TABLE [dbo].[umbracoUserGroup2Permission] (
    [id]           INT              IDENTITY (1, 1) NOT NULL,
    [userGroupKey] UNIQUEIDENTIFIER NOT NULL,
    [permission]   NVARCHAR (255)   NOT NULL,
    CONSTRAINT [PK_userGroup2Permission] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_umbracoUserGroup2Permission_umbracoUserGroup_key] FOREIGN KEY ([userGroupKey]) REFERENCES [dbo].[umbracoUserGroup] ([key])
);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoUserGroup2Permission_userGroupKey]
    ON [dbo].[umbracoUserGroup2Permission]([userGroupKey] ASC)
    INCLUDE([permission]);

