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

storage {
    counter: u64 = 0,
}

impl TestContract for Contract {
    #[storage(write)]fn initialize_counter(value: u64) -> u64 {
        storage.counter = value;
        value
    }

    #[storage(read, write)]fn increment_counter(amount: u64) -> u64 {
        let incremented = storage.counter + amount;
        storage.counter = incremented;
        incremented
    }
}
