use dep::std;

fn main(
    // Private signals
    priv_key : [Field; 3], // A 3 bit binary key
    
    // Public signals
    // message : pub Field,
    // salt : pub Field, // a random value
    // pub_key : pub Field,
    // signature : pub Field
) -> pub Field {
    // Constraint 1: binary check
    let mut binary_pos = 1;
    let mut priv_key_field = 0;
    for i in 0..3 {
        constrain priv_key[i] == 0 | 1;
        if (i > 0) {
            binary_pos = 2 * binary_pos;
        }
        priv_key_field = priv_key_field + binary_pos * priv_key[i];
    };
    
    // Constraint 2: Proof of secret key knowledge
    let expected_pub_key = std::hash::pedersen([priv_key_field]);
    // constrain expected_pub_key[0] == pub_key;

    // // Constraint 3: Signature computation
    // let expected_sig = std::hash::pedersen([salt, priv_key_field, message]);
    // constrain expected_sig[0] == signature;

    // Constraint 4: Check public inputs consistency
    // Nothing here - I'm guessing Nargo checks pub values against Verifier.toml.
    expected_pub_key[0]
}