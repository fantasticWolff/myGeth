const myAMI = artifacts.require("myAMI");

module.exports = function (deployer) {
  deployer.deploy(myAMI);
};
