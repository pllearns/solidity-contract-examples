// pseudo random number winner picker
pragma solidity ^0.4.17;

contract Contest {
    address public manager;
    address[] public players;
    
    function Contest() public {
        manager = msg.sender; 
    }
    
    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }
    
    function pickWinner() public authorized {
       
       uint index = random() % players.length;
       players[index].transfer(this.balance);
       players = new address[](0);
    }
    
    modifier authorized() {
        require(msg.sender == manager);
        _;
    }
    
    function getPlayers() public view returns (address[]) {
        return players;
    }
}