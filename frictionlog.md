
# Friction Log Nargo 0.1

1. Verifier.toml interface
Expected: Verifier.toml values can be auto-generated from public values in Prover.toml. I shouldn't have to manually key it in again.
Expected: Verifier.toml variable format should be consistent with Prover.toml. Actual: Prover.toml variables are numeric, while Verifier.toml auto formats variables into hex.

2. Error handling
Expected: better error messages for simple CLI errors, i.e. referencing non-existent file, bad cli subcommands. Actual: "thread 'main' panicked" error msg is returned for most cases.

3. TODO