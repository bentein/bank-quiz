package no.bank.quiz.exception;

public class TooManyAttemptsException extends RuntimeException {
    private String errorCode;

    public String getErrorCode() {
        return this.errorCode;
    }

    public TooManyAttemptsException(String errorCode) {
        this.errorCode = errorCode;
    }
}
