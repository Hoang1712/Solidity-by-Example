// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FunctionModifier {
    // We will use these  variables to demonstate how to use
    // modifires.
    address public owner;
    uint public  x = 10;
    bool public  locked;
    
    constructor() {
        //set the transaction sender as  the owner of the contract
        owner = msg.sender;
    }
    //Modifier to check that the caller is the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner,"Not Owner ");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        // Dấu gạch dưới là ký tự đặc biệt chỉ dùng bên trong
        // một công cụ sửa đổi hàm và nó báo cho Solidity biết
        // thực thi phần còn lại của mã.
        _;
    }
    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    // Công cụ sửa đổi có thể nhận đầu vào. Công cụ sửa đổi này kiểm tra xem
    // địa chỉ được truyền vào không phải là địa chỉ 0.
    modifier valiAddress (address _addrs) {
        require(_addrs != address(0), "Not valid address");
        _;
    }
    
    function changeOwner (address _newOwner) public onlyOwner valiAddress(_newOwner) {
        owner = _newOwner;
    }
    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    // Công cụ sửa đổi có thể được gọi trước và/hoặc sau một hàm.
    // Công cụ sửa đổi này ngăn không cho một hàm được gọi trong khi
    // nó vẫn đang thực thi.
    modifier  noReentrancy() {
        require(!locked,"No Reentrancy");
        locked = true;
        _;
        locked = false;
    }
    function decrement (uint i) public  noReentrancy{
         x -= i;
         if( i  > 1) {
            decrement(i -1);
         }
    }
}
