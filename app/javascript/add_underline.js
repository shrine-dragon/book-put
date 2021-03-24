const addUnderline = () => {
  const footerLinks = document.querySelectorAll(".footer-link");
  footerLinks.forEach(function (footerLink) {
    footerLink.addEventListener('mouseover', () => {
      footerLink.setAttribute("style", "text-decoration:underline;")
    });
    footerLink.addEventListener('mouseout', () => {
      footerLink.removeAttribute("style", "text-decoration:underline;")
    });
  });
}

window.addEventListener('load', addUnderline);