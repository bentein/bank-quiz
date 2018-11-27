package no.bank.workshop.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class QuizQuestion {

    private String id;
    private String description;
    private List<QuizAnswer> answers;

    @JsonIgnore
    private String correctAnswerId;
}
