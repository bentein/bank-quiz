package no.bank.quiz.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LeaderboardEntry {
    private String name;
    private Integer score;
}
