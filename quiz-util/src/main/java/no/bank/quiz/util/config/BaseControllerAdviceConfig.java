package no.bank.quiz.util.config;

import no.bank.quiz.util.exception.ErrorMessage;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class BaseControllerAdviceConfig {

    @ResponseBody
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(ResourceNotFoundException.class)
    public ErrorMessage requestHandlingNoHandlerFound(ResourceNotFoundException ex) {
        return ErrorMessage.builder()
                .internalMessage(ex.getErrorCode())
                .message("Could not find resource with provided id")
                .code(404).build();
    }

}
