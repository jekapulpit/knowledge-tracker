import React from "react"
import PropTypes from "prop-types"

const AdminUi = props => (
    <div className="admin-menu">
        <a href={"/technologies/" + props.id + "/edit"}>edit </a>
        <a href={"/technologies/" + props.id} data-confirm="Are you sure?" data-method="delete"> destroy</a>
    </div>
)

export default AdminUi
