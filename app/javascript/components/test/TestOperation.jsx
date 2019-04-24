import React from "react"
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min'
import PropTypes from "prop-types"
import Carousel from 'react-bootstrap/Carousel'
import Test from "../technology/Technology";
import Question from "./Question";
import { Pagination } from 'semantic-ui-react'
import QuestionForm from "./QuestionForm";
import QuestionOperation from "./QuestionOperation";

class TestOperation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0,
      direction: 'next',
      questions: [],
    };
    this.handleAnswer = this.handleAnswer.bind(this)
  }

  handleAnswer = (data) => {
      fetch(`/api/answer`,
          {
              method: 'POST',
              body: JSON.stringify(data),
              headers: {
                  'Content-Type': 'application/json'
              }
          }).then((response) => {return response.json()})
          .then((data) => {
              if(this.state.index < this.state.questions.length - 1) {
                  this.setState({
                      index: this.state.index + 1,
                  })
              } else {
                  this.finishTest()
              }
          });
  };

  finishTest = () => {
      fetch(`/api/test/finish`,
          {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json'
              }
          }).then((response) => {return response.json()})
          .then((data) => {
              this.mainElement.innerHTML = `<div><h1>Your result: ${data.result}/${data.number_of_questions}</h1><a href="/profile">back to profile</a></div>`;
          });
  };

  componentDidMount(props) {
    fetch(`/api/technologies/${this.props.technology_id}/tests/${this.props.test.id}/questions`)
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ questions: data.questions })
        })
  }

  render() {
    const {index, direction} = this.state;
    let questions = this.state.questions.map((question) => {
      return(
          <Carousel.Item key={question.id}>
            <Carousel.Caption>
                <QuestionOperation handleAnswer={this.handleAnswer} test={this.props.test} question={question} answers={question.answers}/>
            </Carousel.Caption>
          </Carousel.Item>
      )});

    return (
        <div ref={node => this.mainElement = node} className="tests-container">
            <div>
              <Carousel
                  activeIndex={index}
                  direction={direction}
                  interval={null}
                  className="test-carousel"
                  controls={false}
                  indicators={false}>
                {questions}
              </Carousel>
            </div>
            <button onClick={() => {this.finishTest()}}>finish</button>
        </div>
    );
  }
}
export default TestOperation
