CREATE TABLE [dbo].[umbracoProductLicenseValidationStatus] (
    [ProductId]                   NVARCHAR (50)  NOT NULL,
    [LicenseKey]                  NVARCHAR (200) NOT NULL,
    [LastResult]                  NVARCHAR (50)  NOT NULL,
    [LastValidatedOn]             DATETIME       NOT NULL,
    [Domains]                     NVARCHAR (MAX) NULL,
    [ExpiresOn]                   DATETIME       NULL,
    [Features]                    NVARCHAR (500) NULL,
    [LastSuccessfullyValidatedOn] DATETIME       NULL,
    [SignatureSignedHash]         NVARCHAR (500) NULL,
    [SignatureVersion]            INT            NULL,
    CONSTRAINT [PK_umbracoProductLicenseValidationStatus] PRIMARY KEY CLUSTERED ([ProductId] ASC)
);

