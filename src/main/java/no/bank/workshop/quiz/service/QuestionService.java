package no.bank.workshop.quiz.service;

import no.bank.workshop.quiz.domain.QuestionDifficulty;
import no.bank.workshop.quiz.domain.QuizQuestion;

import java.util.List;

public interface QuestionService {
    List<QuizQuestion> getAllQuestions(QuestionDifficulty difficulty);
    QuizQuestion getQuestion(int id);
    void saveQuestion(QuizQuestion question);
}
