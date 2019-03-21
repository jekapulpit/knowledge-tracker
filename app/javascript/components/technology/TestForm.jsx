import React from "react"
import PropTypes from "prop-types"
const TestForm = (props) => {
  let formFields = {};
  return(
      <div className="theme-block">
        <div className="theme">
          <div className="number"><div className='test-status passed'>v</div></div>
          <input placeholder="new test title" type='text' ref={input => formFields.title = input} defaultValue=''/>
          <textarea ref={input => formFields.discription = input}>new test desctiption</textarea>
        </div>
        <div className="edit-button">
          <button onClick={(e) => props.handleCreate(formFields.title.value, formFields.discription.value)}>save</button>
        </div>
      </div>
  )
};

export default TestForm
