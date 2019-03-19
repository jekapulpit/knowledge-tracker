import React from "react"
import PropTypes from "prop-types"
class Test extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editable: false,
      test: props.test
    };
  }

  render() {
    let isPassed = this.state.test.passed ? (<div className='test-status'> passed</div>) : null;
    return(
        <div className="theme-block">
          <div className="theme">
            <div className="number">1</div>
            <a href={'/technologies/' + this.props.technologyId + '/tests/' + this.state.test.id}>{this.state.test.title}</a>
            <p>{this.state.test.discription}</p>
          </div>
          {isPassed}
        </div>
    )
  }
}

export default Test
