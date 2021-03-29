const addUnderline = () => {
  const Links = document.querySelectorAll("#link");
  Links.forEach(function (Link) {
    Link.addEventListener('mouseover', () => {
      Link.setAttribute("style", "text-decoration:underline;");
    });
    Link.addEventListener('mouseout', () => {
      Link.removeAttribute("style", "text-decoration:underline;");
    });
  });
}

window.addEventListener('load', addUnderline);