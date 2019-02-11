import React from "react";
import ReactDOM from "react-dom";
import './styles/ScoreSegment.css';

import Activity from "../classes/Activity";

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

    let identityId = JSON.parse(storage.getItem("identity"));
    let fullName = document.querySelector(".full-name-input").value;
    let email = document.querySelector(".email-input").value;
    let mobile = document.querySelector(".phone-input").value || null;
    let contact = document.querySelector(".score-segment-checkbox-checkbox").checked;

    let contactInfoRequest = {
      identityId: identityId,
      fullName: fullName,
      email: email,
      mobile: mobile,
      contact: contact
    }

    if (this.validContactInfo(contactInfoRequest)) {
      this.doSubmitRequest(contactInfoRequest);

    } else {
      this.markWrongInput(contactInfoRequest);
    }
  }

  doSubmitRequest(contactInfoRequest) {
    let storage = window.localStorage;

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/api/contactinfo", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          console.log("Successfully sent contact info to server");
          storage.setItem("contactinfo", true);
          
          this.setAppState({
            activity: "start"
          });
      
        } else {
          console.error(xhr);
        }
      }
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(JSON.stringify(contactInfoRequest));
  }

  doRetry() {
    this.setAppState({
      activity: Activity.START
    });
  }

  doContact() {
    this.setAppState({
      activity: Activity.CONTACT,
      prevActivity: Activity.SCORE
    });
  }

  getSubmitSegment() {
    return (
      <React.Fragment>
        <h1 className="score-segment-header">Score: {this.state.score}</h1>
        <p className="score-segment-paragraph">You finished the quiz!</p>
        <p className="score-segment-paragraph">If you want a chance to win special prizes, press the button below to input your contact information.</p>
        <div className="score-segment-button-wrapper">
          <button className="score-segment-contact-info-button score-segment-button" onClick={() => this.doContact()}>Provide contact info</button>
        </div>
        <p className="score-segment-paragraph">Click <a href="https://www.deltager.no/DNBDC19?WT.mc_id=pov4" target="_blank"><u>here</u></a> to read more about or sign up for Digital Challenge.</p>
        <p className="score-segment-paragraph">Click <a href="https://www.dnb.no/om-oss/jobb-og-karriere.html" target="_blank"><u>here</u></a> to read about job openings and working in DNB.</p>
      </React.Fragment>
    );
  }

  getAlreadySubmittedSegment() {
    return (
      <React.Fragment>
        <h1 className="score-segment-header">Score: {this.state.score}</h1>
        <p className="score-segment-paragraph">You finished the quiz! You have already submitted your contact info. You will be contacted if you win. </p>
        <p className="score-segment-paragraph">You can alternatively delete your contact info on the start screen if you no longer desire to be part of the contest. Feel free to try again to improve your score.</p>
      </React.Fragment>
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
      <div className="score-segment-wrapper col">
        {segment}
        <div className="score-segment-button-wrapper">
          <button className="score-segment-button score-segment-return-button" onClick={() => this.doRetry()}>Return</button>
        </div>
      </div>
    );
  }
}

export default ScoreSegment;