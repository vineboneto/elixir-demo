function sumFoods(dataset, foods) {
  return foods.map((food) => {
    const sum = dataset.reduce((prev, current) => {
      if (current.food === food) {
        return prev + 1
      }
      return prev
    }, 0)
    return { food, sum }
  })
}

function sumUsers(dataset, users) {
  return users.map((id) => {
    const sum = dataset.reduce((prev, current) => {
      if (current.id === id) {
        return prev + current.price
      }
      return prev
    }, 0)
    return { id, sum }
  })
}

module.exports = { sumUsers, sumFoods }
