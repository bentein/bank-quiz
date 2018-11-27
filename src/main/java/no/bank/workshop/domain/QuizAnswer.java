package no.bank.workshop.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import org.hibernate.annotations.Type;

import javax.persistence.*;


@Data
@Entity
@Table(name="answer")
public class QuizAnswer {

    @Builder
    public QuizAnswer(String description, boolean isCorrect) {
        this.description = description;
        this.isCorrect = isCorrect;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String description;

    @ManyToOne(optional = false)
    @JoinColumn(name = "question_id")
    @JsonIgnore
    private QuizQuestion question;

    @Type(type="numeric_boolean")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private boolean isCorrect;
}
