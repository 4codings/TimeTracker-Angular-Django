import React from 'react'

class Review extends React.Component{
  constructor(props){
    super(props)
    this.state={
      review: {}
    }
  }

  componentDidMount() {

    // let review_id = this.state
    // fetch(`/api/v1/stops/${stop_id}/reviews/${id}`)
    //   .then(response => {
    //     if (response.ok) {
    //       return response;
    //     } else {
    //       let errorMessage = `${response.status}(${response.statusText})` ,
    //       error = new Error(errorMessage);
    //       throw(error);
    //     }
    //     })
    //     .then(response => response.json())
    //     .then(body => {
    //       console.log(body)
    //
    //       this.setState({stop: body})
    //     })
    //     .catch(error => console.error(`Error in fetch: ${error.message}`));
  }


  render(){
    return(
      <div>
        // <div className="rating">
        //   Rating: {this.state.review.rating}
        // </div>
        // <div className="name">
        //   Body: {this.state.review.body}
        // </div>
      </div>

    )
  }


}
export default Review;
