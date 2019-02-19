import React from "react";
import ReactDOM from "react-dom";
import './styles/Timer.css';

import Activity from "../classes/Activity";

class Timer extends React.Component {
    constructor(props) {
        super(props);

        let startTime = + new Date();
        this.setAppState = props.stateSetter;

        this.state = {
            time: startTime,
            endTime: startTime + props.maxTime*1000,
        }

        this.startTimer();
    }

    startTimer() {
        this.interval = setInterval(() => this.doCountdown(this.interval), 200);
    }

    doCountdown(interval) {
        this.setState({
            time: + new Date()
        });
        if (Math.ceil((this.state.endTime - this.state.time) / 1000) <= 0) {
            clearInterval(interval);
            
            this.getScoreAndFinish();
        }
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

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    render() {
        return(
            <React.Fragment>
                <span className="timer-label">Remaining: </span><span className="timer">{Math.ceil((this.state.endTime - this.state.time) / 1000 - 1)}s</span>
            </React.Fragment>
        );
    }

}

export default Timer;