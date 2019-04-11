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
  }

  componentDidMount(props) {
    fetch(`/api/technologies/${this.props.technology_id}/tests/${this.props.test.id}/questions`)
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ questions: data.questions })
        });
  }

  render() {
    const {index, direction} = this.state;
    let questions = this.state.questions.map((question) => {
      return(
          <Carousel.Item key={question.id}>
            <Carousel.Caption>
                <QuestionOperation test={this.props.test} question={question} answers={question.answers}/>
            </Carousel.Caption>
          </Carousel.Item>
      )});

    return (
        <React.Fragment >
          <Carousel
              activeIndex={index}
              direction={direction}
              interval={null}
              className="test-carousel"
              controls={false}
              indicators={false}>
            {questions}
          </Carousel>
        </React.Fragment>
    );
  }
}
export default TestOperation
