package no.bank.quiz.question.service;

import no.bank.quiz.question.domain.QuestionDifficulty;
import no.bank.quiz.question.exception.QuestionNotFoundException;
import no.bank.quiz.question.repository.QuestionRepository;
import no.bank.quiz.question.domain.QuizQuestion;
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
