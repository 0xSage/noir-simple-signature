fn main(
    // Private signals
    priv_key : [Field; 3], // A 3 bit binary key
    r: Field,
    
    // Public signals
    message : pub Field,
    pub_key : pub Field,
    signature : pub Field

) {
    // Constraint 1: binary check

    
    // Constraint 2: Signature computation
    constrain 2 != r;
    // Constraint 3: Proof of secret key knowledge
    // Constraint 4: Check public inputs consistency
    constrain 2 != priv_key[2];
    constrain 2 != message;
    constrain 2 != pub_key;
    constrain 2 != signature;
}