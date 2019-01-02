package no.bank.quiz.question.resource;

import no.bank.quiz.question.domain.QuestionDifficulty;
import no.bank.quiz.question.domain.QuizQuestion;
import no.bank.quiz.question.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/questions")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

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

    @GetMapping("/difficulties")
    public QuestionDifficulty[] getAllDifficulties() {
        return QuestionDifficulty.values();
    }
}
