import React from "react";
import ReactDOM from "react-dom";
import './styles/App.css';

import Timer from "./Timer";
import QuestionSegment from "./QuestionSegment";
import StartSegment from "./StartSegment";
import ScoreSegment from "./ScoreSegment";
import ProfileSegment from "./ProfileSegment";
import ContactInfoSegment from "./ContactInfoSegment";

import Activity from "../classes/Activity";

class App extends React.Component {
  constructor(props) {
    super(props);

    this.getUserIdentity();
    
    this.state = {
      activity: Activity.START
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
    switch (this.state.activity) {
      case Activity.QUESTION: return [<Timer key="timer" maxTime={300} stateSetter={(args) => this.setState(args)}></Timer>, <QuestionSegment key="questions" questions={this.state.questions} stateSetter={(args) => this.setState(args)}></QuestionSegment>];
      case Activity.SCORE: return <ScoreSegment score={this.state.score} stateSetter={(args) => this.setState(args)}></ScoreSegment>;
      case Activity.PROFILE: return <ProfileSegment stateSetter={(args) => this.setState(args)}></ProfileSegment>;
      case Activity.CONTACT: return <ContactInfoSegment prevActivity={this.state.prevActivity} stateSetter={(args) => this.setState(args)}></ContactInfoSegment>
      case Activity.START: 
      default: return <StartSegment stateSetter={(args) => this.setState(args)}></StartSegment>;
    }
  }

  render() {
    return (
      <div className="app-wrapper">
        {this.getActiveScreen()}
        <div className="background">
          <div className="background-bow"></div>
          <div className="background-block"></div>
        </div>
      </div>
    );
  }
}

export default App;