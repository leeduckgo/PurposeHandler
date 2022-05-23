pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/access/Ownable.sol";

contract PurposeHandler is Ownable{

  event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Apps";
  uint256 public price = 0.001 ether;
  // 这里填写你自己的地址

  constructor() {
  }

  function setPurpose(string memory newPurpose) payable public{
      // about msg.sender:
      // https://cryptozombies.io/en/lesson/2/chapter/3
      // about require:
      // https://cryptozombies.io/en/lesson/2/chapter/4
      require(msg.value > price, "NOT ENGOUGH!");
      purpose = newPurpose;
      // update the price when set it.
      price = msg.value;
      emit SetPurpose(msg.sender, purpose);
  }

  function getBalance() view public returns(uint256) {
    return address(this).balance;
  }

  function getMyMoney(address _to, uint256 amount) public onlyOwner{
      address payable receiver = payable(_to);
      receiver.transfer(amount);
  }
}