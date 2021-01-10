document.addEventListener("DOMContentLoaded", () => {
  const inputElement = document.getElementById("search-field");
  inputElement.addEventListener("keyup", () => {
    const keyword = document.getElementById("search-field").value;
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `search/?keyword=${keyword}`, true);
    XHR.responseType = "json";
    XHR.send();
  })
  
})