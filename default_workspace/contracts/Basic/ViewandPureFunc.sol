// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ViewandPure {
    uint public x = 1;
    //Promise not to modify the state
    function addTox(uint y) public view returns (uint) {
        return x + y;
    }
    //promise not to modify  or read from the state
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}