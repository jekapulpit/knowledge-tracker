import React from "react"
import PropTypes from "prop-types"
const TechnologyProgress = props => {
    let title = props.technology.title.length > 20 ? (props.technology.title.substr(0, 17) + '...') : props.technology.title;
    let discriotion = props.technology.discription.length > 30 ? (props.technology.discription.substr(0, 30) + '...') : props.technology.discription;
    return (

        <div className="tech-panel">
            <a className="tech-panel" href={"/technologies/" + props.technology.technology_id}>
                <div className="tech-progress"
                     style={{color: "rgb( " + (255 - props.technology.progress*255/100) + " , " + (props.technology.progress*255/100) + " , 0)"}}>
                     {props.technology.progress}%
                </div>
                <div className="tech-info">
                    <h2 className="tech-name">
                        {title}
                    </h2>
                    <p className="tech-description">
                        {discriotion}
                    </p>
                </div>
            </a>
            <div className="admin-menu">

            </div>
        </div>
    );
};

export default TechnologyProgress
