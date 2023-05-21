const { ethers, upgrades } = require("hardhat");
const { verify } = require("../utils/verify");

async function main() {
  const proxyAddy = "0x3cd434dd8d29433bd1050678ccc4c1e7bcc57767";

  const BillyV2 = await ethers.getContractFactory("BillyV2");

  console.log("Upgrading BillyV1 to V2...");
  const billyV2 = await upgrades.upgradeProxy(proxyAddy, BillyV2);

  await billyV2.deployed();
  console.log("Upgraded Successfully...");
  console.log("verifying");
  await verify(billyV2.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
