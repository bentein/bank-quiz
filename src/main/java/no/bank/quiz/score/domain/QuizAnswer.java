package no.bank.quiz.score.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.Type;

import javax.persistence.*;


@Data
@Entity
@Table(name = "answer")
@NoArgsConstructor
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

    @Type(type = "numeric_boolean")
    private boolean isCorrect;
}
