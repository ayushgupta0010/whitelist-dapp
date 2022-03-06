//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {
    uint256 public maxWhitelistedAddresses;

    // This changed from public
    uint256 numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint256 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );

        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses cant be added, limit reached"
        );

        whitelistedAddresses[msg.sender] = true;
        ++numAddressesWhitelisted;
    }
}
