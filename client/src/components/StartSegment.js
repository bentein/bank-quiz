import React, { useState } from "react";
import "./styles/StartSegment.css";
import { Input, Button, FormSet, FormLabel, Space } from "dnb-ui-lib";

import Activity from "../classes/Activity";

const StartSegment = ({ setAppState }) => {

  const [inputError, setInputError] = useState(null);

  function registerAndGoToActivity(activity) {
    let storage = window.localStorage;

    let name = document.querySelector("#name-input").value;
    if (name.length < 3) {
      markWrongInput();
    } else {
      storage.setItem("name", name);
      goToActivity(activity);
    }
  }

  function markWrongInput() {
    setInputError("Please enter a valid nickname");
  }

  function doChocolateRegistration() {
    let storage = window.localStorage;

    let identity = storage.getItem("identity");
    let name = document.querySelector("#name-input").value
    let quizId = "hvlquizchocolate";

    if (name.length < 3) {
      markWrongInput();
    } else {
      storage.setItem("name", name);
      let registrated = storage.getItem("chocolateRegistrationId");

      if (registrated) {
        setAppState({
          activity: Activity.CHOCOLATE
        });
      } else {
        doRegistrationRequest(identity, name, quizId);
      }
    }
  }

  function doRegistrationRequest(identity, name, quizId) {
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
          getChocolateQuestion(quizId, registrationId);

        } else {
          console.error(xhr);
          setAppState({
            activity: Activity.CHOCOLATE
          });
        }
      }
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(JSON.stringify(registrationRequest));
  }

  function getChocolateQuestion(quizId) {

    let storage = window.localStorage;

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `/api/quiz/${quizId}`, true);
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          let quiz = JSON.parse(xhr.responseText);
          storage.setItem("chocolateQuiz", JSON.stringify(quiz));

          setAppState({
            activity: Activity.CHOCOLATE
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

  function goToActivity(activity) {
    setAppState({
      activity
    });
  }


  let storage = window.localStorage;

  let name = storage.getItem("name") || "";

  return (
    <div className="start-segment-wrapper col">
      <h1 className="start-segment-header">Code Quiz</h1>
      <FormSet>
        <FormLabel for_id="name-input" direction="vertical">Choose a nickname for the leaderboards:</FormLabel>
        <Input id="name-input" value={name} placeholder="Nickname" stretch="true" size="medium" on_change={({ value }) => storage.setItem('name', value)} status={inputError} />
      </FormSet>
      <Space top="1rem" bottom="1rem" />
      <FormSet direction="vertical">
        <FormLabel direction="vertical">Choose your activity:</FormLabel>
        <Button text="Code Quiz" on_click={(e) => registerAndGoToActivity(Activity.SELECT)} />
        <Button text="Chocolate Challenge" on_click={(e) => doChocolateRegistration()} />
        <Button text="My profile" on_click={(e) => goToActivity(Activity.PROFILE)} />
      </FormSet>
    </div>
  );
}

export default StartSegment;