function targetTips () {
  const getTargetAmount = document.getElementById("target-amount");
  getTargetAmount.addEventListener("mouseover", () => {
    getTargetAmount.setAttribute("style", "background-color:gray");
    const getTargetAmountTips = document.getElementById("tips")
    var targetAmountTips = "目標金額を設定してください。<br><br>目標が壮大な時は、小分けにしてとりあえずの目標を設定するのがコツだよ！"
    getTargetAmountTips.innerHTML = `${targetAmountTips}`
  })

  getTargetAmount.addEventListener("mouseout", () => {
    getTargetAmount.setAttribute("style", "background-color:black")
    const deleteTargetAmountTips = document.getElementById("tips")
    var targetAmountTips = ""
    deleteTargetAmountTips.innerHTML = `${targetAmountTips}`
  })

  const getTargetDate = document.getElementById("get-date");
  getTargetDate.addEventListener("mouseover", () => {
    getTargetDate.setAttribute("style", "background-color:gray")
    const getTargetDateTips = document.getElementById("tips")
    var targetDateTips = "目標金額をいつまでに貯めるか設定してください。<br><br>フォームの右端をクリックするとカレンダーが出てくるよ！"
    getTargetDateTips.innerHTML = `${targetDateTips}`
  })

  getTargetDate.addEventListener("mouseout", () => {
    getTargetDate.setAttribute("style", "background-color:black")
    const deleteTargetDateTips = document.getElementById("tips")
    var targetDateTips = ""
    deleteTargetDateTips.innerHTML = `${targetDateTips}`
  })
}

function budgetTips () {
  const getIncome = document.getElementById("income");
  getIncome.addEventListener("mouseover", () => {
    getIncome.setAttribute("style", "background-color:gray")
    const getIncomeTips = document.getElementById("tips")
    const today = new Date();
    const monthEnd = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    if (today == monthEnd) {
      var incomeTips = "<例><br>今月の給料<br>今月の業務委託料<br>今月の売買差益<br><br>↑こういったのの合計をざっくり入力してください。"
    } else {
      var incomeTips = "<例><br>先月の給料<br>先月の業務委託料<br>先月の売買差益<br><br>↑こういったのの合計をざっくり入力してください。"
    }
    getIncomeTips.innerHTML = `${incomeTips}`
  })

  getIncome.addEventListener("mouseout", () => {
    getIncome.setAttribute("style", "background-color:black")
    const deleteIncomeTips = document.getElementById("tips")
    var incomeTips = ""
    deleteIncomeTips.innerHTML = `${incomeTips}`
  })

  const getFixedCost = document.getElementById("fixed-cost");
  getFixedCost.addEventListener("mouseover", () => {
    getFixedCost.setAttribute("style", "background-color:gray")
    const getFixedCostTips = document.getElementById("tips")
    const today = new Date();
    const monthEnd = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    if (today == monthEnd) {
      var fixedCostTips = "<例><br>今月払った家賃<br>今月かかったスマホ代<br>今月かかった水道光熱費<br><br>↑こういったのの合計をざっくり入力してください。"
    } else {
      var fixedCostTips = "<例><br>先月払った家賃<br>先月かかったスマホ代<br>先月かかった水道光熱費<br><br>↑こういったのの合計をざっくり入力してください。"
    }
    getFixedCostTips.innerHTML = `${fixedCostTips}`
  })

  getFixedCost.addEventListener("mouseout", () => {
    getFixedCost.setAttribute("style", "background-color:black")
    const deleteFixedCostTips = document.getElementById("tips")
    var fixedCostTips = ""
    deleteFixedCostTips.innerHTML = `${fixedCostTips}`
  })

  const getSubmitConfirmation = document.getElementById("submit-confirmation");
  getSubmitConfirmation.addEventListener("mouseover", () => {
    getSubmitConfirmation.setAttribute("style", "background-color:gray")
    const getSubmitConfirmationTips = document.getElementById("tips")
    var submitConfirmationTips = "全部入力したら確認画面へGo!"
    getSubmitConfirmationTips.innerHTML = `${submitConfirmationTips}`
  })

  getSubmitConfirmation.addEventListener("mouseout", () => {
    getSubmitConfirmation.setAttribute("style", "background-color:black")
    const deleteSubmitConfirmationTips = document.getElementById("tips")
    var submitConfirmationTips = ""
    deleteSubmitConfirmationTips.innerHTML = `${submitConfirmationTips}`
  })
}

