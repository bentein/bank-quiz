package no.bank.quiz.util.exception;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class ResourceNotFoundException extends RuntimeException {
    private String errorCode;

    public String getErrorCode() {
        return errorCode;
    }
}
