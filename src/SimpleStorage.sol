// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 myFavoriteNumber; // myFavoriteNumber is a storage varible bcz. any variable outside of function & inside of cotract is bydefult storage varible.

    //                   (favoriteNumber, name)
    // person public rajib = person(7, "Rajib");
    // Person public Rajib = Person({favoriteNumber: 7, name: "Rajib"});
    // Person public Harry = Person({favoriteNumber: 349, name: "Harry"});
    // Person public Patrick = Person({favoriteNumber: 29, name: "Patrick"});

    // a basic function
    function store(uint256 _favorateNumber) public virtual {
        myFavoriteNumber = _favorateNumber;
    }

    // View: Read a stored number : here we are not changing the state of the block chain. So there will be no transaction.
    // We can also use Read functions to read from a contract address and not an instance of a contract.
    // there is Pure also where we don't have to do transaction we will learn better letar.
    // Retreve used to only call or read from smart contract which not need transaction but need gas cost unlike store function.
    // return : used to get value of favoriteNumber and of uint256.
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // struct : to save user data in custom, person is a variavle name
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Person public rajib = Person({favoriteNumber: 6, name: "Rajib"});
    // Person public pat = Person({favoriteNumber: 34, name: "Pat"});

    // array : is a data type, so we need memory in order to store the list of favorite numbers.//
    // uint256[] listOfFavoriteNumbrs;
    // dynamic array : it can be any size, static array : if we put [value] it can any size upto max size of that value like 3 or 8 or 893
    Person[] public listOfPeople; // []

    // Memory Calldata Storage / Memory & Calldata are temporary location (only for one time). diff. btweeen them is Calldata can't be changed but Memory can be change.
    // Storage : is permanet location variable.
    // function is temporary so we can't put Storage here. only struct array mapping will get Memory or Calldata
    // uint256 is premitive data type so we can't put Memory or Calldata here.
    function addPerson(string memory name, uint256 _favoriteNumber) public {
        // _name = "cat";
        // Person memory newPerson = Person(_favorateNumber, _name);
        // listOfPeople.push(newPerson); // push : is used to push the data in dynamic array.
        // or
        listOfPeople.push(Person(_favoriteNumber, name));
        // mapping
        nameToFavoriteNumber[name] = _favoriteNumber;
    }

    // mapping
    mapping(string => uint256) public nameToFavoriteNumber;
}

    // Foundry Commands

    // to run local blockchain
    // anvil

    // to see all comand associate to forge
    // forge --help

    // compile // will genarate out file contains info like ABI
    // forge --build
    // forge --compile

    // to deploy a smart contract
    // forge create Contract-Name --rpc-url rpcUrl --private-key privateKey --broadcast

    // deploy using script
    // forge script script/DeploySimpleStorage.s.sol --rpc-url rpcUrl --private-key privateKey --broadcast

    // convertion
    // cast --to-base hexValue dec

    // private key

    // clear history
    // history -c

    // store rpcUrl and privateKey 
    // touch .env
    // PRIVATE_KEY=privateKey
    // RPC_URL=rpcUrl // write inside .env folder
    // source .env // to save
    // deploy
    // forge create Contract-Name --rpc-url $RPC_URL --private-key PRIVATE_KEY --broadcast

    // best method to store a Private Key
    // cast wallet import defaultKey --interactive
    // paste private key then enter password
    // to get list of private key saved localy
    // save the address it returns 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
    // cast wallet list
    // deploy
    // forge create Contract-Name --rpc-url $RPC_URL --account defaultKey --sender localkeyaddress --broadcast -vvvv
    // enter password


    // what is Transaction?
    // inside brodcast folder
    // "transaction": {
    //     "from": "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",         // adress of the sender
    //     "gas": "0xac458",                                             // gas limit 
    //     "value": "0x0",                                               // amount of ether sent with the transaction // below is bytecode of the contract 
    //     "input": "0x6080604052348015600e575f5ffd5b506108db8061001c5f395ff3fe608060405234801561000f575f5ffd5b5060043610610055575f3560e01c80632e64cec1146100595780632ebce631146100775780636057361d146100a85780636f760f41146100c45780638bab8dd5146100e0575b5f5ffd5b610061610110565b60405161006e919061029f565b60405180910390f35b610091600480360381019061008c91906102f3565b610118565b60405161009f92919061038e565b60405180910390f35b6100c260048036038101906100bd91906102f3565b6101cd565b005b6100de60048036038101906100d991906104e8565b6101d6565b005b6100fa60048036038101906100f59190610542565b61025a565b604051610107919061029f565b60405180910390f35b5f5f54905090565b60018181548110610127575f80fd5b905f5260205f2090600202015f91509050805f01549080600101805461014c906105b6565b80601f0160208091040260200160405190810160405280929190818152602001828054610178906105b6565b80156101c35780601f1061019a576101008083540402835291602001916101c3565b820191905f5260205f20905b8154815290600101906020018083116101a657829003601f168201915b5050505050905082565b805f8190555050565b6001604051806040016040528083815260200184815250908060018154018082558091505060019003905f5260205f2090600202015f909190919091505f820151815f015560208201518160010190816102309190610786565b50505080600283604051610244919061088f565b9081526020016040518091039020819055505050565b6002818051602081018201805184825260208301602085012081835280955050505050505f915090505481565b5f819050919050565b61029981610287565b82525050565b5f6020820190506102b25f830184610290565b92915050565b5f604051905090565b5f5ffd5b5f5ffd5b6102d281610287565b81146102dc575f5ffd5b50565b5f813590506102ed816102c9565b92915050565b5f60208284031215610308576103076102c1565b5b5f610315848285016102df565b91505092915050565b5f81519050919050565b5f82825260208201905092915050565b8281835e5f83830152505050565b5f601f19601f8301169050919050565b5f6103608261031e565b61036a8185610328565b935061037a818560208601610338565b61038381610346565b840191505092915050565b5f6040820190506103a15f830185610290565b81810360208301526103b38184610356565b90509392505050565b5f5ffd5b5f5ffd5b7f4e487b71000000000000000000000000000000000000000000000000000000005f52604160045260245ffd5b6103fa82610346565b810181811067ffffffffffffffff82111715610419576104186103c4565b5b80604052505050565b5f61042b6102b8565b905061043782826103f1565b919050565b5f67ffffffffffffffff821115610456576104556103c4565b5b61045f82610346565b9050602081019050919050565b828183375f83830152505050565b5f61048c6104878461043c565b610422565b9050828152602081018484840111156104a8576104a76103c0565b5b6104b384828561046c565b509392505050565b5f82601f8301126104cf576104ce6103bc565b5b81356104df84826020860161047a565b91505092915050565b5f5f604083850312156104fe576104fd6102c1565b5b5f83013567ffffffffffffffff81111561051b5761051a6102c5565b5b610527858286016104bb565b9250506020610538858286016102df565b9150509250929050565b5f60208284031215610557576105566102c1565b5b5f82013567ffffffffffffffff811115610574576105736102c5565b5b610580848285016104bb565b91505092915050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52602260045260245ffd5b5f60028204905060018216806105cd57607f821691505b6020821081036105e0576105df610589565b5b50919050565b5f819050815f5260205f209050919050565b5f6020601f8301049050919050565b5f82821b905092915050565b5f600883026106427fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff82610607565b61064c8683610607565b95508019841693508086168417925050509392505050565b5f819050919050565b5f61068761068261067d84610287565b610664565b610287565b9050919050565b5f819050919050565b6106a08361066d565b6106b46106ac8261068e565b848454610613565b825550505050565b5f5f905090565b6106cb6106bc565b6106d6818484610697565b505050565b5b818110156106f9576106ee5f826106c3565b6001810190506106dc565b5050565b601f82111561073e5761070f816105e6565b610718846105f8565b81016020851015610727578190505b61073b610733856105f8565b8301826106db565b50505b505050565b5f82821c905092915050565b5f61075e5f1984600802610743565b1980831691505092915050565b5f610776838361074f565b9150826002028217905092915050565b61078f8261031e565b67ffffffffffffffff8111156107a8576107a76103c4565b5b6107b282546105b6565b6107bd8282856106fd565b5f60209050601f8311600181146107ee575f84156107dc578287015190505b6107e6858261076b565b86555061084d565b601f1984166107fc866105e6565b5f5b82811015610823578489015182556001820191506020850194506020810190506107fe565b86831015610840578489015161083c601f89168261074f565b8355505b6001600288020188555050505b505050505050565b5f81905092915050565b5f6108698261031e565b6108738185610855565b9350610883818560208601610338565b80840191505092915050565b5f61089a828461085f565b91508190509291505056fea2646970667358221220dc17a1fa83499ca4eadc566dc326c43942ba34c272f12e7694c1078113c3482164736f6c634300081e0033",
    //     "nonce": "0x0",                                               // (uniqe no.) shows number of transaction sent from the address
    //     "chainId": "0x7a69"                                           // chain id of the network           
    // }

    // always private key have to sign transaction



    // interact with smart contracts trough cli

    // to get all commands
    // cast --help

    // to get all commands of send
    // cast send --help

    // to store
    // cast sent to "inputname(type)" input --rpp-url RPC_URL --private-key PRIVATE_KEY
    // to = contract address // type if dfined

    // to call the store value
    // cast call to "inputname(type)"
    // we will get value in hex. so we have to convert it to dec

    // deploy a contract to testnet
    // we have to run a node to create an end point like rpc url in metamask



    // verify a smart contract (foundry simple storage video 25)
    // we can do it in etherscan (basicaly we have to add our codes to etherscan to inc. transparancy)

    // format code
    // forge fmt

    // README.md
    // # hello       // head
    // evberjncoklw
    // 
    //    code
    // 
    // on search bar
    // >markdown preview and click on markdown open preview to see the readme file will look like in git hub