function battleTips () {
  const getAttack = document.getElementById("attack-button");
  getAttack.addEventListener("mouseover", () => {
    getAttack.setAttribute("style", "background-color:gray")
    const getAttackTips = document.getElementById("tips")
    var attackTips = "マモンに攻撃をします。<br><br>一日に一回しか攻撃できません。<br>毎日欠かさず攻撃しよう！<br><br>買い物をし過ぎると逆にマモンのHPが増えちゃうよ！"
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
    var shoppingTips = "買い物をしたら金額を入れて、このボタンをクリックしてください。無駄遣いし過ぎると攻撃力が下がるよ！<br><br>※※注意※※<br>1回買い物をすると、入力フォームにその日の買い物の合計金額が表示されます。<br>2回目以降の買い物で再入力する際は、合計額ではなくその買い物で使った金額を入力してください。"
    getShoppingTips.innerHTML = `${shoppingTips}`
  })

  getShopping.addEventListener("mouseout", () => {
    getShopping.setAttribute("style", "background-color:black")
    const deleteShoppingTips = document.getElementById("tips")
    var shoppingTips = ""
    deleteShoppingTips.innerHTML = `${shoppingTips}`
  })

  const getAssumptionDamage = document.getElementById("assumption-damage");
  getAssumptionDamage.addEventListener("mouseover", () => {
    const getAssumptionDamageTips = document.getElementById("tips")
    var assumptionDamageTips = "マモンに攻撃をした時に与えることのできる現在のダメージ量です。<br><br>この数値を超える金額の買い物をしてしまうと、攻撃をした時にマモンのHPが増えてしまいます。"
    getAssumptionDamageTips.innerHTML = `${assumptionDamageTips}`
  })

  getAssumptionDamage.addEventListener("mouseout", () => {
    const deleteAssumptionDamageTips = document.getElementById("tips")
    var assumptionDamageTips = ""
    deleteAssumptionDamageTips.innerHTML = `${assumptionDamageTips}`
  })

  const getEditBudget = document.getElementById("edit-budget-button");
  getEditBudget.addEventListener("mouseover", () => {
    getEditBudget.setAttribute("style", "background-color:gray")
    const getEditBudgetTips = document.getElementById("tips")
    var editBudgetTips = "初期設定や収支報告で間違えて入力してしまったらここで修正してください。<br><br>※※注意※※<br>すでに与えたダメージには反映されません<br>なるたけマモンに攻撃する前に修正してね！"
    getEditBudgetTips.innerHTML = `${editBudgetTips}`
  })

  getEditBudget.addEventListener("mouseout", () => {
    getEditBudget.setAttribute("style", "background-color:black")
    const deleteEditBudgetTips = document.getElementById("tips")
    var editBudgetTips = ""
    deleteEditBudgetTips.innerHTML = `${editBudgetTips}`
  })

  const getDestroyTarget = document.getElementById("destroy-target-button");
  getDestroyTarget.addEventListener("mouseover", () => {
    getDestroyTarget.setAttribute("style", "background-color:gray")
    const getDestroyTargetTips = document.getElementById("tips")
    var destroyTargetTips = "マモンとの戦いを諦めて目標設定し直します。<br><br>エグ過ぎる貯蓄計画を組んじゃった時はやり直すのも一つの手だよ！<br><br>節約は無理せず楽しく！"
    getDestroyTargetTips.innerHTML = `${destroyTargetTips}`
  })

  getDestroyTarget.addEventListener("mouseout", () => {
    getDestroyTarget.setAttribute("style", "background-color:black")
    const deleteDestroyTargetTips = document.getElementById("tips")
    var destroyTargetTips = ""
    deleteDestroyTargetTips.innerHTML = `${destroyTargetTips}`
  })

  const getMammonImage = document.getElementById("mammon-image")
  getMammonImage.addEventListener("mouseover", () => {
    const getMammonTips = document.getElementById("tips")
    var mammonTips = "あなたの欲望が具現化した悪魔です。<br><br>ひたすら寝まくって魔力を溜めています。どんなに殴る蹴るされても起きません。<br><br>なので魔力が溜まり切るまでは人畜無害です。"
    getMammonTips.innerHTML = `${mammonTips}`
  })

  getMammonImage.addEventListener("mouseout", () => {
    const deleteMammonTips = document.getElementById("tips")
    var mammonTips = ""
    deleteMammonTips.innerHTML = `${mammonTips}`
  })

  const getMammonHp = document.getElementById("mammon-hp")
  getMammonHp.addEventListener("mouseover", () => {
    const getHpTips = document.getElementById("tips")
    var hpTips = "マモンのHPです。<br>MPが溜まる前に削り切りましょう。"
    getHpTips.innerHTML = `${hpTips}`
  })

  getMammonHp.addEventListener("mouseout", () => {
    const deleteHpTips = document.getElementById("tips")
    var hpTips = ""
    deleteHpTips.innerHTML = `${hpTips}`
  })

  const getMammonMp = document.getElementById("mammon-mp")
  getMammonMp.addEventListener("mouseover", () => {
    const getMpTips = document.getElementById("tips")
    var mpTips = "マモンのMPです。<br>攻撃を受ける度1ずつ溜まっていきます。<br>満タンになると悲惨な目に遭ってしまいます..."
    getMpTips.innerHTML = `${mpTips}`
  })

  getMammonMp.addEventListener("mouseout", () => {
    const deleteMpTips = document.getElementById("tips")
    var mpTips = ""
    deleteMpTips.innerHTML = `${mpTips}`
  })
}

