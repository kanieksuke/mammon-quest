function tips () {
  const getAttack = document.getElementById("attack-button");
  getAttack.addEventListener("mouseover", () => {
    getAttack.setAttribute("style", "background-color:gray")
    const getAttackTips = document.getElementById("tips")
    var attackTips = "マモンに攻撃をします。一日に一回しか攻撃できないから注意してね！"
    getAttackTips.innerHTML = `${attackTips}`
  })

  getAttack.addEventListener("mouseout", () => {
    getAttack.setAttribute("style", "background-color:black")
    const deleteAttackTips = document.getElementById("tips")
    var attackTips = ""
    deleteAttackTips.innerHTML = `${attackTips}`
  })
}

window.addEventListener("load", tips);