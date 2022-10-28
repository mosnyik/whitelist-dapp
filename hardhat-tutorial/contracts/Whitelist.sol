// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist{
    //max number of whitelist addresses allowed
    uint8 public maxWhitelistedAddresses;

    //Create a mapping of whitelistedAddresses 
    //if an address is whitelisted, we wowould set it to true,
    // and set it to false by default
    mapping(address => bool) public whitelistedAddresses;

    // numAddressWhitelisted would be used to keep track 
    // of how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it would be part of verification
    uint8 public numAddressesWhitelisted;

    // SAetting the max number of whitelisted addresses
    //User will put the value at the time of deployment
    constructor( uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /*
    AddressToWhitelist = This function adds the 
    address of the sender to the whitelist
     */
    function addAddressToWhitelist() public {
        // check if the user has been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // check if the numAddressWhitelisted < maxWhitelidtedAddresses,
        // if not then throw an error
        require( numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");

        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}