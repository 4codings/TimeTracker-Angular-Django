import React from 'react';

class Stop extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      stop: {}
    }
  }

  componentDidMount() {
    // debugger
    let review= this.props.params
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
          console.log(body)

          this.setState({stop: body})
        })
        .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    return(
      <div>
        <div className="id">
          Id: {this.state.stop.id}
        </div>
        <div className="name">
          Name: {this.state.stop.name}
        </div>
      </div>
    )
  }
}

export default Stop;
