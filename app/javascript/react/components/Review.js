import React from 'react'

const Review = props => {
  return(
    <div>
      <div className="rating">
        Rating: {props.review.rating}
      </div>
      <div className="name">
        Body: {props.review.body}
      </div>
      <hr/>
    </div>
  )
}

export default Review;
