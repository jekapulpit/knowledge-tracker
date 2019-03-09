import React from "react"
import PropTypes from "prop-types"
import AdminUi from "./AdminUi";
const Filters = (props) => {
    let filters = {
      category: props.category,
      sort_by: props.sort_by
    };
    let categories = props.categories.map((category) => {
        return(
            <option value={category[1]}>{category[0]}</option>
        )
    });
    let sortOprions = props.sortOptions.map((sortOption) => {
        return(
            <option value={sortOption[1]}>{sortOption[0]}</option>
        )
    });
    return (
      <div className="filters">
        <form data-remote="true" onSubmit={ (e) => { props.handleFilters(filters.category.value,
            filters.sort_by.value); } }>
          <div className="input-block">
            <p>category filter: </p>
              <select ref={input => filters.category = input}>
                {categories}
              </select>
          </div>
          <div className="input-block">
            <p>sort by: </p>
              <select ref={input => filters.sort_by = input}>
                {sortOprions}
              </select>
            </div>
            <button>Apply</button>
        </form>

      </div>
    );
};

export default Filters
