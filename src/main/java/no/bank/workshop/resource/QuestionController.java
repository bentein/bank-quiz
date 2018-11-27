package no.bank.workshop.resource;

import no.bank.workshop.domain.QuestionDifficulty;
import no.bank.workshop.domain.QuizQuestion;
import no.bank.workshop.service.QuestionService;
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
    public QuizQuestion getQuestion(@PathVariable String questionId) {
        return questionService.getQuestion(questionId);
    }
}
