# Testing

We use the Amen testing framework to verify the behavior of the Genie DRN plugin.

## Running Tests

To run the test suite, invoke the following command in the terminal:

```bash
npx genie test
```

This runs the testing scripts located in the `test/` directory to validate the correct behavior of the DRN processing logic.

## Testing Approach

The tests are written in CoffeeScript. They evaluate the plugin's integration with the Genie instance and confirm that configuration nodes receive the appropriate replacement operations.
