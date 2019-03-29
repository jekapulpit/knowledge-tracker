import React from "react"
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min'
import PropTypes from "prop-types"
import Carousel from 'react-bootstrap/Carousel'
import Test from "../technology/Technology";

class QuestionList extends React.Component {
  constructor(props) {
    super(props);

    this.handleSelect = this.handleSelect.bind(this);

    this.state = {
      index: null,
      direction: null,
      questions: []
    };
  }

  handleSelect(selectedIndex, e) {
    this.setState({
      index: selectedIndex,
      direction: e.direction,
    });
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
      return( <Carousel.Item>
        <Carousel.Caption>
          <div className="question-block">
            <form className="question-form">
              <input type='text' ref={input => this.question_text = input} defaultValue={question.question_text}/>
              <input type='text' ref={input => this.test_id = input} defaultValue={question.test_id} style={{ display: 'none' }} />
              <div className="custom-radios">
                <span className="radio">
                  <label htmlFor={"question_right_answer_1_" + question.id}>
                    <input ref={input => this.right_answer = input} type="radio" value="1" id={"question_right_answer_1_" + question.id}/>
                    stubbb
                  </label>
                </span>
                <span className="radio">
                  <label htmlFor={"question_right_answer_1_" + question.id}>
                    <input ref={input => this.right_answer = input} type="radio" value="2" id={"question_right_answer_2_" + question.id}/>
                    stubbb
                  </label>
                </span>
              </div>
            </form>
          </div>
        </Carousel.Caption>
      </Carousel.Item> );
    });
    return (
        <Carousel
            activeIndex={index}
            direction={direction}
            onSelect={this.handleSelect}
            interval={null}
            className="test-carousel"
        >
          {questions}
        </Carousel>
    );
  }
}
export default QuestionList
