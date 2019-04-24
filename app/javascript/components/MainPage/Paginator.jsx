import React from "react"
import PropTypes from "prop-types"
import { Pagination } from 'semantic-ui-react'

const Paginator = (props) => {
    return (
        <React.Fragment>
            <Pagination onPageChange={props.handlePage} size='mini' siblingRange='6'
                        ActivePage={props.page} defaultActivePage={props.page} totalPages={props.totalPages}/>
        </React.Fragment>
    );
};

export default Paginator
