package no.bank.quiz.service;

import no.bank.quiz.domain.LeaderboardEntry;
import no.bank.quiz.domain.QuizDifficulty;

import java.util.List;

public interface ScoreService {
    Integer calculateScore(Integer registrationId);
    List<LeaderboardEntry> getTopTenLeaderboard(QuizDifficulty difficulty);
}
