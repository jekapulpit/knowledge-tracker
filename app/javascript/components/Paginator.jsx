import React from "react"
import PropTypes from "prop-types"
import { Pagination } from 'semantic-ui-react'
class Paginator extends React.Component {
  constructor(props) {
      super(props);
  }
  render () {
    return (
      <React.Fragment>
        <Pagination onPageChange={this.props.handlePage} size='mini' siblingRange='6'
        defaultActivePage={this.props.page} totalPages={this.props.totalPages}/>
      </React.Fragment>
    );
  }
}

export default Paginator
