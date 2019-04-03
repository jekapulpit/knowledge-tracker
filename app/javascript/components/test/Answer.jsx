import React from "react"
import PropTypes from "prop-types"
class Answer extends React.Component {

  constructor(props) {
      super(props);
      this.state = {
          answer: props.answer,
          created: props.created
      };
  }

  handleEdit = () => {
    if(!this.state.created) {
        let answer_attributes = {
            id: this.state.answer.id,
            answer_text: this.answer_text.value
        };
        this.handleUpdateAnswer(answer_attributes)
    }

    this.setState({
        created: !this.state.created
    })
  };

  handleUpdateAnswer = (answer_attributes) => {
      fetch(`http://localhost:3000/api/technologies/${this.props.technology_id}/tests/${this.props.test_id}/questions/${this.props.question_id}/answers/${this.state.answer.id}`,
          {
              method: 'PUT',
              body: JSON.stringify({answer: answer_attributes}),
              headers: {
                  'Content-Type': 'application/json'
              }
          }).then((response) => {return response.json()})
          .then((data) => {
              this.setState({
                  answer: data.answer
              })
          })
  };

  render () {
    let input = this.state.created ?
        (<label htmlFor={"question_right_answer_" + this.state.answer.id}>
        <input name={"question["+ this.props.question_id +"][right_answer]"}
              type="radio"
              value={this.state.answer.id}
              id={"question_right_answer_" + this.state.answer.id}
              onChange={this.props.handleOptionChange}
              defaultChecked={this.props.selected === this.state.answer.id}/>
            {this.state.answer.answer_text}
        </label>)
        :
        (<input ref={input => this.answer_text = input} defaultValue={this.state.answer.answer_text}/>);
    return (
      <span className="radio">
          {input}
          <p onClick={() => this.handleEdit()}> {this.state.created ? 'edit' : 'save'} </p>
      </span>
  );
  }
}

export default Answer
