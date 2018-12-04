import React from "react";
import ReactDOM from "react-dom";
import './styles/App.css';

import Timer from "./Timer";
import QuestionSegment from "./QuestionSegment";
import StartScreen from "./StartSegment";

class App extends React.Component {
  constructor(props) {
    super(props);

    this.getUserIdentity();
    
    this.state = {
      activity:"start"
    }
  }

  getUserIdentity() {
    let storage = window.localStorage;
    let id = storage.getItem("identity");
    if (id === null) {
      id = 1;
    }
    storage.setItem("identity", id);
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