import React from "react"
import Carousel from 'react-bootstrap/Carousel'
import PropTypes from "prop-types"
import Answer from "./Answer";

class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question: props.question,
      answers: props.question.answers,
      selectedAnswer: props.question.right_answer,
      available: true
    };
    this.handleOptionChange = this.handleOptionChange.bind(this)
  }

  handleUpdate = () => {
    let answers_attributes = {};
    
    this.state.answers.map((answer) => {
        answers_attributes[answer.id] = {
            answer_text:    answer.answer_text,
            id:             answer.id
        }
    });

    let question = {
      id:                   this.state.question.id,
      question_text:        this.question_text.value,
      right_answer:         this.state.selectedAnswer,
      test_id:              this.test_id.value,
      answers_attributes:   answers_attributes
    };

    fetch(`http://localhost:3000/api/technologies/${this.props.technology_id}/tests/${this.state.question.test_id}/questions/${question.id}`,
        {
          method: 'PUT',
          body: JSON.stringify({question: question}),
          headers: {
            'Content-Type': 'application/json'
          }
        }).then((response) => {return response.json()})
        .then((data) => {
          this.setState({
            question: data.question
          })
        })
  };

  handleOptionChange = (changeEvent) => {
      this.setState({
          selectedAnswer: changeEvent.target.value
      });
  };

  handleBlock = () => {
      this.setState({
          available: false
      });
  }

  render () {
    let answers = this.state.answers.map((answer) => {
      return(<Answer handleOptionChange={this.handleOptionChange}
                     question_id={this.state.question.id}
                     answer={answer}
                     selected={this.state.selectedAnswer}/>)
    });
    return (
            <div className="question-block">
              <form className="question-form" data-remote="true">
                <input type='text' ref={input => this.question_text = input} defaultValue={this.state.question.question_text}/>
                <input type='text' ref={input => this.test_id = input} defaultValue={this.state.question.test_id} style={{ display: 'none' }} />
                <div className="custom-radios">
                  {answers}
                </div>
                <button onClick={() => this.handleUpdate()}>save</button>
              </form>
            </div>
    );
  }
}

export default Question
