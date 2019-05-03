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
    this.clearForm = this.clearForm.bind(this)
   }

  handleRatingChange(event){
    this.setState({rating: event.target.value})
  }

  handleBodyChange(event){
    this.setState({body: event.target.value})
  }

  clearForm() {
    this.setState({rating: '', body: ''})
  }

  handleSubmit(event){
    event.preventDefault()
    let payload={review: this.state}
    this.props.addNewReview(payload)
    this.clearForm()
  }

  render(){
    return(
      <div>
        <form className="newReviewForm" onSubmit={ this.handleSubmit}>
          <h3>Add a new review</h3>
          <TextField content={ this.state.rating} label="Rating" name="rating" handleChange={ this.handleRatingChange} />

          <TextField content={ this.state.body} label="Review" name="body" handleChange={ this.handleBodyChange} />
          <input type="submit" value="Submit" />
        </form>
      </div>
    )
  }
}

export default Form
