package no.bank.quiz.score.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.TimeZone;

@Data
@Builder
@Entity
@Table(name = "registration")
@JsonInclude(JsonInclude.Include.NON_NULL)
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
