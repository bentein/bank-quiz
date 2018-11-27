package no.bank.workshop.service;

import no.bank.workshop.domain.QuestionDifficulty;
import no.bank.workshop.domain.QuizQuestion;
import no.bank.workshop.exception.QuestionNotFoundException;
import no.bank.workshop.repository.QuestionRepository;
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
