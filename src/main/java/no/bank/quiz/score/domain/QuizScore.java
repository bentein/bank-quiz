package no.bank.quiz.score.domain;

import lombok.Builder;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Builder
@Entity
@Table(name = "score")
public class QuizScore {

    @Id
    private Integer registrationId;
    private Integer score;
}
