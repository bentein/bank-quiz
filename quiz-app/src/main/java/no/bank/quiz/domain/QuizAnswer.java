package no.bank.quiz.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.Type;

import javax.persistence.*;


@Data
@Entity
@Table(name = "answer")
@NoArgsConstructor
@AllArgsConstructor
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
    @ToString.Exclude
    private QuizQuestion question;

    @Type(type = "numeric_boolean")
    private boolean isCorrect;

    @JsonIgnore
    public boolean getIsCorrect() {
        return isCorrect;
    }
}
