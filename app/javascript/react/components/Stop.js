import React from 'react';
import Review from './Review'
import Form from './Form'

class Stop extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      stop: {},
      reviews: [],
      errors: ''
    }
    this.addNewReview = this.addNewReview.bind(this)
  }

  componentDidMount() {
    let stop_id = this.props.params.id
    fetch(`/api/v1/stops/${stop_id}`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}(${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({stop: body.stop,
        reviews: body.reviews})
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  addNewReview(formPayLoad){
    let stop_id = this.props.params.id
    fetch(`/api/v1/stops/${stop_id}/reviews`, {
      method: "POST",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formPayLoad)
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}(${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      console.log(body)
      this.setState({
        stop: body.stop,
        reviews: body.reviews,
        errors: body.errors
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    let body;
    if (this.state.reviews.length > 0 ) {
      body = this.state.reviews.map((review) => {
        return (
          <Review
            key = {review.id}
            review = {review}
          />
        )
      })
    }
    return(
      <div className="stopWrapper">
        <div className="name">
          {this.state.stop.name}
        </div>
        <div className="errors">
          {this.state.errors}
        </div>
        <Form
          handleSubmit = {this.handleSubmit}
          addNewReview = {this.addNewReview}
        />
        <div className="reviews">
          {body}
        </div>
      </div>
    )
  }
}

export default Stop;
