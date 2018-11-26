import React from "react";
import ReactDOM from "react-dom";
import './styles/MultipleChoiceQuestionSegment.css';

class MultipleChoiceQuestionSegment extends React.Component {
    constructor(props) {
        super(props);

        let questions = props.questions;
        
        this.state = {
            number: 0,
            explanation: questions[0].explanation,
            alternatives: questions[0].alternatives
        }

    }

    render() {
        let answers = [];

        for (let i in this.state.alternatives) {
            let alternative = this.state.alternatives[i];
            answers.push(<button key={i} className="question-answer" value={alternative.value}>{alternative.text}</button>)
        }

        return(
            <div className="question-segment-wrapper">
                <h1 className="question-header">Question #{this.state.number + 1}</h1>
                <div className="question-segment">
                    <p className="question-explanation">{this.state.explanation}</p>
                    <div className="question-answer-wrapper">{answers}</div>
                </div>
            </div>
        );
    }

}

export default MultipleChoiceQuestionSegment;