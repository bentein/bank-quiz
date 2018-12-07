import React from "react";
import ReactDOM from "react-dom";
import './styles/ProfileSegment.css';

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
        <React.Fragment>
          <p className="profile-segment-delete-contact-info-paragraph">You have already submitted your contact information. If you no longer want to participate in the contest, or have entered wrong information, you can delete your data by pressing the below button.</p>
          <div className="profile-segment-button-wrapper">
            <button className="profile-segment-button profile-segment-delete-contact-info-button" onClick={(e) => this.deleteContactInfo(e)}>DELETE</button>
          </div>
        </React.Fragment>
      );

    } else {
      return (
        <React.Fragment>
          <p className="profile-segment-delete-contact-info-paragraph">You have not provided any contact information, and will not be participating in the contest. </p>
        </React.Fragment>
      )
    }
  }

  deleteContactInfo() {
    let confirmation = window.confirm("Are you sure you want to delete your contact information?");
    if (confirmation) {
      let storage = window.localStorage;
      storage.setItem("contactinfo", false);
    }
  }

  returnToStart() {
    this.setAppState({
      activity : "start"
    });
  }

  render() {

    return(
      <div className="profile-segment-wrapper">
        <h1 className="profile-segment-header">Profile</h1>
        {this.getContactInfoParagraph()}
        <div className="profile-segment-button-wrapper">
          <button className="profile-segment-button profile-segment-return-button" onClick={() => this.returnToStart()}>Return</button>
        </div>
      </div>
    );
  }
}

export default ProfileSegment;