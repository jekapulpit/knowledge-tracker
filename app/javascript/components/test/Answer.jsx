import React from "react"
import PropTypes from "prop-types"
class Answer extends React.Component {

  constructor(props) {
      super(props);
      this.state = {
          editable: false,
          answer: props.answer
      };
  }

  render () {
    return (
      <span className="radio">
        <label htmlFor={"question_right_answer_" + this.state.answer.id}>
          <input name={"question["+ this.props.question_id +"][right_answer]"}
                 type="radio"
                 value={this.state.answer.id}
                 id={"question_right_answer_" + this.state.answer.id}
                 onChange={this.props.handleOptionChange}
                 defaultChecked={this.props.selected === this.state.answer.id}/>
            {this.state.answer.answer_text + " dsfdsf"}
        </label>
      </span>
    );
  }
}

export default Answer
