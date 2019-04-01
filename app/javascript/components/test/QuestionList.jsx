import React from "react"
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min'
import PropTypes from "prop-types"
import Carousel from 'react-bootstrap/Carousel'
import Test from "../technology/Technology";
import Question from "./Question";
import { Pagination } from 'semantic-ui-react'

class QuestionList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0,
      page: 1,
      direction: null,
      questions: [],
    };
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
      return(
      <Carousel.Item>
        <Carousel.Caption>
          <Question question={question} />
        </Carousel.Caption>
      </Carousel.Item> );
    });

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
                        totalPages={questions.length}/>
          </div>
        </React.Fragment>
    );
  }
}
export default QuestionList
