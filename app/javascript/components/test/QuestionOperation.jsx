import React from "react"
import PropTypes from "prop-types"
import AnswerOperation from "./AnswerOperation";
class QuestionOperation extends React.Component{
  constructor(props) {
      super(props);
      this.state = {
          activeAnswer: null
      };
      this.handleOptionChange = this.handleOptionChange.bind(this)
  }

  handleOptionChange = (changeEvent) => {
        this.setState({
            activeAnswer: changeEvent.target.value
        });
        console.log(this.state.activeAnswer + " " + changeEvent.target.value)
    };

  render() {
      let answered = {};
      let answers = this.props.answers.map((answer) => {
          return(
              <AnswerOperation  handleOptionChange={this.handleOptionChange}
                                key={answer.id}
                                answer={answer}
                                activeAnswer={this.state.activeAnswer}/>
          )
      });
      return(
          <div className="question-block">
              <h1>{this.props.question.question_text}</h1>
              <form>
                  <input defaultValue={this.props.test.id} ref={input => answered.test_id = input} style={{display: 'none'}} type="text"/>
                  <input defaultValue={this.props.question.id} ref={input => answered.question_id = input} style={{display: 'none'}} type="text"/>
                  <div className="custom-radios">
                      {answers}
                  </div>
                  <button className="submit-btn">send</button>
              </form>
          </div>
      )
  }
};

export default QuestionOperation
