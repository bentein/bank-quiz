package no.bank.workshop.quiz.resource;

import no.bank.workshop.quiz.domain.QuestionDifficulty;
import no.bank.workshop.quiz.domain.QuizQuestion;
import no.bank.workshop.quiz.service.QuestionService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/questions")
public class QuestionController {

    private QuestionService questionService;

    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping
    public List<QuizQuestion> getAllQuestions(@RequestParam QuestionDifficulty difficulty) {
        return questionService.getAllQuestions(difficulty);
    }

    @GetMapping(value = "/{questionId}")
    public QuizQuestion getQuestion(@PathVariable int questionId) {
        return questionService.getQuestion(questionId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public void saveQuestion(@RequestBody QuizQuestion question) {
        questionService.saveQuestion(question);
    }
}
