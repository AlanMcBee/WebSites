# Ensure we have the latest Umbraco templates
dotnet new -i Umbraco.Templates --force

# Create solution/project
dotnet new sln --name "WebSiteSolution"
dotnet new umbraco --force -n "WebSiteProject"
dotnet sln add "WebSiteProject"

#Add starter kit
dotnet add "WebSiteProject" package clean

#Add Packages
dotnet add "WebSiteProject" package UrlTracker
dotnet add "WebSiteProject" package Umbraco.Community.Contentment
dotnet add "WebSiteProject" package Diplo.GodMode
dotnet add "WebSiteProject" package SEOChecker
dotnet add "WebSiteProject" package Articulate
dotnet add "WebSiteProject" package Our.Umbraco.TagHelpers
dotnet add "WebSiteProject" package Our.Umbraco.LinkedPages
dotnet add "WebSiteProject" package Umbraco.TheStarterKit
dotnet add "WebSiteProject" package Our.Umbraco.MaintenanceMode
dotnet add "WebSiteProject" package CookieTractor.Umbraco
dotnet add "WebSiteProject" package RoboLynx.Umbraco.QRCodeGenerator
dotnet add "WebSiteProject" package Umbraco.Cms.Integrations.Automation.Zapier
dotnet add "WebSiteProject" package Umbraco.UIBuilder

dotnet run --project "WebSiteProject"
#Running