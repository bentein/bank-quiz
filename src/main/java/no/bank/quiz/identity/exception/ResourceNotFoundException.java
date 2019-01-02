package no.bank.quiz.identity.exception;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ResourceNotFoundException extends RuntimeException {
    private ErrorCode errorCode;
}
