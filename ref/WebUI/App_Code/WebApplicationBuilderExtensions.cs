using Azure.Extensions.AspNetCore.Configuration.Secrets;
using Azure.Identity;

namespace CodeCharm.WebUI;

// with a lot of help from https://docs.umbraco.com/umbraco-cms/extending/key-vault

public static class WebApplicationBuilderExtensions
{
    public static WebApplicationBuilder ConfigureKeyVault(this WebApplicationBuilder builder)
    {
        if (builder.Environment.IsDevelopment())
        {
            var keyVaultEndpoint = builder.Configuration["AzureKeyVaultEndpoint"];
            if (!string.IsNullOrWhiteSpace(keyVaultEndpoint) && Uri.TryCreate(keyVaultEndpoint, UriKind.Absolute, out var validUri))
            {
                // Pull mappings from config
                var secretMappings = builder.Configuration.GetSection("KeyVaultMappings")
                    .GetChildren()
                    .Select(x => new KeyValuePair<string, string>(x.Key, x.Value ?? string.Empty))
                    .ToDictionary(x => x.Key, x => x.Value);

                builder.Configuration.AddAzureKeyVault(validUri, new DefaultAzureCredential(), new MappedKeyVaultSecretManager(secretMappings));
            }
        }
        return builder;
    }
}
