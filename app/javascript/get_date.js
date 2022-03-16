function get (){
  const getDate = document.getElementById("get-date");
  getDate.addEventListener("change", () => {
    const today = new Date();
    const todayInput = today.getDate();
    const [year, month1, day] = getDate.value.split('-');
    const targetDay = new Date(year, month1 - 1, day);
    const targetDayInput = targetDay.getDate();
    const timeSubtraction = targetDayInput - todayInput
    const setDate = document.getElementById("get-date")
    setDate.innerHTML = `${timeSubtraction}`
  });
};

window.addEventListener('load', get);