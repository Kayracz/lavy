export default () => {
  const stars = document.querySelectorAll(".review_stars");
  const formStars = document.getElementById('review_input')

  stars.forEach((star, index) => {
    star.addEventListener("click", event => {

      for (let i = 0; i < 5; i++) {
        stars[i].classList.remove("checked");
      }
      for (let i = 0; i <= index; i++) {
        stars[i].classList.add("checked");
      }

      formStars.value = index + 1
    });
  })
}
