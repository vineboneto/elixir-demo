function sumHours(dataset, names) {
  return names.map((name) => {
    const sum = dataset.reduce((prev, current) => {
      if (current.name === name) {
        return prev + current.hour
      }
      return prev
    }, 0)
    return { [name]: sum }
  })
}

function sumPerYears(dataset, names, years) {
  return names.map((name) => {
    const perYears = years.map((year) => {
      const sum = dataset.reduce((prev, current) => {
        if (current.year === year && current.name === name) {
          return prev + current.hour
        }
        return prev
      }, 0)
      return { [year]: sum }
    })

    return { [name]: perYears }
  })
}

function sumPerMonth(dataset, names, months) {
  return names.map((name) => {
    const perMonths = months.map((month) => {
      const sum = dataset.reduce((prev, current) => {
        if (current.month == month && current.name === name) {
          return prev + current.hour
        }
        return prev
      }, 0)
      return { [month]: sum }
    })

    return { [name]: perMonths }
  })
}

module.exports = { sumHours, sumPerYears, sumPerMonth }
