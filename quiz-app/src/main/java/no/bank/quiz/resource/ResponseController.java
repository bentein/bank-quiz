package no.bank.quiz.resource;

import no.bank.quiz.domain.QuizResponse;
import no.bank.quiz.service.ResponseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/response")
public class ResponseController {

    @Autowired
    private ResponseService responseService;

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public void registerResponse(@RequestBody QuizResponse response) {
        responseService.saveResponse(response);
    }

    @GetMapping("/freetext")
    public List<QuizResponse> getResponsesInRange(@RequestParam String from,
                                                  @RequestParam String to) {
        return responseService.findResponseWithFreeTextBetween(from,to);
    }
}
