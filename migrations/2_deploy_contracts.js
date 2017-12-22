var MatriceCoin = artifacts.require("./MatriceCoin.sol");
var Other = artifacts.require("./Other.sol");

module.exports = function(deployer) {
  deployer.deploy(Other);
  deployer.link(Other, MatriceCoin);
  deployer.deploy(MatriceCoin);
};
