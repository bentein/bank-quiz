package no.bank.quiz.score.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LeaderboardEntry {
    private String name;
    private Integer score;
}
