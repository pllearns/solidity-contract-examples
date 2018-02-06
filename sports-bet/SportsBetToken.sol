pragma solidity ^0.4.17;

import './ERCToken.sol';

contract SportsBetToken is ERCToken {
        mapping (address => uint256) public balances;

        function transfer(address _to, uint256 _value) public returns (bool) {
          require(_to != address[0]);

          Transfer(msg.sender, _to, _value);
          return true;
        }

        function balanceOf(address _owner) public view returns (uint256 balance) {
          return balances[_owner];
        }
}