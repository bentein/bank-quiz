import React from "react";
import ReactDOM from "react-dom";
import './styles/App.css';

import Timer from "./Timer";
import QuestionSegment from "./QuestionSegment";
import StartSegment from "./StartSegment";
import ScoreSegment from "./ScoreSegment";
import ProfileSegment from "./ProfileSegment";
import ContactInfoSegment from "./ContactInfoSegment";

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
    if (this.state.activity === "start") return <StartSegment stateSetter={(args) => this.setState(args)}></StartSegment>;
    else if (this.state.activity === "question") return [<Timer key="timer" maxTime={300} stateSetter={(args) => this.setState(args)}></Timer>,
        <QuestionSegment key="questions" questions={this.state.questions} stateSetter={(args) => this.setState(args)}></QuestionSegment>]
    else if (this.state.activity === "score") return <ScoreSegment score={this.state.score} stateSetter={(args) => this.setState(args)}></ScoreSegment>
    else if (this.state.activity === "profile") return <ProfileSegment stateSetter={(args) => this.setState(args)}></ProfileSegment>
    else if (this.state.activity === "contact") return <ContactInfoSegment prevActivity={this.state.prevActivity} stateSetter={(args) => this.setState(args)}></ContactInfoSegment>
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