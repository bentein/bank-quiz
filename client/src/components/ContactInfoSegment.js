import React, { useState } from "react";
import { Button, Input, Checkbox, Space, FormSet } from "dnb-ui-lib";
import "./styles/ContactInfoSegment.css";

import Activity from "../classes/Activity";
import FormRow from "dnb-ui-lib/components/form-row/FormRow";

const ContactInfoSegment = ({ stateSetter, score, prevActivity }) => {

  const [consent, setConsent] = useState(false);

  const [nameError, setNameError] = useState(null);
  const [emailError, setEmailError] = useState(null);
  const [phoneError, setPhoneError] = useState(null);


  const MINIMUM_NAME_LENGTH = 5;
  const MINIMUM_MAIL_LENGTH = 5;
  const MINIMUM_PHONE_LENGTH = 8;

  function doSubmit() {
    let storage = window.localStorage;

    clearWrongInput();

    let identityId = JSON.parse(storage.getItem("identity"));
    let fullName = document.querySelector("#full-name-input").value;
    let email = document.querySelector("#email-input").value;
    let mobile = document.querySelector("#phone-input").value || null;
    let contact = false;

    let contactInfoRequest = {
      identityId: identityId,
      fullName: fullName,
      email: email,
      mobile: mobile,
      contact: contact
    }

    if (validContactInfo(contactInfoRequest)) {
      doSubmitRequest(contactInfoRequest);

    } else {
      markWrongInput(contactInfoRequest);
    }
  }

  function doSubmitRequest(contactInfoRequest) {
    let storage = window.localStorage;

    let buttons = document.querySelectorAll("button");
    buttons.forEach(button => button.disabled = true);

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/api/contactinfo", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          storage.setItem("contactinfo", true);

          stateSetter({
            activity: prevActivity || Activity.START
          });

        } else {
          console.error(xhr);
        }
      }
      buttons.forEach(button => button.disabled = false);
    };
    xhr.onerror = (e) => {
      console.error(xhr.statusText);
    };
    xhr.send(JSON.stringify(contactInfoRequest));
  }

  function doCancel() {
    stateSetter({
      activity: prevActivity || Activity.START
    });
  }

  function validContactInfo(request) {
    return request.identityId && request.fullName && request.fullName.length >= MINIMUM_NAME_LENGTH
      && request.email && request.email.length >= MINIMUM_MAIL_LENGTH && request.contact !== null;
  }

  function markWrongInput(request) {
    let nameInput = document.querySelector("#full-name-input");
    let emailInput = document.querySelector("#email-input");
    let phoneInput = document.querySelector("#phone-input");

    if (request.fullName.length > 100 || request.fullName.length < MINIMUM_NAME_LENGTH) {
      setNameError("Enter a valid name");
    }

    if (request.email.length < MINIMUM_MAIL_LENGTH) {
      setEmailError("Enter a valid email");
    }

    if (request.mobile && request.mobile.length < MINIMUM_PHONE_LENGTH) {
      setPhoneError("Enter a valid phone number");
    }
  }

  function clearWrongInput() {
    let nameInput = document.querySelector("#full-name-input");
    let emailInput = document.querySelector("#email-input");
    let phoneInput = document.querySelector("#phone-input");

    nameInput.style['box-shadow'] = "";
    emailInput.style['box-shadow'] = "";
    phoneInput.style['box-shadow'] = "";
  }

  function toggleSubmit() {
    setConsent(!consent);
  }

  return (
    <div className="contact-info-wrapper">
      <h1>Contact Info</h1>
      <p>Enter your contact information below to have a chance at winning special prizes. Provide your phone number for faster contact.</p>
      <div>
        <FormSet id="formSet" direction="vertical">
          <Input id="full-name-input" placeholder="Full name" status={nameError} size="medium" stretch="true" />
          <Space top="1rem" />
          <Input id="email-input" placeholder="Email" status={emailError} size="medium" stretch="true" />
          <Space top="1rem" />
          <Input id="phone-input" placeholder="Phone" status={phoneError} size="medium" stretch="true" />
          <Space top="1rem" />
        </FormSet>
      </div>
      <div className="checkbox-wrapper">
        <Checkbox id="checkbox" label="I agree to having my contact info stored until the contest's end" on_change={toggleSubmit} />
      </div>
      <div className="button-row">
        <Button id="contact-button" text="Cancel" on_click={doCancel} />
        <Button id="contact-button" text="Submit" on_click={doSubmit} disabled={!consent} />
      </div>
    </div>
  );
}

export default ContactInfoSegment;