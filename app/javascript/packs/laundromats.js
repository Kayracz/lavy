const modalContent = document.getElementById('modal-content')

const handleShow = reviews => {
  modalContent.innerHTML = ""
  modalContent.insertAdjacentHTML('beforeend', showReviews(reviews))
}

const showReviews = reviews => `
  ${reviews.reverse().slice(0, 5).map(review => `
    <p><i>${review.description}</i></p>
    ${`<span class="fa fa-star checked"></span>`.repeat(review.stars)}
    ${`<span class="fa fa-star"></span>`.repeat(5 - review.stars)}
  `)}
`

const fillModal = laundromat_id => {
  const laundromatNode = document.getElementById(`laundromat-node-${laundromat_id}`)
  const laundromatReviews = JSON.parse(laundromatNode.dataset.reviews)
  console.log(laundromatNode)
  handleShow(laundromatReviews)
}

const btnsReviews = document.querySelectorAll('.btn-reviews')

btnsReviews.forEach(btn => {
  btn.addEventListener('click', (e) => {
    fillModal(e.target.id)
  })
})
