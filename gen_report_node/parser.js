const fs = require('fs')
const path = require('path')
const { promisify } = require('util')

const months = [
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
]

const readFileAsync = promisify(fs.readFile)

async function parserFile(path) {
  const content = await readFileAsync(path, 'utf-8')
  const lines = content.split(/\r?\n/)
  const parser = lines.map((line) => {
    const [name, hour, day, month, year] = line.trim().split(',')
    return {
      name: name.toLowerCase(),
      hour: Number(hour),
      day: Number(day),
      month: months[Number(month) - 1],
      year: Number(year),
    }
  })
  return parser
}

async function parserFiles(paths) {
  const promises = paths.map((e) => parserFile(path.join('..', 'reports', e)))
  return (await Promise.all(promises)).flat()
}

module.exports = { parserFile, parserFiles }
