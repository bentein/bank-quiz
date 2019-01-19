package no.bank.quiz.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import javax.persistence.*;
import java.util.Optional;

@Data
@Builder
@Entity
@Table(name = "registration")
@JsonInclude(JsonInclude.Include.NON_NULL)
@NoArgsConstructor
@AllArgsConstructor
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;

    @OneToOne
    @PrimaryKeyJoinColumn
    private QuizScore score;

    @Enumerated(EnumType.STRING)
    private QuizDifficulty difficulty;

    private long timestamp;

    public Integer getScore() {
        return Optional.ofNullable(score).orElse(QuizScore.builder().build())
                .getScore();
    }

}
