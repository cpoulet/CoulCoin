var MatriceCoin = artifacts.require("./MatriceCoin.sol");

contract('------ Matrice Coin ------', function(accounts) {
	it("Creation of 10 000 MatriceCoin in the first account", function() {
		return MatriceCoin.deployed().then(function(instance) {
			return instance.getBalance.call(accounts[0]);
		}).then(function(balance) {
			assert.equal(balance.valueOf(), 10000, "10 000 coins weren't created in the first account.");
		});
	});
	it("MatriceCoin transfert", function() {
		var matrice;

		var a0 = accounts[0];
		var a1 = accounts[1];

		var init_0;
		var init_1;
		var balance_0;
		var balance_1;

		var amount = 42;

		return MatriceCoin.deployed().then(function(instance) {
			matrice = instance;
			return matrice.getBalance.call(a0);
		}).then(function(init) {
			init_0 = init.toNumber();
			return matrice.getBalance.call(a1);
		}).then(function(init) {
			init_1 = init.toNumber();
			return matrice.sendCoin.call(a1, amount, {from: a0});
		}).then(function(success) {
			assert.isTrue(success, "Send function didn't worked :(");
			return matrice.getBalance.call(a0);
		}).then(function(balance) {
			assert.equal(init_0 - amount, balance.valueOf(), "42 coins should have been transfered from first to second account.");
			return matrice.mint.call(a0, amount);
		}).then(function(success) {
			assert.isTrue(success, "Mint function didn't worked :(");
			return matrice.getBalance.call(a0);
		}).then(function(balance) {
			assert.equal(init_0 + amount, balance.valueOf(), "42 coins should have been added to the first account.");
		});
	});
});

/*
const await myFunc = () => {
	const response = async myAsyncFunc(param);

	console.log(response);
};
*/
