package no.bank.quiz.service;

import no.bank.quiz.domain.QuestionDifficulty;
import no.bank.quiz.domain.QuizQuestion;

import java.util.List;

public interface QuestionService {
    List<QuizQuestion> getAllQuestions(QuestionDifficulty difficulty);
    QuizQuestion getQuestion(int id);
    void saveQuestion(QuizQuestion question);
}
