package no.bank.workshop.service;

import no.bank.workshop.domain.QuestionDifficulty;
import no.bank.workshop.domain.QuizQuestion;

import java.util.List;

public interface QuestionService {
    List<QuizQuestion> getAllQuestions(QuestionDifficulty difficulty);
    QuizQuestion getQuestion(int id);
    void saveQuestion(QuizQuestion question);
}
