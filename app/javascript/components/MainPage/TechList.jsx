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
            loading: true,
            category: '',
            sortBy: 'views-desc'
        };
        this.handlePage = this.handlePage.bind(this);
        this.handleDelete = this.handleDelete.bind(this);
        this.handleFilters = this.handleFilters.bind(this);
    }

    handleDelete = (technologyId) => {
        fetch(`http://localhost:3000/technologies/${technologyId}`,
            {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then((response) => {return response.json()})
            .then((result) => {
                if(result.deleted)
                    this.handleFilters(this.state.category, this.state.sortBy);
            })

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
                category: category,
                sortBy: sortBy,
                loading: false,
                totalPages: data.totalPages,
                page: data.page })
            });
    };

    componentDidMount(){
        fetch('/api/technologies')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({
                technologies: data.technologies,
                totalPages: data.totalPages,
                loading: false })
            });
    }

    initialState = (resultData) => {
        this.setState({
            loading: false,
            technologies: resultData.technologies,
            page: resultData.page,
        });
    };

    render(){
        var technologies = this.state.technologies.map((technology) => {
            var adminUi = this.props.isAdmin ? <AdminUi id={technology.id} handleDelete={this.handleDelete}/> : null
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
            <div>
                <Filters handleFilters = {this.handleFilters}
                         category={this.state.category}
                         sort_by={this.state.sortBy}
                         isAdmin={this.props.isAdmin}
                         categories={this.props.categories}
                         sortOptions={this.props.sortOptions}/>
                <div className="tech-container parent">
                    <div className="tech-container child">
                        {technologies}
                    </div>
                </div>
                <Paginator page={this.state.page}
                           handlePage={this.handlePage}
                           totalPages={this.state.totalPages}/>
            </div>
        )
    }
}

export default TechList
