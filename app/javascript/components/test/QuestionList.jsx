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
      index: 1,
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
      return( <Carousel.Item><Carousel.Caption><div>asdasd</div></Carousel.Caption></Carousel.Item> );
    });
    return (
        <Carousel
            activeIndex={index}
            direction={direction}
            onSelect={this.handleSelect}
        >
          {questions}
        </Carousel>
    );
  }
}
export default QuestionList
