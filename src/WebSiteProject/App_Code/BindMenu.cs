using System.Collections.Immutable;
using Umbraco.Cms.Core.Models.PublishedContent;

namespace WebSiteProject;

public record SubMenuContext(IImmutableList<IPublishedContent> NavItems, int HomeId, List<int> SelectedNodeList);

public class BindMenu
{
    public static string GetRelativeSafeOrAbsoluteUriPath(string nodeUrl)
    {
        if (!nodeUrl.IsNullOrWhiteSpace())
        {
            var uri = new Uri(nodeUrl, UriKind.RelativeOrAbsolute);
            var uriPath = uri.IsAbsoluteUri ? uri.AbsoluteUri : uri.OriginalString;
            return uriPath;
        }
        else
        {
            return String.Empty;
        }
    }
}
