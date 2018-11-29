export default () => {

  let form = document.getElementById('new_review')
  const starsNew = document.querySelectorAll(".new_review_stars");
  const newReviews = document.querySelectorAll('.new-reviews')
  let reviewContent = document.getElementById('review_description')
  let reviewStarts  = document.getElementById('review_input')

  newReviews.forEach(newR => {
    newR.addEventListener('click', (e) => {
      let orderId = (e.target.id)
      form.action = `/orders/${orderId}/reviews`
      reviewContent.value = ""
      for (let i = 0; i < 5; i++) {
        starsNew[i].classList.remove("checked");
      }

    })
  })
}
