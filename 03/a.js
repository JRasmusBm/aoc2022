const fs = require("fs");
const contents = fs.readFileSync(0, "utf-8").split("\n").filter(Boolean);

const priorities = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  .split("")
  .reduce((acc, c, index) => ({ ...acc, [c]: index + 1 }), {});

function main() {
  let result = 0;

  for (const backpack of contents) {
    const [c1, c2] = splitInHalf(backpack).map(tokenizeBackpackContents);
    const sharedItem = findSharedItem(c1, c2);
    result += priorities[sharedItem];
  }
  console.log(result);
}

function tokenizeBackpackContents(c) {
  const result = {};
  for (const item of c.split("")) {
    result[item] = result[item] ?? 0 + 1;
  }
  return result;
}

function findSharedItem(a, b) {
  for (const key in a) {
    if (b[key]) {
      return key;
    }
  }
}

function splitInHalf(backpack) {
  const c1 = backpack.slice(0, backpack.length / 2);
  const c2 = backpack.slice(backpack.length / 2);

  return [c1, c2];
}

main();
