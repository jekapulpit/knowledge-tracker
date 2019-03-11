import React from "react"
import PropTypes from "prop-types"
class Technology extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      technology: null,
      editable: false
    };
  }

  render () {
    return (
      <React.Fragment>
        <div className="tech-title">
          <img src={this.props.technology.icon_url} />
        </div>
      </React.Fragment>
    );
  }
}

export default Technology
