import React from "react"
import PropTypes from "prop-types"
class Test extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editable: false,
      test: props.test
    };
    this.handleEdit = this.handleEdit.bind(this)
  }

  handleEdit = () => {
    if(this.state.editable){
      let test = {
        id: this.state.test.id,
        title: this.title.value,
        discription: this.discription.value
      };
      this.handleUpdate(test)
    }
    this.setState({
      editable: !this.state.editable
    });
  };

  handleUpdate = (test) => {
    fetch(`http://localhost:3000/api/tests/${test.id}`,
        {
          method: 'PUT',
          body: JSON.stringify({test: test}),
          headers: {
            'Content-Type': 'application/json'
          }
        }).then((response) => {return response.json()})
        .then((data) => {
      this.setState({
        test: data.test
      })
    })
  };

  render() {
    let status = this.state.test.passed ? (<div className='test-status passed'>v</div>) : (<div className='test-status not-passed'>x</div>);
    let buttonVal = this.state.editable ? 'save' : 'edit';
    let title = this.state.editable ? (<input type='text' ref={input => this.title = input} defaultValue={this.state.test.title}/>) :
        (<a href={'/technologies/' + this.props.technologyId + '/tests/' + this.state.test.id}>
          {this.state.test.title}
        </a>);
    let discription = this.state.editable ? (<textarea ref={input => this.discription = input}>{this.state.test.discription}</textarea>) :
        (<p>{this.state.test.discription}</p>);
    return(
        <div className="theme-block">
          <div className="theme">
            <div className="number">{status}</div>
            {title}
            {discription}
          </div>
          <div className="edit-button">
              <button onClick={(e) => this.handleEdit(this.state.test)}>{buttonVal}</button>
              <button data-confirm="Are you sure?" onClick={(e) => this.props.handleDelete(this.state.test.id)}>delete</button>
          </div>
        </div>
    )
  }
}

export default Test
