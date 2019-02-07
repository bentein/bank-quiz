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

  registerAndGoToActivity(activity) {
    let storage = window.localStorage;

    let name = document.querySelector(".name-input").value;
    if (name.length < 3) {
      this.markWrongInput();
    } else {
      storage.setItem("name", name);
      this.goToActivity(activity);
    }
  }

  markWrongInput() {
    let input = document.querySelector(".name-input");
    input.style['box-shadow'] = "0px 0px 0px 3px red";
  }

  doChocolateRegistration() {
    let storage = window.localStorage;

    let identity = storage.getItem("identity");
    let name = document.querySelector(".name-input").value
    let quizId = "hvlquizchocolate";

    if (name.length < 3) {
      this.markWrongInput();
    } else {
      storage.setItem("name", name);
      let registrated = storage.getItem("chocolateRegistrationId");

      if (registrated) {
        this.setAppState({
          activity : Activity.CHOCOLATE
        });

      } else {
        
        this.doRegistrationRequest(identity, name, quizId);
      }
    }
  }

  doRegistrationRequest(identity, name, quizId) {
    let storage = window.localStorage;

    let registrationRequest = {
      identityId: identity,
      name: name,
      quizId: quizId
    }

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/api/registration", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          let registrationId = xhr.responseText;
          storage.setItem("chocolateRegistrationId", registrationId);
          this.getChocolateQuestion(quizId, registrationId);

        } else {
          console.error(xhr);
          this.setAppState({
            activity : Activity.CHOCOLATE
          });
        }
      }
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(JSON.stringify(registrationRequest));
  }

  getChocolateQuestion(quizId) {

    let storage = window.localStorage;

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `/api/quiz/${quizId}`, true);
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          let quiz = JSON.parse(xhr.responseText);
          storage.setItem("chocolateQuiz", JSON.stringify(quiz));

          this.setAppState({
            activity : Activity.CHOCOLATE
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

  render() {
    let storage = window.localStorage;

    let name = storage.getItem("name") || "";

    return(
        <div className="start-segment-wrapper col">
          <h1 className="start-segment-header">Code Quiz</h1>
          <p className="difficulty-paragraph">Choose a nickname for the leaderboards:</p>
          <input className="name-input" type="text" defaultValue={name} placeholder="nickname"></input>
          <p className="difficulty-paragraph">Choose your activity:</p>
          <button className="start-segment-button" onClick={(e) => this.registerAndGoToActivity(Activity.SELECT)}>Code Quiz</button>
          <button className="start-segment-button" onClick={(e) => this.doChocolateRegistration()}>Chocolate Challenge</button>
          <button className="start-segment-button profile-button" onClick={(e) => this.goToActivity(Activity.PROFILE)}>My profile</button>
        </div>
    );
  }

  
}

export default StartSegment;