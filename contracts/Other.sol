pragma solidity ^0.4.4;

library Other{

	uint constant data = 42;

	function getData() public pure returns(uint) {
		return data;
	}
}
