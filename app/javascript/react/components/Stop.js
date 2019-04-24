import React from 'react';

class Stop extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      stop: {},
      reviews: {}

    }
  }



  componentDidMount() {

    let stop_id = this.props.params.id
    fetch(`/api/v1/stops/${stop_id}`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status}(${response.statusText})` ,
          error = new Error(errorMessage);
          throw(error);
        }
        })
        .then(response => response.json())
        .then(body => {
          this.setState({stop: body.stop})
          this.setState({reviews: body.reviews})
        })
        .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
     debugger
    let review_list;
    // this.state.reviews.forEach((review) => {
    //   console.log(review)
    //   review_list += review.rating
    // })
    return(
      <div>
        <div className="id">
          Id: {this.state.stop.id}
        </div>
        <div className="name">
          Name: {this.state.stop.name}
        </div>
        <div className="reviews">
      
        </div>
        <div>
          <div>
            Rating: {this.state.reviews.rating}
          </div>
          <div>
            Review: {this.state.reviews.body}
          </div>
        </div>
      </div>
    )
  }
}

export default Stop;
