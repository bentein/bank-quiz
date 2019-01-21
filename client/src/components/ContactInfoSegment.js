import React from "react";
import ReactDOM from "react-dom";
import './styles/ContactInfoSegment.css';

import Activity from "../classes/Activity";

class ContactInfoSegment extends React.Component {
  constructor(props) {
    super(props);

    this.MINIMUM_NAME_LENGTH = 5;
    this.MINIMUM_MAIL_LENGTH = 5;
    this.MINIMUM_PHONE_LENGTH = 8;  

    this.setAppState = props.stateSetter;
    this.state = {
      score: props.score,
      consent: false,
      prevActivity: props.prevActivity
    }
  }

  doSubmit() {
    let storage = window.localStorage;

    this.clearWrongInput();

    let identityId = JSON.parse(storage.getItem("identity"));
    let fullName = document.querySelector(".full-name-input").value;
    let email = document.querySelector(".email-input").value;
    let mobile = document.querySelector(".phone-input").value || null;
    let contact = document.querySelector(".contact-info-segment-checkbox-checkbox").checked;

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

    let buttons = document.querySelectorAll("button");
    buttons.forEach(button => button.disabled = true);

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/api/contactinfo", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 201) {
          console.log("Successfully sent contact info to server");
          storage.setItem("contactinfo", true);
          
          this.setAppState({
            activity: this.state.prevActivity || Activity.START
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

  doCancel() {
    this.setAppState({
      activity: this.state.prevActivity || Activity.START
    });
  }

  validContactInfo(request) {
    return request.identityId && request.fullName && request.fullName.length >= this.MINIMUM_NAME_LENGTH
      && request.email && request.email.length >= this.MINIMUM_MAIL_LENGTH && request.contact !== null;
  }

  markWrongInput(request) {
    let nameInput = document.querySelector(".full-name-input");
    let emailInput = document.querySelector(".email-input");
    let phoneInput = document.querySelector(".phone-input");

    if (request.fullName.length > 100 || request.fullName.length < this.MINIMUM_NAME_LENGTH) {
      nameInput.style['box-shadow'] = "0px 0px 0px 5px red";
    }

    if (request.email.length < this.MINIMUM_MAIL_LENGTH) {
      emailInput.style['box-shadow'] = "0px 0px 0px 5px red";
    }

    if (request.mobile && request.mobile.length < this.MINIMUM_PHONE_LENGTH) {
      phoneInput.style['box-shadow'] = "0px 0px 0px 5px red";
    }
  }

  clearWrongInput() {
    let nameInput = document.querySelector(".full-name-input");
    let emailInput = document.querySelector(".email-input");
    let phoneInput = document.querySelector(".phone-input");

    nameInput.style['box-shadow'] = "";
    emailInput.style['box-shadow'] = "";
    phoneInput.style['box-shadow'] = "";
  }

  toggleSubmit() {
    this.setState({
      consent: !this.state.consent
    });
  }

  render() {

    return(
      <div className="col contact-info-segment-wrapper">
        <h1 className="contact-info-segment-header">Contact Info</h1>
        <p className="contact-info-segment-paragraph">Enter your contact information below to have a chance at winning special prizes.</p>
        <div className="contact-info-segment-input-wrapper">
          <input className="contact-info-segment-input full-name-input" placeholder="full name"></input>
          <input className="contact-info-segment-input email-input" placeholder="email"></input>
          <input className="contact-info-segment-input phone-input" placeholder="phone"></input>
        </div>
        <div className="contact-info-segment-checkbox-wrapper">
          <label htmlFor="internship-checkbox" className="contact-info-segment-checkbox-paragraph">I want to be contacted about internship opportunities in DNB</label>
          <input type="checkbox" id="internship-checkbox" className="contact-info-segment-checkbox-checkbox"></input>
        </div>
        <div className="contact-info-segment-checkbox-wrapper">
          <label htmlFor="tos-checkbox" className="contact-info-segment-checkbox-paragraph">I agree to having my contact info stored until the competition's end</label>
          <input type="checkbox" id="tos-checkbox" className="contact-info-segment-checkbox-checkbox" onClick={() => this.toggleSubmit()}></input>
        </div>
        <div className="contact-info-segment-button-wrapper">
          <button className="contact-info-segment-button contact-info-segment-cancel" onClick={() => this.doCancel()}>Cancel</button>
          <button className="contact-info-segment-button contact-info-segment-submit" onClick={() => this.doSubmit()} disabled={!this.state.consent}>Submit</button>
        </div>
      </div>
    );
  }
}

export default ContactInfoSegment;