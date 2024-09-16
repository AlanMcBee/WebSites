using Azure.Identity;

using Microsoft.Azure.KeyVault;
using Microsoft.Azure.Services.AppAuthentication;

namespace CodeCharm.WebSiteProject;

public static class WebApplicationBuilderExtensions
{
    public static IHostBuilder ConfigureKeyVault(this IHostBuilder builder)
    {
        builder.ConfigureAppConfiguration((context, config) =>
        {
            if (context.HostingEnvironment.IsDevelopment())
            {
                // Create a KeyVaultClient for local development use
                var keyVaultClient = new KeyVaultClient(
                    new KeyVaultClient.AuthenticationCallback(
                        new AzureServiceTokenProvider().KeyVaultTokenCallback
                    )
                );
                var keyVaultEndpoint = config.Build()["AzureKeyVaultEndpoint"];
                if (!string.IsNullOrWhiteSpace(keyVaultEndpoint) && Uri.TryCreate(keyVaultEndpoint, UriKind.Absolute, out var validUri))
                {
                    // Pull mappings from config
                    var secretMappings = config.Build().GetSection("KeyVaultMappings")
                        .GetChildren()
                        .Select(x => new KeyValuePair<string, string>(x.Key, x.Value ?? string.Empty))
                        .ToDictionary(x => x.Key, x => x.Value);
                    config.AddAzureKeyVault(validUri.ToString(), keyVaultClient, new MappedKeyVaultSecretManager(secretMappings));
                }
            }
        });

        return builder;
    }
}
