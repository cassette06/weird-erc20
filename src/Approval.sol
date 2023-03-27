// Copyright (C) 2020 d-xo
// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity >=0.6.12;

import {BasicERC20} from "./BasicERC20.sol";

contract ApprovalRaceToken is BasicERC20 {
    // --- Init ---
    constructor(uint _totalSupply) BasicERC20(_totalSupply) public {}

    // --- Token ---
    function approve(address usr, uint wad) override public returns (bool) {
        require(allowance[msg.sender][usr] == 0, "unsafe-approve");
        return super.approve(usr, wad);
    }
}
