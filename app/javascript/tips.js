function tips () {
  const getAttack = document.getElementById("attack-button");
  getAttack.addEventListener("mouseover", () => {
    getAttack.setAttribute("style", "background-color:gray")
    const getAttackTips = document.getElementById("tips")
    var attackTips = "マモンに攻撃をします。<br><br>一日に一回しか攻撃できないから注意してね！<br><br>買い物をし過ぎると逆にマモンのHPが増えちゃうよ！"
    getAttackTips.innerHTML = `${attackTips}`
  })

  getAttack.addEventListener("mouseout", () => {
    getAttack.setAttribute("style", "background-color:black")
    const deleteAttackTips = document.getElementById("tips")
    var attackTips = ""
    deleteAttackTips.innerHTML = `${attackTips}`
  })

  const getShopping = document.getElementById("shopping-button");
  getShopping.addEventListener("mouseover", () => {
    getShopping.setAttribute("style", "background-color:gray")
    const getShoppingTips = document.getElementById("tips")
    var shoppingTips = "買い物をしたら金額を入れて、このボタンをクリックしてください。<br><br>無駄遣いし過ぎると攻撃力が下がるよ！<br><br>欲しがりません勝つまでは٩( 'ω' )و"
    getShoppingTips.innerHTML = `${shoppingTips}`
  })

  getShopping.addEventListener("mouseout", () => {
    getShopping.setAttribute("style", "background-color:black")
    const deleteShoppingTips = document.getElementById("tips")
    var shoppingTips = ""
    deleteShoppingTips.innerHTML = `${shoppingTips}`
  })

  const getEditBudget = document.getElementById("edit-budget-button");
  getEditBudget.addEventListener("mouseover", () => {
    getEditBudget.setAttribute("style", "background-color:gray")
    const getEditBudgetTips = document.getElementById("tips")
    var editBudgetTips = "初期設定や収支報告で間違えて入力してしまったらここで修正してください。<br><br>※※注意※※すでに与えたダメージには反映されません<br><br>なるたけマモンに攻撃する前に修正してね！"
    getEditBudgetTips.innerHTML = `${editBudgetTips}`
  })

  getEditBudget.addEventListener("mouseout", () => {
    getEditBudget.setAttribute("style", "background-color:black")
    const deleteEditBudgetTips = document.getElementById("tips")
    var editBudgetTips = ""
    deleteEditBudgetTips.innerHTML = `${editBudgetTips}`
  })
}

window.addEventListener("load", tips);