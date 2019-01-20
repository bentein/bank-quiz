package no.bank.quiz.service;

import no.bank.quiz.domain.Quiz;
import no.bank.quiz.domain.QuizQuestion;
import no.bank.quiz.exception.ErrorCode;
import no.bank.quiz.repository.QuestionRepository;
import no.bank.quiz.repository.QuizRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizServiceDefault implements QuizService {

    @Autowired
    private QuizRepository quizRepository;

    @Override
    public Quiz getQuiz(String quizId) {
        return quizRepository.findById(quizId)
                .orElseThrow(() -> new ResourceNotFoundException(ErrorCode.QUIZ_NOT_FOUND.name()));
    }

    @Override
    public void saveQuiz(Quiz quiz) {
        quizRepository.save(quiz);
    }
}
