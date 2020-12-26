const pullDown = () => {
  const dotsIcon = document.getElementById("dots-icon");
  const dotsList = document.getElementById("dots-list");

  dotsIcon.addEventListener('click', function(){
    if (dotsList.getAttribute("style") == "display:block;"){
      dotsList.removeAttribute("style", "display:block;")
    } else {
      dotsList.setAttribute("style", "display:block;")
    }
  })
}
if (!document.URL.match( /sign_in/ )) {
window.addEventListener("load", pullDown)
};