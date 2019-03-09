import React from "react"
import PropTypes from "prop-types"
class Filters extends React.Component {
  render () {
    let filters = {};
    return (
      <div className="filters">
        <form>
          <div className="input-block">
            <p>category filter: </p>
              <select ref={input => filters.category = input}>
                <option value="1">all</option>
                <option value="2">frameworks</option>
                <option value="3">3</option>
              </select>
          </div>
          <div className="input-block">
            <p>sort by: </p>
              <select ref={input => filters.sort_by = input}>
                <option value="views-desc">views</option>
                <option value="views-desc">created at</option>
                <option value="views-desc">3</option>
              </select>
            </div>
            <button>Apply</button>
        </form>
      </div>
    );
  }
}

export default Filters
