// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BillyV1 is Initializable, ERC20Upgradeable, OwnableUpgradeable {

    function initialize() public initializer {
        __ERC20_init("Billy", "BILLY");
        __Ownable_init();
    }

    function mint(address _to, uint256 _amount) public onlyOwner{
        _mint(_to, _amount);
    }
}