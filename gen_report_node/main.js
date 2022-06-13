const fs = require('fs')
const path = require('path')
const { promisify } = require('util')

const readFileAsync = promisify(fs.readFile)

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

async function parserFile(path) {
  const content = await readFileAsync(path, 'utf-8')
  const lines = content.split(/\r?\n/)
  const parser = lines.map((line) => {
    const [name, hour, day, month, year] = line.trim().split(',')
    return {
      name: name.toLowerCase(),
      hour: Number(hour),
      day: Number(day),
      month: setup.months[Number(month) - 1],
      year: Number(year),
    }
  })
  return parser
}

async function parserFiles(paths) {
  const promises = paths.map((e) => parserFile(path.join('..', 'reports', e)))
  return (await Promise.all(promises)).flat()
}

function sumDataset(dataset, callback) {
  const sum = dataset.reduce((prev, current) => {
    if (callback(current)) {
      return prev + current.hour
    }
    return prev
  }, 0)
  return sum
}

function sumHours(dataset) {
  return setup.names.map((name) => {
    const isName = (current) => current.name === name
    const sum = sumDataset(dataset, isName)
    return { [name]: sum }
  })
}

function sumPerYears(dataset) {
  return setup.names.map((name) => {
    const perYears = setup.years.map((year) => {
      const isData = (current) => current.year === year && current.name === name
      const sum = sumDataset(dataset, isData)
      return { [year]: sum }
    })

    return { [name]: perYears }
  })
}

function sumPerMonth(dataset) {
  return setup.names.map((name) => {
    const perMonths = setup.months.map((month) => {
      const isData = (current) => current.month == month && current.name === name
      const sum = sumDataset(dataset, isData)
      return { [month]: sum }
    })

    return { [name]: perMonths }
  })
}

async function mainReportCompleted() {
  console.time('Read files completed')
  const dataset = await parserFile(setup.completed)
  const allHours = sumHours(dataset)
  const hoursPerYear = sumPerYears(dataset)
  const hoursPerMonth = sumPerMonth(dataset)
  console.timeEnd('Read files completed')
  display(allHours, hoursPerMonth, hoursPerYear)
}

async function mainReportParsed() {
  console.time('Read files parsed')
  const dataset = await parserFiles(setup.reports)
  const allHours = sumHours(dataset)
  const hoursPerYear = sumPerYears(dataset)
  const hoursPerMonth = sumPerMonth(dataset)
  console.timeEnd('Read files parsed')
  display(allHours, hoursPerMonth, hoursPerYear)
}

// mainReportCompleted()
mainReportParsed()
