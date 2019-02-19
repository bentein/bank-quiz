import React from "react";
import ReactDOM from "react-dom";
import './styles/ChocolateChallengeSegment.css';

import Activity from "../classes/Activity";

class ChocolateChallengeSegment extends React.Component {
  constructor(props) {
    super(props);

    let storage = window.localStorage;
    let guess = storage.getItem("guess");

    this.setAppState = props.stateSetter;
    this.state = {
      guess
    }
  }

  doAnswer() {
    let storage = window.localStorage;
    let guess = document.querySelector(".guess-input").value;
    
    storage.setItem("guess", guess);

    this.doSendResponse(guess);
  }

  doSendResponse(guess) {
    let storage = window.localStorage;

    let questionId = JSON.parse(storage.getItem("chocolateQuiz")).questions[0].id;
    let registrationId = JSON.parse(storage.getItem("chocolateRegistrationId"));

    let responseObject = {
      registrationId: registrationId,
      questionId: questionId,
      freeText: guess
    }

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/api/response", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          this.setState({
            guess
          });
      
        } else {
          console.error(xhr);
        }
      }
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(JSON.stringify(responseObject));

  }

  deleteGuess() {
    let storage = window.localStorage;
    let registrationId = storage.getItem("chocolateRegistrationId");

    let xhr = new XMLHttpRequest();
    xhr.open("DELETE", `/api/registration/${registrationId}`, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {

          storage.removeItem("guess");
          storage.removeItem("chocolateRegistrationId");
          
          this.setState({
            guess : null
          });

          this.setAppState({
            activity : Activity.START
          });
      
        } else {
          console.error(xhr);
        }
      }
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send();

  }

  goToActivity(activity) {
    this.setAppState({
      activity
    });
  }
  
  getActiveScreen() {

    if (this.state.guess) {
      return <React.Fragment>
        <p className="explanation-paragraph">You have guessed that there are {this.state.guess} chocolates in the jar. Submit your contact information from the profile page if you want to win prizes.</p>
        <button className="chocolate-challenge-segment-button delete-button" onClick={(e) => this.deleteGuess()}>Delete</button>
      </React.Fragment>

    } else {

      return <React.Fragment>
        <p className="explanation-paragraph">How many chocolates are in the jar on the DNB stand? Guess carefully, your final attempt is the only one that matters.</p>
        <input className="guess-input" type="text" placeholder="your guess"></input>
        <button className="chocolate-challenge-segment-button send-button" onClick={(e) => this.doAnswer()}>Send</button>
      </React.Fragment>
    }
  }

  render() {

    return(
        <div className="chocolate-challenge-segment-wrapper col">
          <h1 className="chocolate-challenge-segment-header">Chocolate Challenge</h1>
          {this.getActiveScreen()}
          <button className="chocolate-challenge-segment-button return-button" onClick={(e) => this.goToActivity(Activity.START)}>Return</button>
        </div>
    );
  }
}

export default ChocolateChallengeSegment;