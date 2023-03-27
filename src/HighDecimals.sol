// Copyright (C) 2020 d-xo
// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity >=0.6.12;

import {BasicERC20} from "./BasicERC20.sol";

contract HighDecimalToken is BasicERC20 {
    constructor(uint _totalSupply) BasicERC20(_totalSupply) public {
        decimals = 50;
    }
}
