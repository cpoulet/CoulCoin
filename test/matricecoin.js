var MatriceCoin = artifacts.require("./MatriceCoin.sol");

contract('------ Matrice Coin ------', function(accounts) {
	var a0 = accounts[0];
	var a1 = accounts[1];
	var a2 = accounts[2];
	var a3 = accounts[3];
	var a4 = accounts[4];
	var a5 = accounts[5];
	
    it("MatriceCoin creation", async function() {
        var matrice = await MatriceCoin.deployed();
		var balance_0 = (await matrice.getBalance.call(accounts[0])).toNumber();
		assert.equal(balance_0, 10000, "10000 coin havent been created.");
	});
	it("Transfering coins", async function() {

		var matrice = await MatriceCoin.deployed();
		var balance_0 = (await matrice.getBalance.call(a0)).toNumber();
	    await matrice.sendCoin(a1, 100, {from: a0});
		var balance_0 = (await matrice.getBalance.call(a0)).toNumber();
		var balance_1 = (await matrice.getBalance.call(a1)).toNumber();
		assert.equal(balance_0, 9900, "100 coin should have been transfered.");
		assert.equal(balance_1, 100, "100 coin should have been transfered.");
	});
	it("Minting coins", async function() {
        var matrice = await MatriceCoin.deployed();
		var balance_0 = (await matrice.getBalance.call(a0)).toNumber();
	    await matrice.mint(a1, 42, {from: a0});
		var balance_1 = (await matrice.getBalance.call(a1)).toNumber();
		assert.equal(balance_1, 142, "42 coin should have been created for a1.");
	    await matrice.mint(a0, 100, {from: a0});
		var balance_0 = (await matrice.getBalance.call(a0)).toNumber();
		assert.equal(balance_0, 10000, "100 coin should have been created for a0.");
	    await matrice.mint(a2, 4242, {from: a2});
		var balance_2 = (await matrice.getBalance.call(a2)).toNumber();
		assert.equal(balance_2, 0, "0 coin should have been created by a2.");
	});
	it("Transfering coins ++", async function() {
        var matrice = await MatriceCoin.deployed();
	    await matrice.mint(a0, 420, {from: a0});
	    await matrice.mint(a1, 42, {from: a0});
	    await matrice.mint(a2, 42, {from: a0});
	    await matrice.sendCoin(a3, 210, {from: a0});
	    await matrice.sendCoin(a4, 12, {from: a1});
	    await matrice.sendCoin(a5, 184, {from: a1});
		var balance_0 = (await matrice.getBalance.call(a0)).toNumber();
		var balance_1 = (await matrice.getBalance.call(a1)).toNumber();
		var balance_2 = (await matrice.getBalance.call(a2)).toNumber();
		var balance_3 = (await matrice.getBalance.call(a3)).toNumber();
		var balance_4 = (await matrice.getBalance.call(a4)).toNumber();
		var balance_5 = (await matrice.getBalance.call(a5)).toNumber();
		assert.equal(balance_0, 10210, "wrong a0");
		assert.equal(balance_1, 172, "wrong a1");
		assert.equal(balance_2, 42, "wrong a2");
		assert.equal(balance_3, 210, "wrong a3");
		assert.equal(balance_4, 12, "wrong a4");
		assert.equal(balance_5, 0, "wrong a5");
	});
});
