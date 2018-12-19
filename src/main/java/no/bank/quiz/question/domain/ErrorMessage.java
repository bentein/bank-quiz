package no.bank.quiz.question.domain;

import lombok.*;

import java.io.Serializable;

@Value
@Builder
@ToString
public class ErrorMessage implements Serializable {

    public static final String STATUS_ERROR = "error";

    private static final long serialVersionUID = -1169225117481748947L;

    private Integer code;

    private String message;

}