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
    let isPassed = this.state.test.passed ? (<i style={{color: 'green', fontFamily: 'Lora-italic'}}> passed</i>) : null;
    return(
        <div key={this.state.test.id} className="theme-block">
          <div className="theme">
            <a href={'/technologies/' + this.props.technologyId + '/tests/' + this.state.test.id}>{this.state.test.title}</a>
            {isPassed}
          </div>
        </div>
    )
  }
}

export default Test
