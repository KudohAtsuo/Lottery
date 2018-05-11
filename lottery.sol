pragma solidity ^0.4.21;

// Basic lottery contract
contract Lottery {
  address public owner;
  address public winner;
  uint public numAttend;
  bool public ended;

  mapping (uint => address) public attend;

  event Number(uint _number);

  // contructor
  function Lottery() public{
    owner = msg.sender;
    numAttend - 0;
    ended = false;
  }

  // join lottery
  function join() public{
    require(!ended);

    if(numAttend < 3){
      attend[numAttend] = msg.sender;
      numAttend++;
      emit Number(numAttend);
    } else {
      ended = true;
    }



  }

  // lottery function
  function lottery() public onlyOwner {
    require(ended);

    uint numWinner = now % 3;
    winner = attend[numWinner];
  }

  // modifier only owner
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}
