CREATE TABLE [dbo].[umbracoUserGroup2GranularPermission] (
    [id]           INT              IDENTITY (1, 1) NOT NULL,
    [userGroupKey] UNIQUEIDENTIFIER NOT NULL,
    [uniqueId]     UNIQUEIDENTIFIER NULL,
    [permission]   NVARCHAR (255)   NOT NULL,
    [context]      NVARCHAR (255)   NOT NULL,
    CONSTRAINT [PK_umbracoUserGroup2GranularPermissionDto] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_umbracoUserGroup2GranularPermission_umbracoNode_uniqueId] FOREIGN KEY ([uniqueId]) REFERENCES [dbo].[umbracoNode] ([uniqueId]),
    CONSTRAINT [FK_umbracoUserGroup2GranularPermission_umbracoUserGroup_key] FOREIGN KEY ([userGroupKey]) REFERENCES [dbo].[umbracoUserGroup] ([key])
);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoUserGroup2GranularPermissionDto_UniqueId]
    ON [dbo].[umbracoUserGroup2GranularPermission]([uniqueId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoUserGroup2GranularPermissionDto_UserGroupKey_UniqueId]
    ON [dbo].[umbracoUserGroup2GranularPermission]([userGroupKey] ASC)
    INCLUDE([uniqueId]);

