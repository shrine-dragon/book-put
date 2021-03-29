const changeColor = () => {
  const orangeButtons = document.querySelectorAll("#orange-btn")
  orangeButtons.forEach((button) => {
    button.addEventListener('mouseover', () => {
      button.setAttribute("style", "background-color:#FFAD90;");
    });
    button.addEventListener('mouseout', () => {
      button.removeAttribute("style", "background-color:#FFAD90;");
    });
  });

  const blueButtons = document.querySelectorAll("#blue-btn")
  blueButtons.forEach((button) => {
    button.addEventListener('mouseover', () => {
      button.setAttribute("style", "background-color:#66CCFF;");
    });
    button.addEventListener('mouseout', () => {
      button.removeAttribute("style", "background-color:#66CCFF;");
    });
  });

  const searchLists = document.querySelectorAll("#list");
  searchLists.forEach((list) => {
    list.addEventListener('mouseover', () => {
      list.setAttribute("style", "color: #FF9933");
    });
    list.addEventListener('mouseout', () => {
      list.removeAttribute("style", "color: #FF9933");
    });
  });
}

window.addEventListener('load', changeColor);