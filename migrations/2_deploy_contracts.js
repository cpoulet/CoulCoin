var CoulCoin = artifacts.require("./CoulCoin.sol");
var Other = artifacts.require("./Other.sol");

module.exports = function(deployer) {
  deployer.deploy(Other);
  deployer.link(Other, CoulCoin);
  deployer.deploy(CoulCoin);
};
