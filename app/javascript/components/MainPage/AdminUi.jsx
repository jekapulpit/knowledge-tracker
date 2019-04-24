import React from "react"
import PropTypes from "prop-types"

const AdminUi = props => (
    <div className="admin-menu">
        <a href={"/technologies/" + props.id + "/edit"}>edit </a>
        <button data-confirm="Are you sure?"
           onClick={() => props.handleDelete(props.id)}> destroy</button>
    </div>
);

export default AdminUi
