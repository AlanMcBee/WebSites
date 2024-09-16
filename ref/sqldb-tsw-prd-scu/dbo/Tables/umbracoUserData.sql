CREATE TABLE [dbo].[umbracoUserData] (
    [key]        UNIQUEIDENTIFIER NOT NULL,
    [userKey]    UNIQUEIDENTIFIER NOT NULL,
    [group]      NVARCHAR (255)   NOT NULL,
    [identifier] NVARCHAR (255)   NOT NULL,
    [value]      NVARCHAR (MAX)   NOT NULL,
    CONSTRAINT [PK_umbracoUserDataDto] PRIMARY KEY CLUSTERED ([key] ASC),
    CONSTRAINT [FK_umbracoUserData_umbracoUser_key] FOREIGN KEY ([userKey]) REFERENCES [dbo].[umbracoUser] ([key])
);


GO
CREATE NONCLUSTERED INDEX [IX_umbracoUserDataDto_UserKey_Group_Identifier]
    ON [dbo].[umbracoUserData]([userKey] ASC)
    INCLUDE([group], [identifier]);

