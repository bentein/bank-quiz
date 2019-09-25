package no.bank.quiz.resource;

import no.bank.quiz.domain.LeaderboardEntry;
import no.bank.quiz.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping
public class ScoreController {

    private final ScoreService scoreService;

    public ScoreController(ScoreService scoreService) {
        this.scoreService = scoreService;
    }

    @GetMapping("score/{registrationId}")
    public Integer calculateScore(@PathVariable Integer registrationId) {
        return scoreService.calculateScore(registrationId);
    }

    @GetMapping("/leaderboard/{quizId}")
    public List<LeaderboardEntry> getLeaderboard(@PathVariable String quizId) {
        return scoreService.getTopTenLeaderboard(quizId);
    }
}
