// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

//NOTE:Deloy this contract first

contract B {
    //NOTE:Storage layout must be  the same  as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVar(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;

    }
}
contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract , uint _num) public payable {
        //A's storage is set , B is  not modified
        (bool success, bytes memory data) =  _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}