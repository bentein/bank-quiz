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
    let difficulty = event.target.value;
    let registrationId = this.getRegistration(name, difficulty);

    storage.setItem("name", name);
    
    this.setAppState({
        activity : Activity.QUESTION,
        questions: this.getQuestions(difficulty),
        registration: registrationId
    });
  }

  getRegistration(name, difficulty) {
    let storage = window.localStorage;

    let registrations = JSON.parse(storage.getItem("registrations")) || [];
    let identity = storage.getItem("identity");
    let registrationId = this.doRegistrationRequest(identity, name, difficulty);
    
    registrations.push(registrationId);
    storage.setItem("registrations", JSON.stringify(registrations));

    return registrationId;
  }

  doRegistrationRequest(identity, name, difficulty) {
    let storage = window.localStorage;

    let registrationRequest = {
      identityId: identity,
      name: name,
      difficulty: difficulty
    }

    console.log(registrationRequest);

    let registrationId = 1;
    storage.setItem("registrationId", registrationId);

    return registrationId;
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

  getQuestions(difficulty) {
    return [{
      "id": 0,
      "description": "What HTML element is used for paragraphs?",
      "difficulty": difficulty,
      "answers": [
        {
          "id": 0,
          "description": "p"
        },
        {
          "id": 1,
          "description": "li"
        },
        {
          "id": 2,
          "description": "h1"
        },
        {
          "id": 3,
          "description": "u"
        }
      ]
    },{
      "id": 1,
      "description": "What Java method returns the maximum value between two ints?",
      "difficulty": difficulty,
      "answers": [
        {
          "id": 4,
          "description": "Math.max()"
        },
        {
          "id": 5,
          "description": "max()"
        },
        {
          "id": 6,
          "description": "min()"
        },
        {
          "id": 7,
          "description": "Math.min()"
        }
      ]
    }];
  }
}

export default StartSegment;