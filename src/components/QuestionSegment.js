import React from "react";
import ReactDOM from "react-dom";
import './styles/QuestionSegment.css';

class QuestionSegment extends React.Component {
    constructor(props) {
        super(props);
        
        this.setAppState = props.stateSetter;
        this.state = {
            index: 0,
            questions: props.questions
        }
        
    }

    doAnswer(event) {
        this.doResponse(event);
        
        let newIndex = this.state.index + 1;
        if (newIndex >= this.state.questions.length) {
            this.setAppState({
                activity: "score",
                score: this.getScore()
            });
        }
        this.setState({
            index: newIndex
        });
    }

    doResponse(event) {
        let storage = window.localStorage;

        let answerId = event.target.value;
        let questionId = this.state.questions[this.state.index].id;
        let registrationId = storage.getItem("registrationId");

        let responseObject = {
            registrationId: registrationId,
            questionId: questionId,
            answerId: answerId
        }

        console.log(responseObject);
    }

    getScore() {
        let storage = window.localStorage;
        let registrationId = storage.getItem("registrationId");
        
        return Math.trunc(Math.random() * 100);
    }

    render() {
        let answers = [];

        let index = this.state.index;
        let question = this.state.questions[index];

        for (let i in question.answers) {
            let alternative = question.answers[i];
            answers.push(<button key={i} className="question-answer" value={alternative.id} onClick={(e) => this.doAnswer(e)}>{alternative.description}</button>)
        }

        return(
            <div className="question-segment-wrapper">
                <div className="question-number-wrapper">
                    <span className="question-number-label">Question #{this.state.index + 1}</span>
                </div>
                <div className="question-segment">
                    <p className="question-explanation">{question.description}</p>
                    <div className="question-answer-wrapper">{answers}</div>
                </div>
            </div>
        );
    }

}

export default QuestionSegment;