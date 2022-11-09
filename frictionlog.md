
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

5. `error: Expected type (), found type [()]` error thrown when I forgot a `;` at the end of a if block.
Expected: a better syntax error

6. Is there opcode/syntax to handle exponentiation?

7. Field overflow/underflow error msg confusing: 
Got: `thread 'main' panicked at 'assertion failed: bit_size < FieldElement::max_num_bits()'`
Expected: `underflow/overflow...`

8. Print which constraints cannot be satisfied
Got: `could not satisfy all constraint` maybe intentionally vague? But not great for development process..

9. Not being able to console log or see outputs is hard. I configured a ts project to generate the expected pedersen hash , signature, etc values. That said, circom doesn't handle this well either. It would be killer devex to have noir CLI keep pace with opcodes, so I can just generate values on the command line.

Related: when inputing hex values, it seems I have to be careful about how many significant digits. i.e. `0x0001` and `0x00000001` are equivalent, but then the proof fails. Maybe I lack understanding of some important rule here though.

10. Not clear what conditions, beyond +/*, can be constrained:
- [doesn't work] `constrain x == 0 | 1`
- [not sure] `constrain x == 10 / 2`
Seems to be a cool/macro thing that a DSL should handle.
