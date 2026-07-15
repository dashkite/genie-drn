# Reference

## drn:replace

$drn:replace: \to \emptyset$

The `drn:replace` command is a Genie task injected by this preset. It triggers the immediate replacement of all Data Representation Notation (DRN) nodes found within the current Genie configuration state. 

This task is automatically associated with the high-level `build`, `publish`, and `deploy` lifecycle structures, meaning it will run automatically before those operations begin.

### Example

```bash
npx genie drn:replace
```
