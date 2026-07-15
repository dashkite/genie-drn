# Recipes

## Basic usage

The most common use case for Genie DRN is replacing DRN nodes in standard configuration files without any custom options. 

This guide explains how to rely on the automatically registered preset to process standard files ending in `.yaml` or `.json`.

```bash
npx genie build
```

**Algorithm for creators:**
1. Install the `@dashkite/genie-drn` package. Genie automatically registers the preset.
2. Run `npx genie build` and observe that DRN substitution occurs automatically for standard files before the build begins.

## Configure custom file patterns

Creators often need to restrict or expand the files processed by the DRN replacement hook. This guide explains how to define a custom glob pattern for the configuration assets.

The plugin reads a `drn` property on the Genie configuration to discover its options. By providing a custom `glob` property, the plugin will use `micromatch` to test incoming file paths, allowing the developer to control exactly which files are transformed.

```coffeescript
export default (Genie) ->
  # load custom drn options in genie configuration
  Genie.set "drn",
    glob: "./config/**/*.{yaml,json}"
```

**Algorithm for creators:**
1. Set a new `drn` object in the Genie state containing a `glob` property with your target pattern within your project's Genie configuration.
2. The automatically registered plugin will now evaluate paths against the new pattern before applying replacements.
3. Run `npx genie drn:replace` or another lifecycle command to trigger the replacements on the new file paths.
