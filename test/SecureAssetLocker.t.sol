// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../contracts/SecureAssetLocker.sol";
import "../contracts/mocks/MockLSP7.sol";

contract SecureAssetLockerTest is Test {
    SecureAssetLocker locker;
    MockLSP7 token;
    address owner = address(0xABCD);
    address otherUser = address(0xBEEF);

    bytes32 LOCK_ASSET_PERMISSION = keccak256("LOCK_ASSET");
    bytes32 UNLOCK_ASSET_PERMISSION = keccak256("UNLOCK_ASSET");

    bytes32 assetId = keccak256("asset-1");


function setUp() public {
        // Deploy a mock LSP7 token
        token = new MockLSP7();

        // Mint tokens to owner
        token.mint(owner, 1000 ether);

        // Deploy the SecureAssetLocker with correct parameters
        locker = new SecureAssetLocker(
            address(1),                    // universalProfile (mocked)
            address(2),                    // keyManager (mocked)
            "Secure Asset Locker",         // tokenName
            "SAL",                         // tokenSymbol
            owner                          // newOwner (Universal Profile owner address)
        );


    }

    function testLockAssetSuccess() public {
  
    }

    
}
