const fs = require("fs");
const path = require("path");

// Setup
const absolutePath = path.join(__dirname, "reports");
const reportCompleted = path.join(absolutePath, "report_complete.csv");
const reports = ["report_1.csv", "report_2.csv", "report_3.csv"];
const availableFoods = [
  "açaí",
  "churrasco",
  "esfirra",
  "hambúrguer",
  "pastel",
  "pizza",
  "prato_feito",
  "sushi",
];
const usersIds = [...Array(30).keys()].map((e) => String(e + 1));

function sumFoods(dataset) {
  return availableFoods.map((food) => {
    const sum = dataset.reduce((prev, current) => {
      if (current.food === food) {
        return prev + 1;
      }
      return prev;
    }, 0);
    return { food, sum };
  });
}

function sumUsers(dataset) {
  return usersIds.map((id) => {
    const sum = dataset.reduce((prev, current) => {
      if (current.id === id) {
        return prev + current.price;
      }
      return prev;
    }, 0);
    return { id, sum };
  });
}

function parserFile(path) {
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

async function mainReportCompleted() {
  console.time("Read files completed");
  const dataset = await parserFile(reportCompleted);
  const users = sumUsers(dataset);
  const foods = sumFoods(dataset);
  console.timeEnd("Read files completed");
}

async function mainReportParsed() {
  console.time("Read files parsed");
  const promises = reports.map((report) =>
    parserFile(path.join(absolutePath, report))
  );
  const datasets = (await Promise.all(promises)).flat();
  const users = sumUsers(datasets);
  const foods = sumFoods(datasets);
  console.timeEnd("Read files parsed");
}

mainReportCompleted();
mainReportParsed();
