function get (){
  const attack = document.getElementById("attack-button");
  attack.addEventListener("click", () => {
    console.log("test");
  });
};

window.addEventListener('load', get);