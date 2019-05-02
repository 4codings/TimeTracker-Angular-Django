import React from 'react'

class Review extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      upVotes: this.props.review.up_votes,
      downVotes: this.props.review.down_votes,
      currentVote: null,
      thumbsUp: "",
      thumbsDown: ""
    }
    this.conditionalStyling = this.conditionalStyling.bind(this)
    this.handleUpdateVote = this.handleUpdateVote.bind(this)
  }

  componentDidMount() {
    let review_id = this.props.review.id
    fetch(`/api/v1/votes/${review_id}`)
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
      this.setState({currentVote: body.vote})
    })
    .then(body => {
      this.conditionalStyling()
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleUpdateVote(event) {
    fetch("/api/v1/votes",{
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        review_id: this.props.review.id,
        vote: event.currentTarget.id
      })
    })
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
      this.setState({
        currentVote: body.vote,
        upVotes: body.upVotes,
        downVotes: body.downVotes
      })
    })
    .then(body => {
      this.conditionalStyling()
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  conditionalStyling() {
    let thumbsUp;
    let thumbsDown;
    if (this.state.currentVote == 1){
      this.setState({thumbsUp: "active", thumbsDown: ""})
    }
    else if (this.state.currentVote == -1) {
      this.setState({thumbsUp: "", thumbsDown: "active"})
    } else {
      this.setState({thumbsUp: "", thumbsDown: ""})
    }
  }

  render() {
    return(
      <div className="media-object">
        <div className="media-object-section">
          <div className="review">
            <div className="review_field">
              <p className="reviewLabel">
                Rating:
              </p>
              {this.props.review.rating}
            </div>
            <div className="review_field">
              <p className="reviewLabel">
                Review:
              </p>
              {this.props.review.body}
            </div>
            <div id="up" onClick={this.handleUpdateVote}>
              <i className={`fa ${this.state.thumbsUp} fa-thumbs-up`}/> Up votes: {this.state.upVotes}
            </div>
            <div id="down" onClick={this.handleUpdateVote}>
              <i className={`fa ${this.state.thumbsDown} fa-thumbs-down`}/> Down votes: {this.state.downVotes}
            </div>
          </div>
        </div>
      </div>
    )
  }

}

export default Review;
