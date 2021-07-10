$(() => {
  const parentMenu = document.querySelectorAll('.question');
  for(let i = 0; i < parentMenu.length;i++) {
    parentMenu[i].addEventListener('click', (e) => {
      e.preventDefault();
    })
  }
});