package no.bank.quiz.score.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Builder
@Entity
@Table(name = "score")
@NoArgsConstructor
@AllArgsConstructor
public class QuizScore {

    @Id
    private Integer registrationId;
    private Integer score;
}
