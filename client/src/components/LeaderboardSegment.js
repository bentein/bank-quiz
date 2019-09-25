import React from "react";
import { Button, ProgressIndicator } from "dnb-ui-lib";
import './styles/LeaderboardSegment.css';

import Activity from "../classes/Activity";

class LeaderboardSegment extends React.Component {
  constructor(props) {
    super(props);

    this.setAppState = props.stateSetter;
    this.state = {
      hvlquizeasy: [],
      hvlquizhard: []
    }

    this.doGetLeaderboards("hvlquizeasy");
    this.doGetLeaderboards("hvlquizhard");

    this.interval = setInterval(() => {
      this.doGetLeaderboards("hvlquizeasy");
      this.doGetLeaderboards("hvlquizhard");
    }, 15000);
  }

  doGetLeaderboards(quizId) {
    let storage = window.localStorage;

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `api/leaderboard/${quizId}`, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = (e) => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          let leaderboard = JSON.parse(xhr.responseText);

          let state = {};
          state[quizId] = leaderboard;

          this.setState(state);
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

  getLeaderboardSegment(quizId) {
    let leaderboard = [];

    let data = this.state[quizId];

    if (data.length === 0) {
      leaderboard.push(<ProgressIndicator key={quizId} />);
      return leaderboard;
    }

    for (let i = 0; i < data.length; i++) {
      leaderboard.push(
        <div className="leaderboard-score-line row" key={i}>
          <span className="name-span">{i + 1}. {data[i].name}</span>
          <div className="leaderboard-ruler"></div>
          <span className="score-span">{data[i].score}</span>
        </div>)
    }

    return leaderboard;
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  goToActivity(activity) {
    this.setAppState({
      activity
    });
  }

  render() {

    let easyLeaderboard = this.getLeaderboardSegment("hvlquizeasy");
    let hardLeaderboard = this.getLeaderboardSegment("hvlquizhard");

    return (
      <div className="leaderboard-segment-wrapper col">
        <h3 className="leaderboard-header">LEADERBOARDS</h3>
        <div className="leaderboard-content-wrapper row">
          <div className="leaderboard-content leaderboard-easy col">
            <h5>EASY</h5>
            {easyLeaderboard}
          </div>
          <div className="leaderboard-content leaderboard-hard col">
            <h5>HARD</h5>
            {hardLeaderboard}
          </div>
        </div>
        <div>
          <Button
            text="Return"
            variant="tertiary"
            icon_position="left"
            icon="chevron_left"
            on_click={(e) => this.goToActivity(Activity.SELECT)} />
        </div>
      </div>
    );
  }
}

export default LeaderboardSegment;