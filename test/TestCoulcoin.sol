pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CoulCoin.sol";

contract TestCoulcoin {

	CoulCoin coulcoin = CoulCoin(DeployedAddresses.CoulCoin());

	function testInitialBalanceUsingDeployedContract() public {

		uint expected = 10000;
		Assert.equal(coulcoin.getBalance(tx.origin), expected, "Owner should have 10000 CoulCoin initially");
	}

	function testInitialBalanceWithNewCoulCoin() public {

		CoulCoin coul = new CoulCoin();
		uint expected = 10000;
		Assert.equal(coul.getBalance(tx.origin), expected, "Owner should have 10000 CoulCoin initially");
	}

	function testMintCoin() public {

		bool success = coulcoin.mint(tx.origin, 42);
		uint expected = 10000;
		Assert.isFalse(success, "Only the minter should have the right to mint coins.");
		Assert.equal(coulcoin.getBalance(tx.origin), expected, "Owner should have 10000 CoulCoin initially");
	}

	function testfillEnvelope() public {

		uint amount = 10000;
		bool success = coulcoin.fillEnvelope(amount);
		Assert.isFalse(success, "Only the admin should have the right to fillEnvelope.");
		if (success)
		{
			Assert.isFalse((amount == coulcoin.getEnvelope()), "The fillEnvelope fonction haven't fill the right amount.");
		}
	}

	function test_emptyEnvelope() public {

		bool success = coulcoin.emptyEnvelope();
		Assert.isFalse(success, "Only the admin should have the right to emptyEnvelope.");
		if (success)
		{
			Assert.isFalse((0 == coulcoin.getEnvelope()), "The emptyEnvelope fonction haven't empty the envelope.");
		}
	}

	// Don't know how to test it with proper address.
	/*function test_sendCoin(address receiver, uint amount) public {

		uint balance_sender = coulcoin.getBalance(msg.sender);
		uint balance_receiver = coulcoin.getBalance(receiver);
		bool success = coulcoin.sendCoin(receiver, amount);
		Assert.isFalse(success, "The amount is upper than the balance of the sender.");
		if (success)
		{
			Assert.isFalse((balance_sender - amount == coulcoin.getBalance(msg.sender) || balance_receiver + amount == coulcoin.getBalance(receiver)), "Operations on the balances are not right.");
		}
	}*/
}
