const fs = require("fs");
const contents = fs.readFileSync(0, "utf-8").split("\n").filter(Boolean);

const priorities = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  .split("")
  .reduce((acc, c, index) => ({ ...acc, [c]: index + 1 }), {});

function main() {
  let result = 0;

  for (let i = 0; i < contents.length; i += 3) {
    const backpacks = contents.slice(i, i + 3).map(tokenizeBackpackContents);
    const sharedItem = findSharedItem(...backpacks);

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

function findSharedItem(...backpacks) {
  for (const key in backpacks[0]) {
    if (backpacks.every(b => b[key])) {
      return key 
    }
  }
}

main();
