// Copyright (C) 2020 d-xo
// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity >=0.6.12;

import {BasicERC20} from "./BasicERC20.sol";

contract RevertToZeroToken is BasicERC20 {
    // --- Init ---
    constructor(uint _totalSupply) BasicERC20(_totalSupply) {}

    // --- Token ---
    function transferFrom(address src, address dst, uint wad) override public returns (bool) {
        require(dst != address(0), "transfer-to-zero");
        return super.transferFrom(src, dst, wad);
    }
}
