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

  doSubmit() {
    let storage = window.localStorage;

    let identityId = storage.getItem("identity");
    let fullName = document.querySelector(".full-name-input").value;
    let email = document.querySelector(".email-input").value;
    let phone = document.querySelector(".phone-input").value || null;
    let contact = document.querySelector(".score-segment-checkbox-checkbox").checked;

    let contactInfoRequest = {
      identityId: identityId,
      fullName: fullName,
      email: email,
      phone: phone,
      contact: contact
    }

    console.log(contactInfoRequest);

    if (this.validContactInfo(contactInfoRequest)) {
      storage.setItem("contactinfo", true);

      this.setAppState({
        activity: "start"
      });
    } else {
      this.markWrongInput(contactInfoRequest);
    }
  }

  doRetry() {
    this.setAppState({
      activity: "start"
    });
  }

  validContactInfo(request) {
    return request.identityId && request.fullName && request.fullName.length > 3 && request.email && request.email.length > 6 && request.contact !== null;
  }

  markWrongInput(request) {

  }

  getSubmitSegment() {
    return (
      <div className="score-segment-wrapper">
        <h1 className="score-segment-header">Score: {this.state.score}</h1>
        <p className="score-segment-paragraph">You finished the quiz! Enter your contact information below to have a chance at winning special prizes.</p>
        <div className="score-segment-input-wrapper">
          <input className="score-segment-input full-name-input" placeholder="full name"></input>
          <input className="score-segment-input email-input" placeholder="email"></input>
          <input className="score-segment-input phone-input" placeholder="phone"></input>
        </div>
        <div className="score-segment-checkbox-wrapper">
          <label htmlFor="internship-checkbox" className="score-segment-checkbox-paragraph">I want to be contacted about internship opportunities in DNB</label><input type="checkbox" id="internship-checkbox" className="score-segment-checkbox-checkbox"></input>
        </div>
        <div className="score-segment-button-wrapper">
          <button className="score-segment-button" onClick={() => this.doRetry()}>Retry</button>
          <button className="score-segment-button" onClick={() => this.doSubmit()}>Submit</button>
        </div>
      </div>
    );
  }

  getAlreadySubmittedSegment() {
    return (
      <div className="score-segment-wrapper">
        <h1 className="score-segment-header">Score: {this.state.score}</h1>
        <p className="score-segment-paragraph">You finished the quiz! You have already submitted your contact info. You will be contacted if you win. You can alternatively delete your contact info on the start screen if you no longer desire to be part of the contest. Feel free to try again to improve your score.</p>
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