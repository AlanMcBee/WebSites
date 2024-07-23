WebApplicationBuilder builder = WebApplication.CreateBuilder(args);

builder.CreateUmbracoBuilder()
    .AddBackOffice()
    .AddWebsite()
    .AddDeliveryApi()
    .AddComposers()
    //.ConfigureAppConfiguration((context, config) =>
    //{
    //    var settings = config.Build();
    //    var keyVaultEndpoint = settings["AzureKeyVaultEndpoint"];
    //    if (!String.IsNullOrEmpty(keyVaultEndpoint) && Uri.TryCreate(keyVaultEndpoint, UriKind.Absolute, out var validUri))
    //    {
    //        config.AddAzureKeyVault(validUri, new DefaultAzureCredential());
    //    }
    //})
    .Build();

WebApplication app = builder.Build();

//if (env.IsDevelopment())
//{
//    app.UseDeveloperExceptionPage();
//}

await app.BootUmbracoAsync();

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
