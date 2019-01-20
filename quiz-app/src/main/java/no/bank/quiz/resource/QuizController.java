package no.bank.quiz.resource;

import no.bank.quiz.domain.Quiz;
import no.bank.quiz.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/quiz")
public class QuizController {

    @Autowired
    private QuizService quizService;

    @GetMapping(value = "/{quizId}")
    public Quiz getQuiz(@PathVariable String quizId) {
        return quizService.getQuiz(quizId);
    }

    @PostMapping
    @Secured("ROLE_USER")
    @ResponseStatus(HttpStatus.CREATED)
    public void saveQuiz(@RequestBody Quiz quiz) {
        quizService.saveQuiz(quiz);
    }
}
