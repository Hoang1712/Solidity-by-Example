// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter{
    uint public count;
    //function get current count
    function get() public  view returns (uint) {
        return count;
    }
    //function to increment count by 1
    function inc() public {
        count += 1;
    }
    //function to decrement count by 1
    function dec() public {
        //this func will fail if count = 0
        count -= 1;
    }  
}