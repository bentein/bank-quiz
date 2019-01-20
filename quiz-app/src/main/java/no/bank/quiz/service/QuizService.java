package no.bank.quiz.service;

import no.bank.quiz.domain.Quiz;

public interface QuizService {
    Quiz getQuiz(String quizId);
    void saveQuiz(Quiz quiz);
}
