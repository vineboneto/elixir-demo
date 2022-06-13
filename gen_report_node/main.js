const path = require('path')
const { parserFile, parserFiles } = require('./parser')
const { sumHours, sumPerYears, sumPerMonth } = require('./utils')

const setup = {
  completed: path.join('..', 'reports', 'gen_report.csv'),
  reports: ['part_1.csv', 'part_2.csv', 'part_3.csv'],
  years: [2016, 2017, 2018, 2019, 2020],
  names: ['cleiton', 'daniele', 'danilo', 'diego', 'giuliano', 'jakeliny', 'joseph', 'mayk', 'rafael', 'vinicius'],
  months: [
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'maio',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro',
  ],
}

function display(allHours, hoursPerMonth, hoursPerYear) {
  console.log(JSON.stringify({ allHours, hoursPerMonth, hoursPerYear }, null, 2))
}

async function mainReportCompleted() {
  console.time('Read files completed')
  const dataset = await parserFile(setup.completed)
  const allHours = sumHours(dataset, setup.names)
  const hoursPerYear = sumPerYears(dataset, setup.names, setup.years)
  const hoursPerMonth = sumPerMonth(dataset, setup.names, setup.months)
  console.timeEnd('Read files completed')
  display(allHours, hoursPerMonth, hoursPerYear)
}

async function mainReportParsed() {
  console.time('Read files parsed')
  const dataset = await parserFiles(setup.reports)
  const allHours = sumHours(dataset, setup.names)
  const hoursPerYear = sumPerYears(dataset, setup.names, setup.years)
  const hoursPerMonth = sumPerMonth(dataset, setup.names, setup.months)
  console.timeEnd('Read files parsed')
  display(allHours, hoursPerMonth, hoursPerYear)
}

// mainReportCompleted()
mainReportParsed()
