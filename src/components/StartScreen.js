import React from "react";
import ReactDOM from "react-dom";
import './styles/StartScreen.css';

class StartScreen extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
        }
    }

    render() {
        return(
            <div className="start-screen-wrapper">
                <h1 className="start-screen-header">Code Quiz</h1>
                <input className="name-input" type="text"></input>
                <p className="difficulty-paragraph">Choose your difficulty:</p>
                <button className="easy-button">EASY</button>
                <button className="medium-button">MEDIUM</button>
                <button className="hard-button">HARD</button>
            </div>
        );
    }

}

export default StartScreen;