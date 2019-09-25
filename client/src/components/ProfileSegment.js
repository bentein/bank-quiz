import React from "react";
import ReactDOM from "react-dom";
import "./styles/ProfileSegment.css";
import { Button } from "dnb-ui-lib"

import Activity from "../classes/Activity";

class ProfileSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;

    let storage = window.localStorage;
    let contactInfo = JSON.parse(storage.getItem("contactinfo"));

    this.state = {
      contactInfo: contactInfo
    }
  }

  getContactInfoParagraph() {
    if (this.state.contactInfo) {
      return (
        <div className="col profile-segment-info-column">
          <p>You have already submitted your contact information. If you no longer want to participate in the contest, or have entered wrong information, you can delete your data by pressing the below button.</p>
          <div>
            <Button text="Delete" on_click={(e) => this.deleteContactInfo(e)} />
          </div>
        </div>
      );

    } else {
      return (
        <div>
          <p>You have not provided any contact information, and will not be egible to win prizes.</p>
          <p>Press the button below to enter your information and sign up for the contest.</p>
          <div>
            <Button text="Provide contact info" on_click={(e) => this.doContact(e)} />
          </div>
        </div>
      )
    }
  }

  deleteContactInfo() {
    let storage = window.localStorage;
    let identity = storage.getItem("identity");
    let confirmation = window.confirm("Are you sure you want to delete your contact information?");

    if (confirmation) {
      let xhr = new XMLHttpRequest();
      xhr.open("DELETE", `/api/contactinfo/${identity}`, true);
      xhr.setRequestHeader('Content-Type', 'application/json');
      xhr.onload = (e) => {
        if (xhr.readyState === 4) {
          if (xhr.status === 204) {
            let storage = window.localStorage;
            storage.setItem("contactinfo", false);

            this.setState({
              contactInfo: false
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
  }

  doContact() {
    this.setAppState({
      activity: Activity.CONTACT,
      prevActivity: Activity.PROFILE
    });
  }

  returnToStart() {
    this.setAppState({
      activity: Activity.START
    });
  }

  render() {

    return (
      <div className="profile-segment-wrapper col">
        <h1 className="profile-segment-header">Profile</h1>
        {this.getContactInfoParagraph()}
        <div>
          <Button
            text="Return"
            variant="tertiary"
            icon_position="left"
            icon="chevron_left"
            on_click={() => this.returnToStart()} />
        </div>
      </div>
    );
  }
}

export default ProfileSegment;