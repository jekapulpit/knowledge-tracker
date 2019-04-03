import React from "react"
import PropTypes from "prop-types"
const AnswerForm = props => {
  let formFields = {};
  return(
      <span className="radio">
        <label htmlFor={"new_answer"}>
          <input id={"new_answer"} ref={input => formFields.answer_text = input} />
        </label>
        <p onClick={() => props.handleCreate(formFields.answer_text.value)}>save</p>
      </span>
  )
};

export default AnswerForm
