import React from "react";
import ReactDOM from "react-dom";
import './styles/MultipleChoiceQuestionSegment.css';

class MultipleChoiceQuestionSegment extends React.Component {
    constructor(props) {
        super(props);
        
        this.setAppState = props.stateSetter;
        this.state = {
            index: 0,
            questions: props.questions
        }
        
    }

    doAnswer(event) {
        let newIndex = this.state.index + 1;
        if (newIndex >= this.state.questions.length) {
            this.setAppState({
                activity: "start"
            });
        }
        this.setState({
            index: newIndex
        });
    }

    render() {
        let answers = [];

        let index = this.state.index;
        let question = this.state.questions[index];

        for (let i in question.answers) {
            let alternative = question.answers[i];
            answers.push(<button key={i} className="question-answer" value={alternative.id} onClick={this.doAnswer.bind(this)}>{alternative.description}</button>)
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

export default MultipleChoiceQuestionSegment;