import React from "react";
import ReactDOM from "react-dom";
import './styles/StartSegment.css';

import Activity from "../classes/Activity";

class StartSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;
    this.state = {}
  }

  startQuiz(event) {
    let storage = window.localStorage;

    let name = document.querySelector(".name-input").value;
    if (name.length < 3) {
      this.markWrongInput();
    } 
    else {
      storage.setItem("name", name);
      let difficulty = event.target.value;
      this.doRegistration(name, difficulty);
    }
  }

  markWrongInput() {
    let input = document.querySelector(".name-input");
    input.style['box-shadow'] = "0px 0px 0px 5px red";
  }

  doRegistration(name, difficulty) {
    let storage = window.localStorage;

    let identity = storage.getItem("identity");
    this.doRegistrationRequest(identity, name, difficulty);
    
  }

  doRegistrationRequest(identity, name, difficulty) {
    let storage = window.localStorage;

    let registrationRequest = {
      identityId: identity,
      name: name,
      difficulty: difficulty
    }

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/registration", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          let registrationId = xhr.responseText;
          console.log("Received registrationId: " + registrationId);
          storage.setItem("registrationId", registrationId);
          this.getQuestions(difficulty, registrationId);

        } else {
          console.error(xhr);
        }
      }
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(JSON.stringify(registrationRequest));
  }

  getQuestions(difficulty, registrationId) {

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `/questions?difficulty=${difficulty}`, true);
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          let questions = this.shuffle(JSON.parse(xhr.responseText));
          console.log("Received questions: " + questions.length);
          this.setAppState({
            activity : Activity.QUESTION,
            questions: questions,
            registration: registrationId
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

  shuffle(a) {
    var j, x, i;
    for (i = a.length - 1; i > 0; i--) {
      j = Math.floor(Math.random() * (i + 1));
      x = a[i];
      a[i] = a[j];
      a[j] = x;
    }
    return a;
  }

  openProfile() {
    this.setAppState({
      activity : Activity.PROFILE
    });
  }

  render() {
    let storage = window.localStorage;

    let name = storage.getItem("name") || "";

    return(
      <div className="start-segment-wrapper">
        <h1 className="start-segment-header">Code Quiz</h1>
        <input className="name-input" type="text" defaultValue={name} placeholder="nickname"></input>
        <p className="difficulty-paragraph">Choose your difficulty:</p>
        <button className="start-segment-button easy-button" value="EASY" onClick={(e) => this.startQuiz(e)}>EASY</button>
        <button className="start-segment-button medium-button" value="MEDIUM" onClick={(e) => this.startQuiz(e)}>MEDIUM</button>
        <button className="start-segment-button hard-button" value="HARD" onClick={(e) => this.startQuiz(e)}>HARD</button>
        <button className="start-segment-button profile-button" value="HARD" onClick={(e) => this.openProfile(e)}>My profile</button>
      </div>
    );
  }

  
}

export default StartSegment;