CREATE TABLE [dbo].[umbracoUserGroup2Language] (
    [userGroupId] INT NOT NULL,
    [languageId]  INT NOT NULL,
    CONSTRAINT [PK_userGroup2language] PRIMARY KEY CLUSTERED ([userGroupId] ASC, [languageId] ASC),
    CONSTRAINT [FK_umbracoUserGroup2Language_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [dbo].[umbracoLanguage] ([id]) ON DELETE CASCADE,
    CONSTRAINT [FK_umbracoUserGroup2Language_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [dbo].[umbracoUserGroup] ([id]) ON DELETE CASCADE
);

