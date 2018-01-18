pragma solidity ^0.4.4;

contract Donation {
  address[16] public donors;

  function donate(uint orgId) public returns (uint) {
    require(orgId >= 0 && orgId <= 15);

    donors[orgId] = msg.sender;

    return orgId;
  }

  function getDonors() public view returns (address[16]) {
    return donors;
  }
}