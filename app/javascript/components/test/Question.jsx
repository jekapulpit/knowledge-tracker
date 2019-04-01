import React from "react"
import Carousel from 'react-bootstrap/Carousel'

import PropTypes from "prop-types"
class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question: props.question
    };
  }

  render () {
    return (
            <div className="question-block">
              <form className="question-form">
                <input type='text' ref={input => this.question_text = input} defaultValue={this.state.question.question_text}/>
                <input type='text' ref={input => this.test_id = input} defaultValue={this.state.question.test_id} style={{ display: 'none' }} />
                <div className="custom-radios">
                <span className="radio">
                  <label htmlFor={"question_right_answer_1_" + this.state.question.id}>
                    <input ref={input => this.right_answer = input} type="radio" value="1" id={"question_right_answer_1_" + this.state.question.id}/>
                    stubbb
                  </label>
                </span>
                  <span className="radio">
                  <label htmlFor={"question_right_answer_1_" + this.state.question.id}>
                    <input ref={input => this.right_answer = input} type="radio" value="2" id={"question_right_answer_2_" + this.state.question.id}/>
                    stubbb
                  </label>
                </span>
                </div>
              </form>
            </div>
    );
  }
}

export default Question
