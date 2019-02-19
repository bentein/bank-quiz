import React from "react";
import ReactDOM from "react-dom";
import './styles/QuizSelectSegment.css';

import Activity from "../classes/Activity";

class QuizSelectSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;
    this.state = {}
  }

  startQuiz(event) {
    let storage = window.localStorage;

    let name = storage.getItem("name");
    let quizId = event.target.value;
    this.doRegistration(name, quizId);
  }

  markWrongInput() {
    let input = document.querySelector(".name-input");
    input.style['box-shadow'] = "0px 0px 0px 3px red";
  }

  doRegistration(name, quizId) {
    let storage = window.localStorage;

    let identity = storage.getItem("identity");
    this.doRegistrationRequest(identity, name, quizId);
    
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
          storage.setItem("registrationId", registrationId);
          this.getQuestions(quizId, registrationId);

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

  getQuestions(quizId, registrationId) {

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `/api/quiz/${quizId}`, true);
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          let quiz = JSON.parse(xhr.responseText);
          this.setAppState({
            activity : Activity.QUESTION,
            questions: this.shuffle(quiz.questions),
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

  goToActivity(activity) {
    this.setAppState({
      activity
    });
  }

  render() {

    return(
      <div className="start-segment-wrapper col">
        <h1 className="start-segment-header">Code Quiz</h1>
        <p className="difficulty-paragraph">Choose your difficulty:</p>
        <button className="start-segment-button easy-button" value="hvlquizeasy" onClick={(e) => this.startQuiz(e)}>EASY</button>
        <button className="start-segment-button hard-button" value="hvlquizhard" onClick={(e) => this.startQuiz(e)}>HARD</button>
        <button className="start-segment-button leaderboard-button" onClick={(e) => this.goToActivity(Activity.LEADERBOARD)}>Leaderboard</button>
        <button className="start-segment-button return-button" onClick={(e) => this.goToActivity(Activity.START)}>Return</button>
      </div>
    );
  }

  
}

export default QuizSelectSegment;