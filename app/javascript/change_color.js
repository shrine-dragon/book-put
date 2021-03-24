const changeColor = () => {
  const orangeButtons = document.querySelectorAll("#orange-btn")
  orangeButtons.forEach(function (button) {
    button.addEventListener('mouseover', () => {
      button.setAttribute("style", "background-color:#FFAD90;")
    });
    button.addEventListener('mouseout', () => {
      button.removeAttribute("style", "background-color:#FFAD90;")
    });
  });

  const blueButtons = document.querySelectorAll("#blue-btn")
  blueButtons.forEach(function (button) {
    button.addEventListener('mouseover', () => {
      button.setAttribute("style", "background-color:#66CCFF;")
    });
    button.addEventListener('mouseout', () => {
      button.removeAttribute("style", "background-color:#66CCFF;")
    });
  });
}

window.addEventListener('load', changeColor);