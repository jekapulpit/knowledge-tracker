import React from "react"
import PropTypes from "prop-types"
import AdminUi from "../MainPage/TechList";
class Technology extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      technology: props.technology,
      editable: false,
      tests: []
    };
  }

  componentDidMount() {
    fetch(`/api/technologies/${this.props.technology.id}/tests/`)
        .then((response) => {return response.json()})
        .then((data) => {this.setState({
          tests: data.tests,
          loading: false })
        });
  }

  render () {
    var tests = this.state.tests.map((test) => {
        var isPassed = test.passed ? (<i style={{color: 'green', fontFamily: 'Lora-italic'}}>passed</i>) : null;
        //var adminUi = this.props.isAdmin ? <AdminUi id={technology.id} handleDelete={this.handleDelete}/> : null
        return(
            <div key={this.state.technology.id} className="theme-block">
                <div className="theme">
                   <a href={'/technologies/' + this.state.technology.id + '/tests/' + test.id}>{test.title}</a>
                    {isPassed}
                </div>
            </div>
        )
    });

    return (
        <React.Fragment>
            <div className="tech-title">
                <img className="tech-icon" src={this.state.technology.icon_url} />
                <h2 className="tech-name">{this.state.technology.title}</h2>
            </div>
            <p className="technology-description">{this.state.technology.discription}</p>
            <h1>ALL THEMES</h1>
            <div className="tech-themes">
                {tests}
            </div>
        </React.Fragment>
    );
  }
}

export default Technology
