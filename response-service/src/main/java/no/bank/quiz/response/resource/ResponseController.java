package no.bank.quiz.response.resource;

import no.bank.quiz.response.domain.QuizResponse;
import no.bank.quiz.response.service.ResponseService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/response")
public class ResponseController {

    private ResponseService responseService;

    public ResponseController(ResponseService responseService) {
        this.responseService = responseService;
    }

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public void registerResponse(@RequestBody QuizResponse response) {
        responseService.saveResponse(response);
    }
}
