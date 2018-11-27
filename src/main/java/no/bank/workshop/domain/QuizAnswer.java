package no.bank.workshop.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QuizAnswer {

    private String id;
    private String description;
}
