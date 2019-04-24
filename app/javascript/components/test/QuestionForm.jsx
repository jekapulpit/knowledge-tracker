import React from "react"
import PropTypes from "prop-types"
const QuestionForm = props => {
  let formFields = {};
  return(
      <div className="question-block">
          <form className="question-form" data-remote="true">
              <input type='text' ref={input => formFields.question_text = input} />
              <button onClick={() => props.handleCreate(formFields.question_text.value)}>save</button>
          </form>
      </div>
  )
};

export default QuestionForm
