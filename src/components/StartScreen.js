import React from "react";
import ReactDOM from "react-dom";
import './styles/StartScreen.css';

class StartScreen extends React.Component {
    constructor(props) {
        super(props);

        this.setAppState = props.stateSetter;
        this.state = {}
    }

    render() {
        return(
            <div className="start-screen-wrapper">
                <h1 className="start-screen-header">Code Quiz</h1>
                <input className="name-input" type="text"></input>
                <p className="difficulty-paragraph">Choose your difficulty:</p>
                <button className="easy-button" value="EASY" onClick={this.startQuiz.bind(this)}>EASY</button>
                <button className="medium-button" value="MEDIUM" onClick={this.startQuiz.bind(this)}>MEDIUM</button>
                <button className="hard-button" value="HARD" onClick={this.startQuiz.bind(this)}>HARD</button>
            </div>
        );
    }

    startQuiz(event) {
        let difficulty = event.target.value;
        this.setAppState({
            activity : "question",
            questions: [{
                "id": 0,
                "description": "What HTML element is used for paragraphs?",
                "difficulty": difficulty,
                "answers": [
                  {
                    "id": 0,
                    "description": "p"
                  },
                  {
                    "id": 1,
                    "description": "li"
                  },
                  {
                    "id": 2,
                    "description": "h1"
                  },
                  {
                    "id": 3,
                    "description": "u"
                  }
                ]
              },{
                "id": 1,
                "description": "What Java method returns the maximum value between two ints?",
                "difficulty": difficulty,
                "answers": [
                  {
                    "id": 4,
                    "description": "Math.max()"
                  },
                  {
                    "id": 5,
                    "description": "max()"
                  },
                  {
                    "id": 6,
                    "description": "min()"
                  },
                  {
                    "id": 7,
                    "description": "Math.min()"
                  }
                ]
              }]
        });
    }

}

export default StartScreen;