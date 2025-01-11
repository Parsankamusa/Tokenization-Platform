const KushToken = artifacts.require("KushToken");

module.exports = function (deployer) {
  deployer.deploy(KushToken);
};
