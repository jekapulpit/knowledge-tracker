import React from "react"
import PropTypes from "prop-types"
import AdminUi from './AdminUi'
import Paginator from './Paginator'

class TechList extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            technologies: [],
            page: 1,
            totalPages: null,
            loading: false
        };
        this.handlePage = this.handlePage.bind(this)
    }

    handlePage = (e, {activePage}) => {
        let goToPage = {activePage};
        let pagestring = goToPage.activePage.toString()
        this.setState({
            loading: true
        });
        const url = "/api/technologies/?page=" + pagestring;
        fetch(url).then(result => result.json()).then(this.initialState);
    };

    componentDidMount(){
        fetch('/api/technologies')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ technologies: data.technologies,
                page: data.page,
                totalPages: data.totalPages }) });
    }

    initialState = (resultData) => {
        this.setState({
            loading: false,
            technologies: resultData.technologies,
            totalPages: resultData.totalPages,
            page: resultData.page
        })
    };

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
                    <AdminUi id={technology.id} />
                </div>
            )
        });

        return(
            <React.Fragment>
                <div className="tech-container">
                    {technologies}
                </div>
                <Paginator page={this.state.page} handlePage={this.handlePage} totalPages={this.state.totalPages}/>
            </React.Fragment>
        )
    }
}

export default TechList
