import React from "react"
import PropTypes from "prop-types"
class TechList extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            technologies: []
        };
    }
    componentDidMount(){
        fetch('/api/technologies')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ technologies: data }) });
    }
    render(){
        var technologies = this.state.technologies.map((technology) => {
            return(
                <div className="tech-panel">
                    <a className="tech-panel" href={"/technologies/" + technology.id}>
                        <img className="tech-icon" src={technology.icon_url} />
                        <div className="tech-info">
                            <h2 className="tech-name"> {technology.title} </h2>
                            <p className="tech-description">{technology.discription}</p>
                            <div className="score-container">
                                <div className="views-block">
                                    <img src={this.props.viewsImage} />
                                    {technology.views}
                                </div>
                                <div className="rating-block">
                                    <img src={this.props.ratingImage} />
                                    {technology.average_mark || 'no marks'}
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            )
        });

        return(
            <div className="tech-container">
                {technologies}
            </div>
        )
    }
}

export default TechList
