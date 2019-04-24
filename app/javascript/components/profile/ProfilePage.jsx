import React from "react"
import PropTypes from "prop-types"
import TechnologyProgress from "./TechnologyProgress";
class ProfilePage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: [],
      trackingTechnologies: [],
      editable: false,
      loading: false
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
    var fileField = document.getElementById('new-avatar');
    var vatarForm = document.getElementById('avatar-form');
    fileField.addEventListener('change', function() {
        Rails.fire(vatarForm, 'submit')
    });
    vatarForm.addEventListener('ajax:success', function (event) {
        var newAvatar = event.detail[0]['avatar'];
        var avatarEl = document.querySelector('.main-avatar')
        avatarEl.setAttribute('src', newAvatar);
    });
  }

  render(){
     let technologies = this.state.trackingTechnologies.map((technology) => {
         return (<TechnologyProgress technology={technology}/>)
     });
    return (
        <div className="container">
          <div className="main-info">
            <div className="main-avatar-block">
                <img className="main-avatar" src={this.state.user.avatarUrl} alt="" />
                <form action="api/profile/change_avatar" method="post" id="avatar-form" data-remote="true" encType="multipart/form-data">
                    <label htmlFor="new-avatar">change your avatar</label>
                    <input name="new_avatar" ref={input => this.avatar = input} type="file" id="new-avatar" />
                </form>
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
                {technologies}
            </div>
          </div>
        </div>
    );
  }
}

export default ProfilePage
