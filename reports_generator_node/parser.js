const fs = require('fs')
const path = require('path')
const { promisify } = require('util')

const readFileAsync = promisify(fs.readFile)

async function parserFile(path) {
  const content = await readFileAsync(path, 'utf-8')
  const lines = content.split(/\r?\n/)
  const parser = lines.map((line) => {
    const [id, food, price] = line.trim().split(',')
    return { id, food, price: Number(price) }
  })
  return parser
}

async function parserFiles(paths) {
  const promises = paths.map((e) => parserFile(path.join('..', 'reports', e)))
  return (await Promise.all(promises)).flat()
}

module.exports = { parserFile, parserFiles }
