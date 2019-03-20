import React from "react"
import PropTypes from "prop-types"
class Test extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editable: false,
      test: props.test
    };
    this.handleUpdate = this.handleUpdate.bind(this)
  }

  handleUpdate = (test) => {
    this.setState({
      editable: !this.state.editable
    });
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
          <div className="edit-button"><button onClick={(e) => this.handleUpdate(this.state.test)}>{buttonVal}</button></div>
        </div>
    )
  }
}

export default Test
