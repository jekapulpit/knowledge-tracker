import React from "react"
import PropTypes from "prop-types"
class ProfilePage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: [],
      trackingTechnologies: [],
      editable: false
    };
  }

  componentDidMount(){
    fetch(`/api/profile`)
        .then((response) => {return response.json()})
        .then((data) => {this.setState({
            trackingTechnologies: data.trackingTechnologies,
            user: data.user
          });
        });
  }

  render(){
    return (
        <div className="container">
          <div className="main-info">
            <div className="main-avatar-block">
                <img className="main-avatar" src={this.state.user.avatarUrl} alt="" />
            </div>
            <div className="text-info">
              <p className="info-label">Username: {this.state.user.username}</p>
              <p className="info-label">Technologies tracking: {this.state.trackingTechnologies.length}</p>
              <p className="info-label">Passed tests: {this.state.user.passedNumber}</p>
              <p className="info-label">Attempts summary: {this.state.user.attempsNumber}</p>
              <a href="/users/edit">Change your password</a>
            </div>
          </div>
          <div className="other-info">
            <h1>Your technologies</h1>
            <div className="tech-container child">

            </div>
          </div>
        </div>
    );
  }
}

export default ProfilePage
