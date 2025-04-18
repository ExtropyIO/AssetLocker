// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@lukso/LSP4DigitalAssetMetadata/LSP4DigitalAssetMetadata.sol";
import "@lukso/LSP6KeyManager/LSP6KeyManager.sol";



contract SecureAssetLocker is LSP4DigitalAssetMetadata {

    address public universalProfile;
    LSP6KeyManager keyManager;

constructor(
        address _universalProfile,
        address _keyManager,
        string memory _tokenName,
        string memory _tokenSymbol,
        address _newOwner
    ) 
        LSP4DigitalAssetMetadata(_tokenName, _tokenSymbol, _newOwner) 
    {
        universalProfile = _universalProfile;
        keyManager = LSP6KeyManager(_keyManager);
    }


}