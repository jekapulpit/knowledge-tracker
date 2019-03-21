import React from "react"
import PropTypes from "prop-types"
import AdminUi from "../MainPage/TechList";
import Test from "./Test";
class Technology extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      technology: props.technology,
      editable: false,
      tests: []
    };
    this.handleDelete = this.handleDelete.bind(this)
  }

  handleDelete = (testId) => {
      fetch(`http://localhost:3000/api/tests/${testId}`,
          {
              method: 'DELETE',
              headers: {
                  'Content-Type': 'application/json'
              }
          }).then((response) => {return response.json()})
          .then((result) => {
              if(result.deleted)
                  this.deleteTest(testId)
          })
  };

  deleteTest = (testId) => {
      let newTests = this.state.tests.filter((test) => test.id !== testId);
      this.setState({
          tests: newTests
      })
  };

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
        //var adminUi = this.props.isAdmin ? <AdminUi id={technology.id} handleDelete={this.handleDelete}/> : null
        return( <Test key={test.id}  technologyId={this.state.technology.id} test={test} handleDelete={this.handleDelete} /> )
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
