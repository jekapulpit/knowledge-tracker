import React from "react"
import PropTypes from "prop-types"
const Technology = (props) => {
    return (
        <a className="tech-panel" href={"/technologies/" + props.technology.id}>
          <img className="tech-icon" src={props.technology.icon_url} />
          <div className="tech-info">
            <h2 className="tech-name"> {props.technology.title} </h2>
            <p className="tech-description">{props.technology.discription}</p>
            <div className="score-container">
              <div className="views-block">
                <img src={props.viewsImage} />
                {props.technology.views}
              </div>
              <div className="rating-block">
                <img src={props.ratingImage} />
                {props.technology.average_mark || 'no marks'}
              </div>
            </div>
          </div>
        </a>
    );
};

export default Technology
