// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >=0.8.0;

import "forge-std/Vm.sol";

contract Constants {
    mapping(string => address) private addressMap;
    mapping(string => bytes32) private pairCodeHash;
    //byteCodeHash for trident pairs

    string[] private addressKeys;

    constructor() {
        // set constants for tests here

        // Mainnet
        setAddress("mainnet.weth", 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
        setAddress("mainnet.usdc", 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);

        // Optimism
        setAddress("optimism.weth", 0x4200000000000000000000000000000000000006);
        setAddress("optimism.usdc", 0x7F5c764cBc14f9669B88837ca1490cCa17c31607);
        setAddress("optimism.op", 0x4200000000000000000000000000000000000042);

        // Arbitrum


        // Polygon
        setAddress("polygon.wmatic", 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270);
        setAddress("polygon.usdc", 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174);
        setAddress("polygon.usdt", 0xc2132D05D31c914a87C6611C10748AEb04B58e8F);

        // Fantom
    }

    function initAddressLabels(Vm vm) public {
        for (uint256 i = 0; i < addressKeys.length; i++) {
            string memory key = addressKeys[i];
            vm.label(addressMap[key], key);
        }
    }

    function setAddress(string memory key, address value) public {
        require(addressMap[key] == address(0), string.concat("address already exists: ", key));
        addressMap[key] = value;
        addressKeys.push(key);
    }

    function getAddress(string calldata key) public view returns (address) {
        require(addressMap[key] != address(0), string.concat("address not found: ", key));
        return addressMap[key];
    }
}