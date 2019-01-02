package no.bank.quiz.question.service;

import no.bank.quiz.question.domain.QuestionDifficulty;
import no.bank.quiz.question.domain.QuizQuestion;

import java.util.List;

public interface QuestionService {
    List<QuizQuestion> getAllQuestions(QuestionDifficulty difficulty);
    QuizQuestion getQuestion(int id);
    void saveQuestion(QuizQuestion question);
}
