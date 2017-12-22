pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MatriceCoin.sol";

contract TestMatricecoin {

	MatriceCoin matricecoin = MatriceCoin(DeployedAddresses.MatriceCoin());

	function testInitialBalanceUsingDeployedContract() public {

		uint expected = 10000;
		Assert.equal(matricecoin.getBalance(tx.origin), expected, "Owner should have 10000 MatriceCoin initially");
	}

	function testInitialBalanceWithNewMatriceCoin() public {

		MatriceCoin matrice = new MatriceCoin();
		uint expected = 10000;
		Assert.equal(matrice.getBalance(tx.origin), expected, "Owner should have 10000 MatriceCoin initially");
	}

	function testMintCoin() public {

		bool success = matricecoin.mint(tx.origin, 42);
		uint expected = 10000;
		Assert.isFalse(success, "Only the minter should have the right to mint coins.");
		Assert.equal(matricecoin.getBalance(tx.origin), expected, "Owner should have 10000 MatriceCoin initially");
	}
}
