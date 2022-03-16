function get (){
  const getDate = document.getElementById("get-date");
  getDate.addEventListener("change", () => {
    const today = new Date();
    const currentYear = today.getFullYear() * 365;
    const currentMonthBase = today.getMonth() + 1;
    let currentMonth = 0
    for ( let i = 1; i < currentMonthBase; i++ ) {
      if (i == 2) {
        if (currentYear % 100 == 0 && currentYear % 400 != 0) {
          currentMonth +=28
        } else if (currentYear % 4 == 0) {
          currentMonth +=29
        } else {
          currentMonth +=28
        }
      } else if (i == 4 || i == 6 || i == 9 || i == 11) {
        currentMonth += 30
      } else {
        currentMonth += 31
      }
    }
    const currentDay = today.getDate();
    const [year, month1, day] = getDate.value.split('-');
    const targetDay = new Date(year, month1 - 1, day);
    const targetYear = targetDay.getFullYear() * 365;
    const targetMonthBase = targetDay.getMonth() + 1
    let targetMonth = 0
    for ( let i = 1; i < targetMonthBase; i++ ) {
      if (i == 2) {
        if (targetYear % 100 == 0 && targetYear % 400 != 0) {
          targetMonth +=28
        } else if (currentYear % 4 == 0) {
          targetMonth +=29
        } else {
          targetMonth +=28
        }
      } else if (i == 4 || i == 6 || i == 9 || i == 11) {
        targetMonth += 30
      } else {
        targetMonth += 31
      }
    }
    const targetDayInput = targetDay.getDate();
    const timeSubtraction = (targetYear + targetMonth + targetDayInput) - (currentYear + currentMonth + currentDay)
    console.log(targetMonthBase)
    console.log(targetMonth)
    const renderDate = document.getElementById("target-form");
    const targetDateObj = `<input value=${timeSubtraction} name='target_budget[target_date]' type="hidden">`;
    renderDate.insertAdjacentHTML("beforeend", targetDateObj);
  });
};

window.addEventListener('load', get);