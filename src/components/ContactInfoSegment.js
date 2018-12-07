import React from "react";
import ReactDOM from "react-dom";
import './styles/ContactInfoSegment.css';

class ContactInfoSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;
    this.state = {
      score: props.score,
      prevActivity: props.prevActivity
    }
  }

  doSubmit() {
    let storage = window.localStorage;

    let identityId = storage.getItem("identity");
    let fullName = document.querySelector(".full-name-input").value;
    let email = document.querySelector(".email-input").value;
    let phone = document.querySelector(".phone-input").value || null;
    let contact = document.querySelector(".contact-info-segment-checkbox-checkbox").checked;

    let contactInfoRequest = {
      identityId: identityId,
      fullName: fullName,
      email: email,
      phone: phone,
      contact: contact
    }

    console.log(contactInfoRequest);

    if (this.validContactInfo(contactInfoRequest)) {
      storage.setItem("contactinfo", true);

      this.setAppState({
        activity: this.state.prevActivity || "start"
      });
    } else {
      this.markWrongInput(contactInfoRequest);
    }
  }

  doCancel() {
    this.setAppState({
      activity: this.state.prevActivity || "start"
    });
  }

  validContactInfo(request) {
    return request.identityId && request.fullName && request.fullName.length > 3 && request.email && request.email.length > 6 && request.contact !== null;
  }

  markWrongInput(request) {

  }

  render() {

    return(
      <div className="contact-info-segment-wrapper">
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
        <div className="contact-info-segment-button-wrapper">
          <button className="contact-info-segment-button" onClick={() => this.doCancel()}>Cancel</button>
          <button className="contact-info-segment-button" onClick={() => this.doSubmit()}>Submit</button>
        </div>
      </div>
    );
  }
}

export default ContactInfoSegment;