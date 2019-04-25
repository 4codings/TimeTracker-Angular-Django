import React from 'react'

const Review = props => {
  return(
    <div>
      <div className="rating">
        Rating: {props.review.rating}
      </div>
      <div className="review_body">
        Body: {props.review.body}
      </div>
      <hr/>
    </div>
  )
}

export default Review;
