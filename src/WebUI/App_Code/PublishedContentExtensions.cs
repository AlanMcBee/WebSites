using Umbraco.Cms.Core.Models.PublishedContent;
using Umbraco.Cms.Web.Common.PublishedModels;

namespace CodeCharm.WebUI;
public static class PublishedContentExtensions
{
#if NO_MODEL_BUILDER
    public static object? GetHomeDocument(this IPublishedContent publishedContent)
    {
        return null;
    }

    public static object? GetSiteSettings(this IPublishedContent publishedContent)
    {
        return null; 
    }
#else
    public static HomeDocument? GetHomeDocument(this IPublishedContent publishedContent)
    {
        return publishedContent.AncestorOrSelf<HomeDocument>();
    }

    public static SiteSettingsDocument? GetSiteSettings(this IPublishedContent publishedContent)
    {
        return publishedContent.GetHomeDocument()?.FirstChild<SiteSettingsDocument>();
    }
#endif
}
