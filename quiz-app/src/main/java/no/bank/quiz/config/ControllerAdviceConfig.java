package no.bank.quiz.config;

import no.bank.quiz.exception.TooManyAttemptsException;
import no.bank.quiz.util.config.BaseControllerAdviceConfig;
import no.bank.quiz.util.exception.ErrorMessage;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class ControllerAdviceConfig extends BaseControllerAdviceConfig {

    @ResponseBody
    @ResponseStatus(HttpStatus.FORBIDDEN)
    @ExceptionHandler({TooManyAttemptsException.class})
    public ErrorMessage requestHandlingTooManyAttempts(TooManyAttemptsException ex) {
        return ErrorMessage.builder().internalMessage(ex.getErrorCode()).message("Quiz has been answered too many times").code(403).build();
    }

    @ResponseBody
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    @ExceptionHandler(DataIntegrityViolationException.class)
    public ErrorMessage requestHandlingConstraintViolation() {
        return ErrorMessage.builder()
                .message("Provided ids not present in associated rows")
                .code(400).build();
    }

    @ResponseBody
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    @ExceptionHandler(JpaSystemException.class)
    public ErrorMessage requestHandlingNoQARelation() {
        return ErrorMessage.builder()
                .message("Provided answer not associated with provided question")
                .code(400).build();
    }
}
