package no.bank.quiz.response.domain;

import lombok.Builder;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Data
@Builder
@Embeddable
public class QuizResponseId implements Serializable {

    private static final long serialVersionUID = -3627736820357036179L;

    @Column(name = "registration_id")
    private Integer registrationId;
    private Integer questionId;
}