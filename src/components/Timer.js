import React from "react";
import ReactDOM from "react-dom";
import './styles/Timer.css';

class Timer extends React.Component {
    constructor(props) {
        super(props);

        let startTime = + new Date();
        
        this.state = {
            time: startTime,
            endTime: startTime + props.maxTime*1000,
        }

        this.startTimer();
    }

    startTimer() {
        let interval = setInterval(() => this.doCountdown(interval), 200);
    }

    doCountdown(interval) {
        this.setState({
            time: + new Date()
        });
        if (Math.ceil((this.state.endTime - this.state.time) / 1000) <= 0) {
            clearInterval(interval);
            console.log("Timer reached 0");
        }
    }

    render() {
        return(
            <div className="timer-wrapper">
                <span className="timer-label">Gjenstående: </span><span className="timer">{Math.ceil((this.state.endTime - this.state.time) / 1000)} s</span>
            </div>
        );
    }

}

export default Timer;