// contract;

// abi MyContract {
//     fn test_function() -> bool;
// }

// impl MyContract for Contract {
//     fn test_function() -> bool {
//         true
//     }
// }


//Testing 1, 2 1, 2...



// contract; is a declaration that specifies to the FuelVM that this program we are going to write is a Sway Smart Contract; 
contract;

//An Application Binary Interface (ABI) gives your programs the ability to communicate with other smart contracts or external apps. 
//Once contracts are written, the Fuel Virtual Machine understands it and converts it to executable bytecodes which can now be deployed  
// to the Fuel network. If an external smart contract or app wants to read data from Fuel blockchain, the ABI converts the bytecode 
// and its data can now be consumed by the front end of the app.


abi TestContract {
    #[storage(write)]fn initialize_counter(value: u64) -> u64;
    #[storage(read, write)]fn increment_counter(amount: u64) -> u64;
}

// "abi TestContract" is the declaration of our Application Binary Interface. After declaring with the "abi" keyword, the next word 
//  should be the name of the ABI. 

// second line is us declaring a method in our abi called "initialize_counter" that takes in a value parameter


//the third line is also another method declaration called "increment_counter" with  amount parameter. 

storage {
    counter: u64 = 0,
}
// storage keyword is used to store persistent data in our contract.
// Storage here means that there is a variable called Counter that we want to be updated whenever new values are added to it.



// we use (write) keyword to give a storage value a particular value.  
impl TestContract for Contract {
    #[storage(write)]fn initialize_counter(value: u64) -> u64 {
        storage.counter = value;
        value
    }

// we use (read) keyword to get access to the content pf a storage variable.  

    #[storage(read, write)]fn increment_counter(amount: u64) -> u64 {
        let incremented = storage.counter + amount;
        storage.counter = incremented;
        // this is where we aad the logic that increases the counter variabke with amount
        incremented
    }
}
