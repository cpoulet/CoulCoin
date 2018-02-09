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
}
