import React from "react";
import ReactDOM from "react-dom";
import './styles/QuestionSegment.css';

import Activity from "../classes/Activity";
import Timer from "./Timer";

class QuestionSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;
    this.state = {
      index: 0,
      questions: props.questions
    }

  }

  doAnswer(event) {

    let newIndex = this.state.index + 1;
    if (newIndex >= this.state.questions.length) {
      this.doResponse(event, true);

    } else {
      this.doResponse(event, false);

      this.setState({
        index: newIndex
      });
    }
  }

  doResponse(event, finish) {
    let storage = window.localStorage;

    let buttons = document.querySelectorAll("button");
    buttons.forEach(button => button.disabled = true);

    let answerId = JSON.parse(event.target.value);
    let questionId = this.state.questions[this.state.index].id;
    let registrationId = JSON.parse(storage.getItem("registrationId"));

    let responseObject = {
      registrationId: registrationId,
      questionId: questionId,
      answerId: answerId
    }

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/api/response", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          if (finish) {
            this.getScoreAndFinish();
          }

        } else {
          console.error(xhr);
        }
      }
      buttons.forEach(button => button.disabled = false);
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(JSON.stringify(responseObject));
  }

  getScoreAndFinish() {
    let storage = window.localStorage;
    let registrationId = storage.getItem("registrationId");

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `/api/score/${registrationId}`, true);
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          let score = xhr.responseText;
          this.setAppState({
            activity: Activity.SCORE,
            score: score
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

  render() {
    let answers = [];

    let index = this.state.index;
    let question = this.state.questions[index];

    for (let i in question.answers) {
      let alternative = question.answers[i];
      answers.push(<button key={i} className="question-answer" value={alternative.id} onClick={(e) => this.doAnswer(e)}>{alternative.description}</button>)
    }

    return(
      <div className="question-segment-wrapper col">
        <div className="floater-wrapper question-number-wrapper">
          <span className="question-number-label">Question #{this.state.index + 1}</span>
        </div>
        <div className="floater-wrapper question-timer-wrapper">
          <Timer key="timer" maxTime={300} stateSetter={(args) => this.setAppState(args)}></Timer>
        </div>
        <div className="question-segment">
          <p className="question-explanation">{question.description}</p>
          <div className="question-answer-wrapper">{answers}</div>
        </div>
      </div>
    );
  }

}

export default QuestionSegment;