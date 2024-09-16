
using Microsoft.Azure.KeyVault.Models;
using Microsoft.Extensions.Configuration.AzureKeyVault;

namespace CodeCharm.WebSiteProject;

// copied from https://gist.github.com/tgreensill/26659111871fdc54d0ac20cc21e602e1

/// <summary>
/// Custom KeyVaultSecretManager that uses a dictionary in the appsettings to map
/// keyvault secrets to appsettings. Useful for when seret names change between environments.
/// The key part of the dictionary should match the appSetting to override with the secret value.
/// The value part ofthe dictionary should be the name of the secret to pull the value from.
/// </summary>
public class MappedKeyVaultSecretManager : IKeyVaultSecretManager
{
    private readonly IReadOnlyDictionary<string, string> _mappings;

    public MappedKeyVaultSecretManager(IReadOnlyDictionary<string, string> mappings)
    {
        if (mappings != null)
        {
            // Colons cause issues in the keys, so we use double underscore then replace
            // them with colons at runtime.
            _mappings = mappings.ToDictionary(x => x.Key.Replace("__", ":"), x => x.Value);
        }
        else
        {
            _mappings = new Dictionary<string, string>();
        }
    }

    public bool Load(SecretItem secret)
    {
        // Load the secret if the secret name is in the list of mapping values.
        return _mappings.Any(mapping =>
            secret.Identifier.Name.Equals(mapping.Value, StringComparison.OrdinalIgnoreCase)
        );
    }

    public string GetKey(SecretBundle secret)
    {
        // Store the secret value in the appsetting matching the key in the mappings.
        return _mappings.FirstOrDefault(mapping =>
            secret.SecretIdentifier.Name.Equals(mapping.Value, StringComparison.OrdinalIgnoreCase)
        ).Key;
    }
}
