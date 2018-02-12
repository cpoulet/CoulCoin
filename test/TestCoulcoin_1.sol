pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CoulCoin.sol";

contract TestCoulcoin_1 {

	CoulCoin coulcoin = CoulCoin(DeployedAddresses.CoulCoin());

	// Don't know how to test it with proper address.
	
	/*function test_sendCoin(address receiver, uint amount) public {

		uint balance_sender = coulcoin.getBalance(msg.sender);
		uint balance_receiver = coulcoin.getBalance(receiver);
		bool success = coulcoin.sendCoin(receiver, amount);
		Assert.isFalse(success, "The amount is upper than the balance of the sender.");
		if (success) {
			Assert.isFalse((balance_sender - amount == coulcoin.getBalance(msg.sender) || balance_receiver + amount == coulcoin.getBalance(receiver)), "Operations on the balances are not right.");
		}
	}

	function test_setBrigade(address team) {

		bool success = coulcoin.setBrigade(team);
		Assert.ifFalse(success, "Only the admin should have the right to set the Brigade.");
		if (success) {
			Assert.isFalse((team == coulcoin.brigade), "The brigade haven't been set correctly.");
		}
	}

	function test_reward(team){

		uint amount = 100;
		uint Envlp_amount = coulcoin.envelope;
		uint Team_amount = coulcoin.getBalance(team);
		bool success = coulcoin.reward(team, amount);
		assert.isFalse(success, "Someone try to access to reward fonction and haven't the right or the amount is upper than the envelope balance");
		if (success) {
			Assert.isFalse((Team_amount + amount == coulcoin.getBalance(team) || Envlp_amount - amount == coulcoin.envelope), "Operations for the reward are not right.");
		}
	}*/
}
