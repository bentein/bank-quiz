package no.bank.workshop.service;

import no.bank.workshop.domain.QuestionDifficulty;
import no.bank.workshop.domain.QuizQuestion;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class QuestionServiceDefault implements QuestionService {

    @Override
    public List<QuizQuestion> getAllQuestions(QuestionDifficulty difficulty) {
        return Collections.singletonList(QuizQuestion.builder().build());
    }

    @Override
    public QuizQuestion getQuestion(String questionId) {
        return QuizQuestion.builder().id(questionId).build();
    }
}
