//------------------------------------------------------------------------------
// <auto-generated>
//   This code was generated by a tool.
//
//    Umbraco.ModelsBuilder.Embedded v13.5.0+a6c5581
//
//   Changes to this file will be lost if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Linq.Expressions;
using Umbraco.Cms.Core.Models.PublishedContent;
using Umbraco.Cms.Core.PublishedCache;
using Umbraco.Cms.Infrastructure.ModelsBuilder;
using Umbraco.Cms.Core;
using Umbraco.Extensions;

namespace Umbraco.Cms.Web.Common.PublishedModels
{
	/// <summary>Search</summary>
	[PublishedModel("searchDocument")]
	public partial class SearchDocument : PublishedContentModel, IPageNavigationComponent, ISeoPageComponent
	{
		// helpers
#pragma warning disable 0109 // new is redundant
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		public new const string ModelTypeAlias = "searchDocument";
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		public new const PublishedItemType ModelItemType = PublishedItemType.Content;
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[return: global::System.Diagnostics.CodeAnalysis.MaybeNull]
		public new static IPublishedContentType GetModelContentType(IPublishedSnapshotAccessor publishedSnapshotAccessor)
			=> PublishedModelUtility.GetModelContentType(publishedSnapshotAccessor, ModelItemType, ModelTypeAlias);
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[return: global::System.Diagnostics.CodeAnalysis.MaybeNull]
		public static IPublishedPropertyType GetModelPropertyType<TValue>(IPublishedSnapshotAccessor publishedSnapshotAccessor, Expression<Func<SearchDocument, TValue>> selector)
			=> PublishedModelUtility.GetModelPropertyType(GetModelContentType(publishedSnapshotAccessor), selector);
#pragma warning restore 0109

		private IPublishedValueFallback _publishedValueFallback;

		// ctor
		public SearchDocument(IPublishedContent content, IPublishedValueFallback publishedValueFallback)
			: base(content, publishedValueFallback)
		{
			_publishedValueFallback = publishedValueFallback;
		}

		// properties

		///<summary>
		/// Page Tags
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[global::System.Diagnostics.CodeAnalysis.MaybeNull]
		[ImplementPropertyType("pageTags")]
		public virtual global::System.Collections.Generic.IEnumerable<global::Umbraco.Cms.Core.Models.PublishedContent.IPublishedContent> PageTags => global::Umbraco.Cms.Web.Common.PublishedModels.PageNavigationComponent.GetPageTags(this, _publishedValueFallback);

		///<summary>
		/// Hide: True to hide this page from (within-site) search results and list pages
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[ImplementPropertyType("umbracoNaviHide")]
		public virtual bool UmbracoNaviHide => global::Umbraco.Cms.Web.Common.PublishedModels.PageNavigationComponent.GetUmbracoNaviHide(this, _publishedValueFallback);

		///<summary>
		/// SEO Description: A description that can be displayed by search engines for the page. Different search engines may truncate this differently.
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[global::System.Diagnostics.CodeAnalysis.MaybeNull]
		[ImplementPropertyType("metaDescription")]
		public virtual string MetaDescription => global::Umbraco.Cms.Web.Common.PublishedModels.SeoPageComponent.GetMetaDescription(this, _publishedValueFallback);

		///<summary>
		/// SEO Title: A title that will be used by Search Engines for a page. If no title is given here, the page's Title will be used.
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[global::System.Diagnostics.CodeAnalysis.MaybeNull]
		[ImplementPropertyType("metaTitle")]
		public virtual string MetaTitle => global::Umbraco.Cms.Web.Common.PublishedModels.SeoPageComponent.GetMetaTitle(this, _publishedValueFallback);

		///<summary>
		/// Is Followable: Set to false when you don't want a search engine to index your web page in search, but you do want it to follow the links on that page — thereby giving ranking authority to the other pages your page links to.  Paid landing pages are a great example of this. You don't want search engines to index landing pages that people are supposed to pay to see, but you might want the pages it links to benefit from its authority.
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[ImplementPropertyType("seoIsFollowable")]
		public virtual bool SeoIsFollowable => global::Umbraco.Cms.Web.Common.PublishedModels.SeoPageComponent.GetSeoIsFollowable(this, _publishedValueFallback);

		///<summary>
		/// Is Indexable: Set to false when you don't want a search engine to index your web page in search, but you do want it to follow the links on that page — thereby giving ranking authority to the other pages your page links to.  Paid landing pages are a great example of this. You don't want search engines to index landing pages that people are supposed to pay to see, but you might want the pages it links to benefit from its authority.
		///</summary>
		[global::System.CodeDom.Compiler.GeneratedCodeAttribute("Umbraco.ModelsBuilder.Embedded", "13.5.0+a6c5581")]
		[ImplementPropertyType("seoIsIndexable")]
		public virtual bool SeoIsIndexable => global::Umbraco.Cms.Web.Common.PublishedModels.SeoPageComponent.GetSeoIsIndexable(this, _publishedValueFallback);
	}
}
