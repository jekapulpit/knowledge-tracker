import React from "react"
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min'
import PropTypes from "prop-types"
import Carousel from 'react-bootstrap/Carousel'
import Test from "../technology/Technology";
import Question from "./Question";
import { Pagination } from 'semantic-ui-react'
import QuestionForm from "./QuestionForm";

class QuestionList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0,
      page: 1,
      newQuestion: false,
      direction: null,
      questions: [],
    };
    this.handleCreate = this.handleCreate.bind(this)
  }

  handleNew = () => {
    this.setState({
      questions: this.state.questions.concat("new"),
      newQuestion: true,
      page: this.state.questions.length + 1,
      index: this.state.questions.length
    })
  };

  handleCreate = (question_text) => {
    let body = JSON.stringify({question: {question_text: question_text, test_id: this.props.test.id} });
    fetch(`http://localhost:3000/api/technologies/${this.props.technology_id}/tests/${this.props.test.id}/questions`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: body,
        }).then((response) => {return response.json()})
        .then((data)=>{
          if(data.valid)
            this.addNewQuestion(data.question)
        })
  };

  addNewQuestion(question) {
      fetch(`/api/technologies/${this.props.technology_id}/tests/${this.props.test.id}/questions`)
          .then((response) => {return response.json()})
          .then((data) => {this.setState({
              questions: data.questions,
              newQuestion: false
          })
      });
  }

  handleTest = (e, {activePage}) => {
    let goToTest = {activePage};
    let moveTo = (goToTest.activePage - this.state.page);
    let direction = moveTo < 0 ? 'prev' : 'next';
    this.setState({
      page: goToTest.activePage,
      index: goToTest.activePage - 1,
      direction: direction
    });
  };

  componentDidMount(props) {
    fetch(`/api/technologies/${this.props.technology_id}/tests/${this.props.test.id}/questions`)
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ questions: data.questions })
      });
  }

  render() {
    const {index, direction} = this.state;
    let questions = this.state.questions.map((question) => {
      let ques = question.id ? (<Question editImage={this.props.editImage}
                                          deleteImage={this.props.deleteImage}
                                          saveImage={this.props.saveImage}
                                          technology_id={this.props.technology_id}
                                          question={question} />) :
                               (<QuestionForm editImage={this.props.editImage}
                                          deleteImage={this.props.deleteImage}
                                          saveImage={this.props.saveImage}
                                          handleCreate={this.handleCreate}/>);
      return(
          <Carousel.Item>
            <Carousel.Caption>
              {ques}
            </Carousel.Caption>
          </Carousel.Item>
      )});

    let newQuestion = this.state.newQuestion ? (null) : (<a className="item new-question" onClick={() => {this.handleNew()}}>+</a>);

    return (
        <React.Fragment >
          <Carousel
              activeIndex={index}
              direction={direction}
              interval={null}
              className="test-carousel"
              controls={false}
              indicators={false}
          >
            {questions}

          </Carousel>
          <div className="pagination">
            <Pagination onPageChange={this.handleTest}
                        size='mini'
                        siblingRange='6'
                        firstItem={null}
                        lastItem={null}
                        activepage={this.state.page}
                        defaultActivePage={this.state.page}
                        totalPages={questions.length}>
            </Pagination>
              {newQuestion}
          </div>
        </React.Fragment>
    );
  }
}
export default QuestionList
