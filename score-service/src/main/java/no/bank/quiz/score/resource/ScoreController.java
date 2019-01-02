package no.bank.quiz.score.resource;

import no.bank.quiz.score.domain.LeaderboardEntry;
import no.bank.quiz.score.domain.QuizDifficulty;
import no.bank.quiz.score.service.ScoreService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/score")
public class ScoreController {

    private ScoreService scoreService;

    public ScoreController(ScoreService scoreService) {
        this.scoreService = scoreService;
    }

    @GetMapping("/{registrationId}")
    public Integer calculateScore(@PathVariable Integer registrationId) {
        return scoreService.calculateScore(registrationId);
    }

    @GetMapping("/leaderboard/{difficulty}")
    public List<LeaderboardEntry> getLeaderboard(@PathVariable QuizDifficulty difficulty) {
        return scoreService.getTopTenLeaderboard(difficulty);
    }
}
