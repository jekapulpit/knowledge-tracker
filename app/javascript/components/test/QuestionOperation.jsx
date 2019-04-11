import React from "react"
import PropTypes from "prop-types"
class QuestionOperation extends React.Component{
  constructor(props) {
      super(props);
      this.state = {
          selected: null
      };
      this.handleOptionChange = this.handleOptionChange.bind(this);
  }

  handleOptionChange = (changeEvent) => {
        this.setState({
            selected: changeEvent.target.value
        });
        console.log(this.state.selected)
    };

  render() {
      let answered = {};
      let answers = this.props.answers.map((answer) => {
          return(
              <label key={answer.id} htmlFor={"answer_id_" + answer.id} className="btn-radio">
                  <svg width="20px" height="20px" viewBox="0 0 20 20">
                      <input
                          defaultChecked={this.state.selected === answer.id}
                          name={"answer_id"}
                          type="radio"
                          value={answer.id}
                          onChange={this.handleOptionChange}
                          id={"answer_id_" + answer.id}/>
                      <circle cx="10" cy="10" r="9" />
                      <path
                          d="M10,7 C8.34314575,7 7,8.34314575 7,10 C7,11.6568542 8.34314575,13 10,13 C11.6568542,13 13,11.6568542 13,10 C13,8.34314575 11.6568542,7 10,7 Z"
                          className="inner" />
                      <path
                          d="M10,1 L10,1 L10,1 C14.9705627,1 19,5.02943725 19,10 L19,10 L19,10 C19,14.9705627 14.9705627,19 10,19 L10,19 L10,19 C5.02943725,19 1,14.9705627 1,10 L1,10 L1,10 C1,5.02943725 5.02943725,1 10,1 L10,1 Z"
                          className="outer" />
                  </svg>
                  <span> {answer.answer_text} </span>
              </label>
          )
      });
      return(
          <div className="question-block">
              <h1>{this.props.question.question_text}</h1>
              <form>
                  <div className="custom-radios">
                      {answers}
                  </div>
                  <button>send</button>
              </form>
          </div>
      )
  }
};

export default QuestionOperation
