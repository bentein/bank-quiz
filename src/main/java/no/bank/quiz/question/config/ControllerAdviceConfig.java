package no.bank.quiz.question.config;

import no.bank.quiz.question.domain.ErrorMessage;
import no.bank.quiz.question.exception.QuestionNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class ControllerAdviceConfig {

    @ResponseBody
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(QuestionNotFoundException.class)
    public ErrorMessage requestHandlingNoHandlerFound() {
        return ErrorMessage.builder()
                .message("Could not find question with provided id")
                .code(404).build();
    }

}
