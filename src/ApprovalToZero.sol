// Copyright (C) 2020 d-xo
// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity >=0.6.12;

import {BasicERC20} from "./BasicERC20.sol";

contract ApprovalToZeroToken is BasicERC20 {
    // --- Init ---
    constructor(uint _totalSupply) BasicERC20(_totalSupply) public {}

    // --- Token ---
    function approve(address usr, uint wad) override public returns (bool) {
        require(usr != address(0), "no approval for the zero address");
        return super.approve(usr, wad);
    }
}
