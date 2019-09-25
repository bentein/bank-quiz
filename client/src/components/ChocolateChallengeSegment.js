import React from "react";
import { Button, Input, InputMasked } from "dnb-ui-lib";
import createNumberMask from "text-mask-addons/dist/createNumberMask";
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
    let guess = document.querySelector("#guess-input").value;

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
            guess: null
          });

          this.setAppState({
            activity: Activity.START
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
        <p >You have guessed that there are {this.state.guess} chocolates in the jar. Submit your contact information from the profile page if you want to win prizes.</p>
        <div>
          <Button text="Delete" on_click={(e) => this.deleteGuess()} />
        </div>
      </React.Fragment>

    } else {

      const numberMask = createNumberMask({
        allowDecimal: false,
        thousandsSeparatorSymbol: ' ',
        suffix: ' pieces',
        prefix: ''
      });

      return <React.Fragment>
        <p>How many chocolates are in the jar on the DNB stand? Guess carefully, your final attempt is the only one that matters.</p>
        <InputMasked
          id="guess-input"
          type="text"
          placeholder="Your guess"
          stretch="true"
          size="medium"
          label="Chocolates: "
          autocomplete="off"
          mask={numberMask}
          align="right"
          stretch="true"
          bottom="1rem"
        />
        <div>
          <Button text="Send" on_click={(e) => this.doAnswer()} />
        </div>
      </React.Fragment>
    }
  }

  render() {
    return (
      <div className="chocolate-challenge-segment-wrapper col">
        <h1>Chocolate Challenge</h1>
        {this.getActiveScreen()}
        <div>
          <Button
            variant="tertiary"
            icon_position="left"
            icon="chevron_left"
            text="Return"
            onClick={(e) => this.goToActivity(Activity.START)} />
        </div>
      </div>
    );
  }
}

export default ChocolateChallengeSegment;