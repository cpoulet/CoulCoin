pragma solidity ^0.4.4;

import "./Other.sol";

// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract CoulCoin {

	address private admin;
    uint private    envelope;
    address public  brigade;
	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _amount);

	// Contract creation
	function CoulCoin() public {
		admin = msg.sender;
		balances[tx.origin] = 10000;
	}

	// Token creation
	function mint(address team, uint amount) public returns(bool){
		if (msg.sender != admin) return false;
		balances[team] += amount;
		return true;
	}

    // Choose a new Brigade
    function setBrigade(address team) public returns(bool){
		if (msg.sender != admin) return false;
        brigade = team;
        return true;
    }

    // Reward from Brigade or Admin
    function reward(address team, uint amount) public returns(bool) {
		if (msg.sender != admin && msg.sender != brigade) return false;
        if (amount > envelope) return false;
        envelope -= amount;
        balances[team] += amount;
        return true;
    }

    // Fill Brigade's Envelope
    function fillEnvelope(uint amount) public returns(bool){
		if (msg.sender != admin) return false;
        envelope = amount;
        return true;
    }

    // Empty Brigade's Envelope
    function emptyEnvelope() public returns(bool){
		if (msg.sender != admin) return false;
        envelope = 0;
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

	// Getting balance of a team
	function getBalance(address team) public view returns(uint) {
		return balances[team];
	}
}
