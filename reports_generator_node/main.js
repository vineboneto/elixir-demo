const path = require('path')
const { parserFile, parserFiles } = require('./parser')
const { sumFoods, sumUsers } = require('./utils')

const setup = {
  completed: path.join('..', 'reports', 'report_complete.csv'),
  reports: ['report_1.csv', 'report_2.csv', 'report_3.csv'],
  users: [...Array(30).keys()].map((e) => String(e + 1)),
  foods: ['açaí', 'churrasco', 'esfirra', 'hambúrguer', 'pastel', 'pizza', 'prato_feito', 'sushi'],
}

async function mainReportCompleted() {
  console.time('Read files completed')
  const dataset = await parserFile(setup.completed)
  const users = sumUsers(dataset, setup.users)
  const foods = sumFoods(dataset, setup.foods)
  console.timeEnd('Read files completed')
  console.log(users)
  console.log(foods)
}

async function mainReportParsed() {
  console.time('Read files parsed')
  const dataset = await parserFiles(setup.reports)
  const users = sumUsers(dataset, setup.users)
  const foods = sumFoods(dataset, setup.foods)
  console.timeEnd('Read files parsed')
  console.log(users)
  console.log(foods)
}

mainReportCompleted()
mainReportParsed()
