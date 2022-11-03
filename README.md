# Module 5: NOIR Implementation Homework

### Objective 

Let's implement Adrian's 3 bit signature example in NOIR, the new Domain Specific Language for SNARK proving systems from Aztec.

To recap, we have a toy signature scheme. The prover has an unsafe, 3 bit private key, used to sign messages. The prover wants to generate a SNARK prove that their signature is valid. Ensure that you thoroughly implement the various constraints mentioned in the module. Hint: there's at least 4!

See full example signature scheme [here](https://drive.google.com/file/d/1_lKJwZmWef6zpW2VViz5a2OeEfdTa4Uf/view).

For the hash function, we can use `std::hash::pedersen`. See example [here](https://github.com/vezenovm/simple_shield/blob/master/circuits/src/main.nr)

### Suggested Interface

> I haven't actually implemented this homework yet, so we may need to tweak these parameters.

Prover.toml

```
// public

pub_key
message
signature
// what else?

// witness
priv_key
// what else?

```

Verifier.toml

```
// Think through what does the verifier need to know?

```

### Bonus

Keep a simple [friction log](https://www.chameleon.io/blog/friction-logs) to help out the NOIR team as they improve the NOIR dsl. 

### Getting Started
- Install Rust: https://www.rust-lang.org/tools/install
- Install Noir: https://noir-lang.github.io/book/getting_started.html