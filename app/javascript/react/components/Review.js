import React from 'react'

const Review = props => {
  return(
    <div className="media-object">
      <div className="media-object-section">
        <div className="review">
          <div className="review_field">
            <p className="reviewLabel">
              Rating:
            </p>
            {props.review.rating}
          </div>
          <div className="review_field">
            <p className="reviewLabel">
              Review:
            </p>
             {props.review.body}
          </div>
        </div>
      </div>
    </div>
  )
}

export default Review;
