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
      activity:"start"
    }
  }

  getActiveScreen() {
  if (this.state.activity === "start") return <StartScreen stateSetter={this.setState.bind(this)}></StartScreen>;
    if (this.state.activity === "question") return [<Timer key="timer" maxTime={300} stateSetter={this.setState.bind(this)}></Timer>,
        <QuestionSegment key="questions" questions={this.state.questions} stateSetter={this.setState.bind(this)}></QuestionSegment>]
  }

  render() {
    return (
      <div className="app-wrapper">
        <div className="background">
          <div className="background-bow"></div>
          <div className="background-block"></div>
        </div>
        {this.getActiveScreen()}
      </div>
    );
  }

}

export default App;