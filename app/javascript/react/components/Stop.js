import React from 'react';
import Review from './Review'

class Stop extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      stop: {},
      reviews: []

    }
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

  render(){
    let review_rating=[]
    let body = []

    if (this.state.reviews.length > 0 ) {
      this.state.reviews.forEach((review) => {
        body.push(<Review
          key = {review.id}
          review = {review}/>)
      })
    }

    return(

      <div>
        <div className="id">
          ID: {this.state.stop.id}
        </div>
        <div className="name">
          Name: {this.state.stop.name}
        </div>
        <div className="reviews">
          {body}
        </div>
      </div>
    )
  }
}

export default Stop;
