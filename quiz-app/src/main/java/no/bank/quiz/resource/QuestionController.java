package no.bank.quiz.resource;

import no.bank.quiz.domain.QuizQuestion;
import no.bank.quiz.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @GetMapping(value = "/questions/{questionId}")
    public QuizQuestion getQuestion(@PathVariable int questionId) {
        return questionService.getQuestion(questionId);
    }

    @PostMapping(value = "/questions")
    @Secured("ROLE_USER")
    @ResponseStatus(HttpStatus.CREATED)
    public void saveQuestion(@RequestBody QuizQuestion question) {
        questionService.saveQuestion(question);
    }

}
