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
      this.doGenerateUserIdentity();
    }
  }

  doGenerateUserIdentity() {
    let storage = window.localStorage;

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/identity", true);
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          console.log("Received user identity: " + xhr.responseText);
          storage.setItem("identity", xhr.responseText);
        } else {
          console.error(xhr);
        }
      }
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(null);

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
      </div>
    );
  }
}

export default App;