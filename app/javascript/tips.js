function tips () {
  const getAttack = document.getElementById("attack-button");
  getAttack.addEventListener("mouseover", () => {
    getAttack.setAttribute("style", "background-color:gray")
  })

  getAttack.addEventListener("mouseout", () => {
    getAttack.setAttribute("style", "background-color:black")
  })
}

window.addEventListener("load", tips);