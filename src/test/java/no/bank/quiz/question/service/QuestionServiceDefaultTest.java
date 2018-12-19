package no.bank.quiz.question.service;

import no.bank.quiz.question.exception.QuestionNotFoundException;
import no.bank.quiz.question.repository.QuestionRepository;
import no.bank.quiz.question.domain.QuestionDifficulty;
import no.bank.quiz.question.domain.QuizAnswer;
import no.bank.quiz.question.domain.QuizQuestion;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.EmbeddedDatabaseConnection;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureTestDatabase(
        replace = AutoConfigureTestDatabase.Replace.ANY,
        connection = EmbeddedDatabaseConnection.H2)
@Ignore
public class QuestionServiceDefaultTest {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private QuestionRepository questionRepository;

    private static QuizQuestion easyQuestion;

    public static boolean setupFinished = false;

    @Before
    public void setup() {
        if (!setupFinished){
            easyQuestion = QuizQuestion.builder()
                    .description("testquestion1")
                    .difficulty(QuestionDifficulty.EASY)
                    .answers(Arrays.asList(
                            QuizAnswer.builder().description("testanswer1").isCorrect(false).build(),
                            QuizAnswer.builder().description("testanswer2").isCorrect(false).build(),
                            QuizAnswer.builder().description("testanswer3").isCorrect(true).build(),
                            QuizAnswer.builder().description("testanswer4").isCorrect(false).build()))
                    .build();
            questionRepository.save(easyQuestion);
            setupFinished = true;
        }
    }

    @Test
    public void givenId_getQuestionWithId_returnQuestion() {
        Integer id = easyQuestion.getId();

        QuizQuestion result = questionService.getQuestion(id);
        assertNotNull(result);
        assertEquals(id, result.getId());
        assertEquals(easyQuestion.getAnswers().size(), result.getAnswers().size());
    }

    @Test(expected = QuestionNotFoundException.class)
    public void givenInvalidId_getQuestionWithId_returnQuestion() {
        Integer id = -1;

        QuizQuestion result = questionService.getQuestion(id);
        assertNotNull(result);
        assertEquals(id, result.getId());
        assertEquals(easyQuestion.getAnswers().size(), result.getAnswers().size());
    }

    @Test
    public void givenDifficulty_getQuestionsWithDifficulty_returnQuestions() {
        List<QuizQuestion> results = questionService.getAllQuestions(QuestionDifficulty.EASY);
        assertFalse(results.isEmpty());
        assertEquals(easyQuestion.getId(), results.get(0).getId());
        assertEquals(easyQuestion.getAnswers().size(), results.get(0).getAnswers().size());
    }

}
