import React from "react"
import PropTypes from "prop-types"
class Answer extends React.Component {

  constructor(props) {
      super(props);
      this.state = {
          editable: false,
          answer: props.answer,
          created: props.created
      };
  }

  handleEdit = () => {
    this.setState({
        created: !this.state.created
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
