package no.bank.quiz.service;

import no.bank.quiz.domain.QuizQuestion;
import no.bank.quiz.exception.ErrorCode;
import no.bank.quiz.repository.QuestionRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;

    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    public List<QuizQuestion> getAllQuestions(String quizId) {
        return questionRepository.findByQuizId(quizId);
    }

    public QuizQuestion getQuestion(int questionId) {
        return questionRepository.findById(questionId)
                .orElseThrow(() -> new ResourceNotFoundException(ErrorCode.QUESTION_NOT_FOUND.name()));
    }

    public void saveQuestion(QuizQuestion question) {
        question.getAnswers().forEach(a -> a.setQuestion(question));
        questionRepository.save(question);
    }
}
