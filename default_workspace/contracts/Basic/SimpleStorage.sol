// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    // State variable to store a number
    uint public  num;

    //you need to send a transaction to write to a state variable 
    function set(uint _num) public {
        num = _num;
    }
    //you can read from a state variable without sending a transaction 
    function get() public view returns  (uint) {
        return num;
    }
}