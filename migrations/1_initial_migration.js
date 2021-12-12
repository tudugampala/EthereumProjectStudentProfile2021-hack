const Migrations = artifacts.require("Migrations");
const HelloWorld = artifacts.require("HelloWorld");
const Student = artifacts.require("Student");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(HelloWorld);
  deployer.deploy(Student);
};
