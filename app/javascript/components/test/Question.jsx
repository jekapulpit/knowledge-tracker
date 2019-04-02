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
    this.handleOptionChange = this.handleOptionChange.bind(this);
    this.handleAnsDelete = this.handleAnsDelete.bind(this)
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

  handleAnsDelete = (answerId) => {
      fetch(`http://localhost:3000/api/technologies/${this.props.technology_id}/tests/${this.state.question.test_id}/questions/${this.state.question.id}/answers/${answerId}`,
          {
              method: 'DELETE',
              headers: {
                  'Content-Type': 'application/json'
              }
          }).then((response) => {return response.json()})
          .then((result) => {
              if(result.deleted)
                  this.deleteAnswer(answerId)
          })
  };

  deleteAnswer = (answerId) => {
      let newAnswers = this.state.answers.filter((answer) => answer.id !== answerId);
      this.setState({
          answers: newAnswers,
          selectedAnswer: newAnswers[0].id
      });
  };

  updateAnswers = () => {
      fetch(`http://localhost:3000/api/technologies/${this.props.technology_id}/tests/${this.state.question.test_id}/questions/${this.state.question.id}/answers`)
          .then((response) => {return response.json()})
          .then((result) => {
              this.setState({
                  selectedAnswer: result.answers[0],
                  answers: result.answers
              });
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
  };

  render () {
    let answers = this.state.answers.map((answer) => {
      return(<Answer key={answer.id}
                     handleOptionChange={this.handleOptionChange}
                     question_id={this.state.question.id}
                     answer={answer}
                     selected={this.state.selectedAnswer}
                     handleAnsDelete={this.handleAnsDelete}/>)
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
