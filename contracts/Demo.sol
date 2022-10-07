// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyShop {

    // cannot be in memory
    // does not have length or size
    mapping (address => uint) public payments; // storage

    // cannot be in memory
    address public myAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // storage

    // value is only available is payable
    function receiveFunds() public payable {
        payments[msg.sender] = msg.value;
    }

    function transferTo(address /* payable */ targetAddr, uint amount) public {
        address payable _to = payable(targetAddr);
        _to.transfer(amount);
    }

    // view : transaction -> call .... need to vrite returns(type)
    function getBalance(address targetAddr) public view returns(uint) {
        return targetAddr.balance;
    }

    // we canno get string length
    // we cannot concat strings
    // we cannot compare string
    // we cannot string[index]
    string public myStr = "test"; // storage

    // memory can be calldata
    function demo(string memory newValueStr) public {
        
        // memory cannot be sorage here
        string memory myTempStr = "temp";
        myStr = newValueStr;

    }

    uint8 public myVal = 254;

    function inc() public {
        // myVal = myVal + 1;
        // myVal += 1;

        // will move to 0 !!!
        unchecked {
            myVal++; // myVal--; // will move to 255 ...
        }
        
    }

    uint public minimum;
    uint public maximum;

    function demo() public {
        minimum = type(uint8).min;
        maximum = type(uint8).max;
    }

    // unsigned integers
    // uint8 - uint256
    uint public myUint = 42;

    // 2 ** 256
    uint8 public mySmaillUint = 2;
    // 2 ** 8 = 256
    // 0 ---> (256-1)

    function demo(uint _inputUint) public {
        uint localUint = 42;
        localUint + 1;
        localUint - 1;
        localUint * 2;
        localUint / 2; // int
        localUint ** 3;
        localUint % 3;
        -myInt;

        localUint == 1;
        localUint != 1;
        localUint > 1;
        localUint >= 1; 
        // ...

    }

    // signed integers
    int256 public myInt = -42;
    int8 public mySmallInt = -1;
    // 2 ** 7 = 128

    // there is no float

    bool public myBool = true; // state

    // 0xd9145CCE52D386f254917e481eB44e9943F39138
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    function payForItem () public payable {
        payments[msg.sender] = msg.value;
    }

    function withdrawAll () public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }

    function myFunc (bool _inputBool) public {
        bool localBool = false; // local
        // localBool && _inputBool
        // localBool || _inputBool
        // localBool == _inputBool
        // localBool != _inputBool
        // !localBool
        if (_inputBool || localBool) {

        }
    }

}