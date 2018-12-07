import React from "react";
import ReactDOM from "react-dom";
import './styles/ScoreSegment.css';

class ScoreSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;
    this.state = {
      score: props.score
    }
  }

  doRetry() {
    this.setAppState({
      activity: "start"
    });
  }

  doContact() {
    this.setAppState({
      activity: "contact",
      prevActivity: "score"
    });
  }

  getSubmitSegment() {
    return (
      <div className="score-segment-wrapper">
        <h1 className="score-segment-header">Score: {this.state.score}</h1>
        <p className="score-segment-paragraph">You finished the quiz!</p>
        <p className="score-segment-paragraph">If you want a chance to win special prizes, press the button below to input your contact information.</p>
        <div className="score-segment-button-wrapper">
          <button className="score-segment-contact-info-button score-segment-button" onClick={() => this.doContact()}>Provide contact info</button>
        </div>
        <p className="score-segment-paragraph">Or you could try again and improve your score without submitting your contact information by pressing the button below.</p>
        <div className="score-segment-button-wrapper">
          <button className="score-segment-button" onClick={() => this.doRetry()}>Return</button>
        </div>
      </div>
    );
  }

  getAlreadySubmittedSegment() {
    return (
      <div className="score-segment-wrapper">
        <h1 className="score-segment-header">Score: {this.state.score}</h1>
        <p className="score-segment-paragraph">You finished the quiz! You have already submitted your contact info. You will be contacted if you win. </p>
        <p className="score-segment-paragraph">You can alternatively delete your contact info on the start screen if you no longer desire to be part of the contest. Feel free to try again to improve your score.</p>
        <div className="score-segment-button-wrapper">
          <button className="score-segment-button" onClick={() => this.doRetry()}>Return</button>
        </div>
      </div>
    );
  }

  render() {
    let storage = window.localStorage;

    let contactInfoSubmitted = JSON.parse(storage.getItem("contactinfo"));
    let segment = [];
    
    if (contactInfoSubmitted) {
      segment = this.getAlreadySubmittedSegment();
    } else {
      segment = this.getSubmitSegment();
    }

    return(
      <React.Fragment>
        {segment}
      </React.Fragment>
    );
  }
}

export default ScoreSegment;