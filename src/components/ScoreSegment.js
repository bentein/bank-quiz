import React from "react";
import ReactDOM from "react-dom";
import './styles/ScoreSegment.css';

class ScoreSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;
    this.state = {}
  }

  doRetry() {
    this.setAppState({
      activity: "start"
    });
  }

  render() {
    return(
      <div className="score-segment-wrapper">
        <h1 className="score-segment-header">Congratulations!</h1>
        <p className="score-segment-paragraph">You finished the quiz! Enter your contact information below to win prizes.</p>
        <div className="score-segment-input-wrapper">
          <input className="score-segment-input full-name-input" placeholder="full name"></input>
          <input className="score-segment-input email-input" placeholder="email"></input>
          <input className="score-segment-input phone-input" placeholder="phone"></input>
        </div>
        <div className="score-segment-checkbox-wrapper">
          <label for="internship-checkbox" className="score-segment-checkbox-paragraph">Contact me about internships:</label><input type="checkbox" id="internship-checkbox" className="score-segment-checkbox-checkbox"></input>
        </div>
        <div className="score-segment-button-wrapper">
          <button className="score-segment-button">Submit</button>
          <button className="score-segment-button" onClick={() => this.doRetry()}>Retry</button>
        </div>
      </div>
    );
  }
}

export default ScoreSegment;