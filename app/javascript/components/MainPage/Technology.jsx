import React from "react"
import PropTypes from "prop-types"
const Technology = (props) => {
    let title = props.technology.title.length > 20 ? (props.technology.title.substr(0, 17) + '...') : props.technology.title;
    let discriotion = props.technology.discription.length > 30 ? (props.technology.discription.substr(0, 30) + '...') : props.technology.discription;
    return (
        <a className="tech-panel" href={"/technologies/" + props.technology.id}>
          <img className="tech-icon" src={props.technology.icon_url} />
          <div className="tech-info">
            <h2 className="tech-name">{title}</h2>
            <p className="tech-description">{discriotion}</p>
            <div className="score-container">
              <div className="views-block">
                <img src={props.viewsImage} />
                {props.technology.views}
              </div>
              <div className="rating-block">
                <img src={props.ratingImage} />
                {props.technology.average_mark}
              </div>
            </div>
          </div>
        </a>
    );
};

export default Technology
