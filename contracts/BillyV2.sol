// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BillyV2 is Initializable, ERC20Upgradeable, OwnableUpgradeable {

    mapping(address => bool) whitelistedAddresses;

    function initialize() public initializer {
        __ERC20_init("Billy", "BILLY");
    }

    modifier onlyWhitelisted(address _target) {
        require(whitelistedAddresses[_target], "Address is not whitelisted");
        _;
    }

    function mint(address _to, uint256 _amount) public onlyOwner{
        _mint(_to, _amount);
    }

    function whitelistAddress(address _target) external onlyOwner {
        whitelistedAddresses[_target] = true;
    }

    function unWhitelistAddress(address _target) external onlyOwner {
        whitelistedAddresses[_target] = false;
    }

    function transfer(address _recipient, uint256 _amount) public virtual override onlyWhitelisted(_recipient) returns (bool) {
        return super.transfer(_recipient, _amount);
    }

    function isWhitelisted(address _target) public view returns (bool) {
        return whitelistedAddresses[_target];
    }
}