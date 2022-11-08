
# Friction Log Nargo 0.1

1. Verifier.toml interface
Expected: Verifier.toml values can be auto-generated from public values in Prover.toml. I shouldn't have to manually key it in again.
Expected: Verifier.toml variable format should be consistent with Prover.toml. Actual: Prover.toml variables are numeric, while Verifier.toml auto formats variables into hex.

Actually, I'm not sure why we need Verifier.toml in the first place... All public input values from Prover are/should be accessible to Verifier anyway. Return value is just another public input signal (like in Circom). So having the user redefine all public signals again seems redundant.

Also, in V.toml What is setpub = [] ? Docs do not explain

2. Error handling
Expected: better error messages for simple CLI errors, i.e. referencing non-existent file, bad cli subcommands. Actual: "thread 'main' panicked" error msg is returned for most cases.

3. Docs confusion
Can you public reference docs? Was kind of hard to comb through 
this repo to see the apis: https://github.com/noir-lang/noir/tree/master/crates/std_lib/src

4. `unused variable _` error can be stubbed?
Expected: would be great to port over some of unimplemented! macros from rust into the NOIR devex, i.e. let users stub parts they haven't implemented yet after defining the interface.