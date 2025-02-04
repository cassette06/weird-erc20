// Copyright (C) 2020 d-xo
// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity >=0.6.12;

import {BasicERC20} from "./BasicERC20.sol";

contract PausableToken is BasicERC20 {
    // --- Access Control ---
    address owner;
    modifier auth() { require(msg.sender == owner, "unauthorised"); _; }

    // --- Pause ---
    bool live = true;
    function stop() auth external { live = false; }
    function start() auth external { live = true; }

    // --- Init ---
    constructor(uint _totalSupply) BasicERC20(_totalSupply) {
        owner = msg.sender;
    }

    // --- Token ---
    function approve(address usr, uint wad) override public returns (bool) {
        require(live, "paused");
        return super.approve(usr, wad);
    }
    function transfer(address dst, uint wad) override public returns (bool) {
        require(live, "paused");
        return super.transfer(dst, wad);
    }
    function transferFrom(address src, address dst, uint wad) override public returns (bool) {
        require(live, "paused");
        return super.transferFrom(src, dst, wad);
    }
}
