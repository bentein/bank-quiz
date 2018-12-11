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
            
            let score = this.getScore();
            this.setAppState({
                activity: Activity.SCORE,
                score: score
            })
        }
    }

    getScore() {
        let storage = window.localStorage;
        let registrationId = storage.getItem("registrationId");
        
        return Math.trunc(Math.random() * 100);
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    render() {
        return(
            <div className="timer-wrapper">
                <span className="timer-label">Remaining: </span><span className="timer">{Math.ceil((this.state.endTime - this.state.time) / 1000 - 1)}s</span>
            </div>
        );
    }

}

export default Timer;