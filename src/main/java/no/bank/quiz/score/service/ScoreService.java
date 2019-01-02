package no.bank.quiz.score.service;

import no.bank.quiz.score.domain.LeaderboardEntry;
import no.bank.quiz.score.domain.QuizDifficulty;

import java.util.List;

public interface ScoreService {
    Integer calculateScore(Integer registrationId);
    List<LeaderboardEntry> getTopTenLeaderboard(QuizDifficulty difficulty);
}
