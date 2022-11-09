use dep::std;

fn main(
    // Private signals
    priv_key : [Field; 3], // A 3 bit binary key
    // Public signals
    message : pub Field,
    salt : pub Field, // a random value / index
    pub_key : pub Field,
    signature : pub Field
) {
    // Constraint 1: binary check
    let mut binary_pos = 1;
    let mut priv_key_field = 0;
    constrain priv_key[0] == 1;
    for i in 0..3 {
        // constrain priv_key[i] == 1 | 0; cant do this
        let mut is_boolean = 0;
        if (priv_key[i] == 1) {
            is_boolean = 1;
        }
        if (priv_key[i] == 0) {
            is_boolean = 1;
        }
        constrain is_boolean == 1; // you can constrain mut vars

        if (i > 0) {
            binary_pos = 2 * binary_pos;
        }
        priv_key_field = binary_pos * priv_key[i] + priv_key_field;
    };
    
    // Constraint 2: Proof of secret key knowledge
    let expected_pub_key = std::hash::pedersen([priv_key_field]);
    constrain expected_pub_key[0] == pub_key;

    // // Constraint 3: Signature computation
    let expected_sig = std::hash::pedersen([salt, priv_key_field, message]);
    constrain expected_sig[0] == signature;

    // Constraint 4: Check public inputs consistency
    // Nothing here - I'm guessing Nargo checks pub values against Verifier.toml.
}