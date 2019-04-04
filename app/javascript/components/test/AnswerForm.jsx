import React from "react"
import PropTypes from "prop-types"
const AnswerForm = props => {
  let formFields = {};
  return(
      <span className="radio answer-radio">
        <label htmlFor={"new_answer"}>
          <input id={"new_answer"} ref={input => formFields.answer_text = input} />
        </label>
        <div className="ans-controls">
            <img onClick={() => props.handleCreate(formFields.answer_text.value)} src={props.saveImage} />
            <img onClick={() => props.handleNew()} src={props.deleteImage} />
        </div>
      </span>
  )
};

export default AnswerForm
