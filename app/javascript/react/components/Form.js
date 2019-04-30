import React, {Component} from 'react'
import TextField from './TextField'

class Form extends Component {
  constructor(props){
    super(props)
    this.state = {
      rating: '',
      body: ''
    }
    this.handleRatingChange = this.handleRatingChange.bind(this)
    this.handleBodyChange = this.handleBodyChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
   }

  handleRatingChange(event){
    this.setState({rating: event.target.value})
  }

  handleBodyChange(event){
    this.setState({body: event.target.value})
  }

  handleSubmit(event){
    event.preventDefault()
    let payload={review: this.state}
    this.props.addNewReview(payload)
  }

  render(){
    console.log(this.state)
    return(
      <form className="newReviewForm" onSubmit = {this.handleSubmit}>
        <TextField
          content  = {this.state.rating}
          label = "Rating"
          name = "rating"
          handleChange = {this.handleRatingChange}
        />

        <TextField
          content  = {this.state.body}
          label = "Review"
          name = "body"
          handleChange = {this.handleBodyChange}
        />
        <input type="submit" value= "Submit"/>
      </form>
    )
  }
}

export default Form