function goToBattleTips () {
  const getGoToBattle = document.getElementById("go-to-battle");
  getGoToBattle.addEventListener("mouseover", () => {
    getGoToBattle.setAttribute("style", "background-color:gray")
    const getGoToBattleTips = document.getElementById("tips")
    var goToBattleTips = "マモンに戦いを挑みます。"
    getGoToBattleTips.innerHTML = `${goToBattleTips}`
  })

  getGoToBattle.addEventListener("mouseout", () => {
    getGoToBattle.setAttribute("style", "background-color:black")
    const deleteGoToBattleTips = document.getElementById("tips")
    var goToBattleTips = ""
    deleteGoToBattleTips.innerHTML = `${goToBattleTips}`
  })
}

function returnTips () {
  const getReturn = document.getElementById("return");
  getReturn.addEventListener("mouseover", () => {
    getReturn.setAttribute("style", "background-color:gray")
    const getReturnTips = document.getElementById("tips")
    var returnTips = "設定し直したい場合は、こちらのリンクから戻ってください。"
    getReturnTips.innerHTML = `${returnTips}`
  })

  getReturn.addEventListener("mouseout", () => {
    getReturn.setAttribute("style", "background-color:black")
    const deleteReturnTips = document.getElementById("tips")
    var returnTips = ""
    deleteReturnTips.innerHTML =`${returnTips}`
  })
}

function logoutTips () {
  const getLogout = document.getElementById("logout");
  getLogout.addEventListener("mouseover", () => {
    getLogout.setAttribute("style", "background-color:gray")
    const getLogoutTips = document.getElementById("tips")
    var logoutTips = "また遊びに来てね！"
    getLogoutTips.innerHTML = `${logoutTips}`
  })

  getLogout.addEventListener("mouseout", () => {
    getLogout.setAttribute("style", "background-color:black")
    const deleteLogoutTips = document.getElementById("tips")
    var logoutTips = ""
    deleteLogoutTips.innerHTML = `${logoutTips}`
  })
}

window.addEventListener("load", targetTips);
window.addEventListener("load", budgetTips);
window.addEventListener("load", battleTips);
window.addEventListener("load", goToBattleTips);
window.addEventListener("load", returnTips);
window.addEventListener("load", logoutTips);