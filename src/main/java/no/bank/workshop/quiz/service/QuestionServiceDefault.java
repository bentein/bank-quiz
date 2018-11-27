package no.bank.workshop.quiz.service;

import no.bank.workshop.quiz.domain.QuestionDifficulty;
import no.bank.workshop.quiz.domain.QuizQuestion;
import no.bank.workshop.quiz.exception.QuestionNotFoundException;
import no.bank.workshop.quiz.repository.QuestionRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceDefault implements QuestionService {

    private QuestionRepository questionRepository;

    public QuestionServiceDefault(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    @Override
    public List<QuizQuestion> getAllQuestions(QuestionDifficulty difficulty) {
        return questionRepository.findByDifficulty(difficulty);
    }

    @Override
    public QuizQuestion getQuestion(int questionId) {
        return questionRepository.findById(questionId).orElseThrow(QuestionNotFoundException::new);
    }

    @Override
    public void saveQuestion(QuizQuestion question) {
        question.getAnswers().forEach(a -> a.setQuestion(question));
        questionRepository.save(question);
    }
}
