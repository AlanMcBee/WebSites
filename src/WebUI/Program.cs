using System.Diagnostics;

using CodeCharm.WebUI;

var builder = WebApplication.CreateBuilder(args);

builder.ConfigureKeyVault();

builder.CreateUmbracoBuilder()
    .AddBackOffice()
    .AddWebsite()
    .AddDeliveryApi()
    .AddComposers()
    .AddAzureBlobMediaFileSystem()
    .AddAzureBlobImageSharpCache()
    .Build();


// Get all the configuration values for debugging and write them to the logger
var configDebugView = builder.Configuration.GetDebugView();
Console.WriteLine("Configuration values:");
Console.WriteLine(configDebugView);

WebApplication app = builder.Build();

await app.BootUmbracoAsync();

app.UseHttpsRedirection();

app.UseUmbraco()
    .WithMiddleware(u =>
    {
        u.UseBackOffice();
        u.UseWebsite();
    })
    .WithEndpoints(u =>
    {
        u.UseBackOfficeEndpoints();
        u.UseWebsiteEndpoints();
    });

await app.RunAsync();
