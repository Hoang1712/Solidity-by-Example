// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/
contract A {
     // This is called an event. You can emit events from your function
    // and they are logged into the transaction log.
    // In our case, this will be useful for tracing function calls.
    // Đây được gọi là một sự kiện. Bạn có thể phát ra các sự kiện từ chức năng của mình
    // và họ được đăng nhập vào nhật ký giao dịch.
    // Trong trường hợp của chúng tôi, điều này sẽ hữu ích cho việc theo dõi các lệnh gọi hàm.
    event Log(string message);
    function foo() public virtual  {
        emit  Log("A.foo called");
    }
    function bar() public  virtual  {
        emit Log("A.bar called");
    }
}
contract B is A  {
    function foo() public virtual  override  {
        emit  Log("B.foo called");
        A.foo();
    }
    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}
contract C is A{
    function foo() public virtual override  {
        emit  Log("C.foo called");
        A.foo();
    }
    function bar() public virtual  override  {
        emit Log("C.bar is called");
        super.bar();
    }
}
contract D is B,C {
    // Try:
    // - Call D.foo and check the transaction logs.
    //   Although D inherits A, B and C, it only called C and then A.
    // - Call D.bar and check the transaction logs
    //   D called C, then B, and finally A.
    //   Although super was called twice (by B and C) it only called A once.
    // Thử:
    // - Gọi D.foo và kiểm tra nhật ký giao dịch.
    // Mặc dù D kế thừa A, B và C nhưng nó chỉ gọi là C rồi mới đến A.
    // - Gọi D.bar và kiểm tra nhật ký giao dịch
    // D gọi C, rồi B, và cuối cùng là A.
    // Mặc dù super được gọi hai lần (bởi B và C) nhưng nó chỉ được gọi là A một lần.
    function foo() public  override (B,C) {
        super.foo();
    }
    function bar() public  override (B,C) {
        super.bar();
    }
}