import React from "react";
import './styles/App.css';
import "dnb-ui-lib/style";

import QuestionSegment from "./QuestionSegment";
import StartSegment from "./StartSegment";
import ScoreSegment from "./ScoreSegment";
import ProfileSegment from "./ProfileSegment";
import ContactInfoSegment from "./ContactInfoSegment";
import QuizSelectSegment from "./QuizSelectSegment";

import Activity from "../classes/Activity";
import ChocolateChallengeSegment from "./ChocolateChallengeSegment";
import LeaderboardSegment from "./LeaderboardSegment";

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
    xhr.open("POST", "/api/identity", true);
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
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
      case Activity.QUESTION: return <QuestionSegment key="questions" questions={this.state.questions} stateSetter={(args) => this.setState(args)}></QuestionSegment>;
      case Activity.SCORE: return <ScoreSegment score={this.state.score} stateSetter={(args) => this.setState(args)}></ScoreSegment>;
      case Activity.PROFILE: return <ProfileSegment stateSetter={(args) => this.setState(args)}></ProfileSegment>;
      case Activity.CONTACT: return <ContactInfoSegment prevActivity={this.state.prevActivity} stateSetter={(args) => this.setState(args)}></ContactInfoSegment>
      case Activity.SELECT: return <QuizSelectSegment stateSetter={(args) => this.setState(args)}></QuizSelectSegment>
      case Activity.CHOCOLATE: return <ChocolateChallengeSegment stateSetter={(args) => this.setState(args)}></ChocolateChallengeSegment>
      case Activity.LEADERBOARD: return <LeaderboardSegment stateSetter={(args) => this.setState(args)}></LeaderboardSegment>
      case Activity.START:
      default: return <StartSegment setAppState={(args) => this.setState(args)}></StartSegment>;
    }
  }

  render() {
    return (
      <div className="app-wrapper container">
        <div className="row align-items-center">
          {this.getActiveScreen()}
        </div>
      </div>
    );
  }
}

export default App;