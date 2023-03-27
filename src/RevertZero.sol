// Copyright (C) 2020 d-xo
// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity >=0.6.12;

import {BasicERC20} from "./BasicERC20.sol";

contract RevertZeroToken is BasicERC20 {
    // --- Init ---
    constructor(uint _totalSupply) BasicERC20(_totalSupply) public {}

    // --- Token ---
    function transferFrom(address src, address dst, uint wad) override public returns (bool) {
        require(wad != 0, "zero-value-transfer");
        return super.transferFrom(src, dst, wad);
    }
}
