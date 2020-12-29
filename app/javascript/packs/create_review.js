const createReview = () => {
  const postBottun = document.getElementById("review-post-btn");
  const reviewPostArea = document.getElementById("review-post-area");
  if(postBottun != null && reviewPostArea != null) {
    postBottun.addEventListener('click', function(){
      if (reviewPostArea.getAttribute("style") == "display:block;"){
        reviewPostArea.removeAttribute("style", "display:block;")
      } else {
        reviewPostArea.setAttribute("style", "display:block;")
      }
    })
  }
}

window.addEventListener("load", createReview)