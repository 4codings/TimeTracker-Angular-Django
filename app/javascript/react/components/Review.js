import React from 'react'

const Review = props => {
  return(
    <div className="media-object">
      <div className="media-object-section">
        <div className="rating">
          Rating: {props.review.rating}
        </div>
        <div className="review_body">
          Body: {props.review.body}
        </div>
        <hr/>
      </div>
    </div>
  )
}

export default Review;
