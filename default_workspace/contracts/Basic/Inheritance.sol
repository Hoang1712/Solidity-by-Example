// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/
contract A{
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}
//Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    //override A.foo()
    function foo() public pure virtual  override returns  (string memory) {
        return "B";
    }
}
contract C is A {
    //Override A.foo
    function foo() public pure virtual override   returns  (string memory) {
        return  "C";
    }   
}
// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.
/***************/
// Hợp đồng có thể kế thừa từ nhiều hợp đồng cha. 
// Khi một hàm được gọi và được định nghĩa nhiều lần trong 
// các hợp đồng khác nhau, các hợp đồng cha sẽ được tìm kiếm từ 
// phải sang trái và theo cách duyệt theo chiều sâu.
contract D is B,C {
    //D.foo() returns "C"
    //since C is the right most parent contract with function foo()
    function foo() public pure override  (B,C) returns (string memory) {
        return super.foo();
    }
}
contract E  is C,B {
    //E.foo() returns "B"
    //since B is  the right most parent contract with function foo()
    function foo() public pure override (C,B) returns (string memory) {
        return super.foo();
    }
}
// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
/************************/
// Kế thừa phải được sắp xếp từ “giống cơ sở nhất” đến “có nguồn gốc cao nhất”.
// Hoán đổi thứ tự của A và B sẽ gây ra lỗi biên dịch.
contract F is  A , B {
    function foo() public pure override (A,B) returns (string memory) {
        return super.foo();
    }
}