package no.bank.quiz.service;

import no.bank.quiz.domain.QuestionDifficulty;
import no.bank.quiz.domain.QuizQuestion;
import no.bank.quiz.exception.ErrorCode;
import no.bank.quiz.repository.QuestionRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceDefault implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    @Override
    public List<QuizQuestion> getAllQuestions(QuestionDifficulty difficulty) {
        return questionRepository.findByDifficulty(difficulty);
    }

    @Override
    public QuizQuestion getQuestion(int questionId) {
        return questionRepository.findById(questionId)
                .orElseThrow(() -> new ResourceNotFoundException(ErrorCode.QUESTION_NOT_FOUND.name()));
    }

    @Override
    public void saveQuestion(QuizQuestion question) {
        question.getAnswers().forEach(a -> a.setQuestion(question));
        questionRepository.save(question);
    }
}
