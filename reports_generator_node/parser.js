const fs = require("fs");
const path = require("path");

async function parserFile(path) {
  return new Promise((resolve, reject) => {
    fs.readFile(path, "utf8", (err, data) => {
      if (err) {
        console.error(err);
        reject(err);
      }
      const lines = data.split(/\r?\n/);
      const dataset = [];
      lines.forEach((line) => {
        const [id, food, price] = line.trim().split(",");
        dataset.push({ id, food, price: Number(price) });
      });
      resolve(dataset);
    });
  });
}

async function parserFiles(paths) {
  const promises = paths.map((e) => parserFile(path.join("reports", e)));
  return (await Promise.all(promises)).flat();
}

module.exports = { parserFile, parserFiles };
