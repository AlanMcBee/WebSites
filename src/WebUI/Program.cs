#define DiagnoseConfiguration

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


#if DiagnoseConfiguration

// Add logging providers
// builder.Logging.ClearProviders(); // Optionally clear existing providers
builder.Logging.AddConsole();     // Add logging to console
builder.Logging.AddDebug();       // Add logging to debug window (good for development)
#if NET9_0_OR_GREATER
builder.Logging.AddAzureWebAppDiagnostics(); // Azure-specific logging provider (for diagnostics)
#endif


// Get all the configuration values for debugging and write them to the logger
var configDebugView = builder.Configuration.GetDebugView();

#endif

WebApplication app = builder.Build();

#if DiagnoseConfiguration

// Get the ILogger and IConfiguration instances
var logger = app.Services.GetRequiredService<ILogger<Program>>();
logger.LogInformation("Configuration values: {configDebugView}", configDebugView);

#endif

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
        u.UseInstallerEndpoints();
        u.UseBackOfficeEndpoints();
        u.UseWebsiteEndpoints();
    });

await app.RunAsync();
