const { ethers, upgrades } = require("hardhat");
const { verify } = require("../utils/verify");
const { BigNumber } = ethers;

async function main() {
  const BillyV1 = await ethers.getContractFactory("BillyV1");
  console.log("Deploying Billy V1");

  //   let initialSupply = BigNumber.from("100000000000000000000"); //100
  const billy = await upgrades.deployProxy(BillyV1, {
    initializer: "initialize",
    kind: "transparent",
  });

  await billy.deployed();
  console.log(billy.address, "Billy Proxy address!");
  console.log("verifying");
  await verify(billy.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
