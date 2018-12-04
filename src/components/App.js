import React from "react";
import ReactDOM from "react-dom";
import './styles/App.css';

import Timer from "./Timer";
import QuestionSegment from "./MultipleChoiceQuestionSegment";
import StartScreen from "./StartScreen";

class App extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = {
    }
  }

  render() {
    return (
      <div className="app-wrapper">
        <div className="background">
          <div className="background-bow"></div>
          <div className="background-block"></div>
        </div>
        <StartScreen></StartScreen>
      </div>
    );
  }
}

export default App;