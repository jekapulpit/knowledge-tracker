import React from "react"
import PropTypes from "prop-types"
import AdminUi from './AdminUi'
import Paginator from './Paginator'
import Filters from "./Filters";
import Technology from "./Technology";

class TechList extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            technologies: [],
            page: 1,
            totalPages: null,
            loading: false,
            category: '',
            sortBy: 'views-desc'
        };
        this.handlePage = this.handlePage.bind(this)
        this.handleFilters = this.handleFilters.bind(this)
    }

    handlePage = (e, {activePage}) => {
        let goToPage = {activePage};
        let pagestring = goToPage.activePage.toString();
        this.setState({
            loading: true
        });
        const url = "/api/technologies/?page=" + pagestring +
            "&category=" + this.state.category +
            "&sort_by=" + this.state.sortBy;
        fetch(url).then(result => result.json()).then(this.initialState);
    };

    handleFilters = (category, sortBy) => {
        this.setState({
            loading: true
        });
        const url = "/api/technologies" +
            "?category=" + category.toString() +
            "&sort_by=" + sortBy.toString();
        fetch(url)
            .then((response) => {return response.json()})
            .then((data) => {this.setState({
                technologies: data.technologies,
                page: 1,
                category: category,
                sortBy: sortBy,
                loading: false,
                totalPages: data.totalPages })
            });
    };

    componentDidMount(){
        fetch('/api/technologies')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({
                technologies: data.technologies,
                page: data.page,
                totalPages: data.totalPages })
            });
    }

    initialState = (resultData) => {
        this.setState({
            loading: false,
            technologies: resultData.technologies,
            page: resultData.page,
        })
    };

    render(){
        var technologies = this.state.technologies.map((technology) => {
            var adminUi = this.props.isAdmin ? <AdminUi id={technology.id} /> : null
            return(
                <div className="tech-panel">
                    <Technology technology={technology}
                                viewsImage={this.props.viewsImage}
                                ratingImage={this.props.ratingImage} />
                    {adminUi}
                </div>
            )
        });

        return(
            <React.Fragment>
                <Filters handleFilters = {this.handleFilters}
                         category={this.state.category}
                         sort_by={this.state.sortBy}
                         isAdmin={this.props.isAdmin}
                         categories={this.props.categories}
                         sortOptions={this.props.sortOptions}/>
                <div className="tech-container">
                    {technologies}
                </div>
                <Paginator page={this.state.page}
                           handlePage={this.handlePage}
                           totalPages={this.state.totalPages}/>
            </React.Fragment>
        )
    }
}

export default TechList
