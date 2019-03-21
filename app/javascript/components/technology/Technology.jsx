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
    this.handleDelete = this.handleDelete.bind(this);
    this.handleEdit = this.handleEdit.bind(this)
  }

  handleEdit = () => {
      if(this.state.editable){
          let technology = {
              id: this.state.technology.id,
              title: this.title.value,
              discription: this.discription.value
          };
          this.handleUpdate(technology)
      }
      this.setState({
          editable: !this.state.editable
      });
  };

  handleUpdate = (technology) => {
      fetch(`http://localhost:3000/api/technologies/${this.state.technology.id}`,
          {
              method: 'PUT',
              body: JSON.stringify({technology: technology}),
              headers: {
                  'Content-Type': 'application/json'
              }
          }).then((response) => {return response.json()})
          .then((data) => {
              this.setState({
                  technology: data.technology
              })
          })
  };

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
    let tests = this.state.tests.map((test) => {
        //var adminUi = this.props.isAdmin ? <AdminUi id={technology.id} handleDelete={this.handleDelete}/> : null
        return( <Test key={test.id}  technologyId={this.state.technology.id} test={test} handleDelete={this.handleDelete} /> )
    });
    let buttonVal = this.state.editable ? 'save' : 'edit';
    let title = this.state.editable ? (<input type='text' ref={input => this.title = input} defaultValue={this.state.technology.title}/>) :
        (<h2 className="tech-name">{this.state.technology.title}</h2>);
    let discription = this.state.editable ? (<textarea ref={input => this.discription = input}>{this.state.technology.discription}</textarea>) :
        (<p className="technology-description">{this.state.technology.discription}</p>);
    return (
        <React.Fragment>
            <div className="tech-title">
                <img className="tech-icon" src={this.state.technology.icon_url} />
                {title}
            </div>
            {discription}
            <button onClick={(e) => this.handleEdit()}>{buttonVal}</button>
            <h1>ALL THEMES</h1>
            <div className="tech-themes">
                {tests}
            </div>
        </React.Fragment>
    );
  }
}

export default Technology
