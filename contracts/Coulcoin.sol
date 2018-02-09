pragma solidity ^0.4.4;

import "./Other.sol";

// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract CoulCoin {

	address public minter;
	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	// Contract creation
	function CoulCoin() public {
		minter = msg.sender;
		balances[tx.origin] = 10000;
	}

	// Token creation
	function mint(address student, uint amount) public returns(bool){
		if (msg.sender != minter) return false;
		balances[student] += amount;
		return true;
	}

	// Transfert function
	function sendCoin(address receiver, uint amount) public returns(bool) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		Transfer(msg.sender, receiver, amount);
		return true;
	}

	// Interaction with other contract
	function Interact() public pure returns(uint){
		return Other.getData();
	}

	// Getting balance of a student
	function getBalance(address student) public view returns(uint) {
		return balances[student];
	}
}
