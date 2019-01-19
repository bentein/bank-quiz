package no.bank.quiz.service;

import no.bank.quiz.domain.*;
import no.bank.quiz.score.domain.*;
import no.bank.quiz.repository.AnswerRepository;
import no.bank.quiz.repository.RegistrationRepository;
import no.bank.quiz.repository.ResponseRepository;
import no.bank.quiz.repository.ScoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class ScoreServiceDefault implements ScoreService {

    @Autowired
    private ScoreRepository scoreRepository;

    @Autowired
    private ResponseRepository responseRepository;

    @Autowired
    private AnswerRepository answerRepository;

    @Autowired
    private RegistrationRepository registrationRepository;

    @Override
    public Integer calculateScore(Integer registrationId) {
        List<QuizResponse> responses = responseRepository.findByIdRegistrationId(registrationId);
        List<Integer> answerIds = responses.stream()
                .map(QuizResponse::getAnswerId)
                .collect(Collectors.toList());
        Map<Integer, Boolean> answers = answerRepository.findAllById(answerIds).stream()
                .collect(Collectors.toMap(QuizAnswer::getId, QuizAnswer::isCorrect));

        Integer score = responses.stream()
                .map(r -> answers.get(r.getAnswerId()))
                .map(this::getScore)
                .reduce((x, y) -> x+y).orElse(0);

        scoreRepository.save(QuizScore.builder()
                .registrationId(registrationId)
                .score(score).build());

        return score;
    }

    @Override
    public List<LeaderboardEntry> getTopTenLeaderboard(QuizDifficulty difficulty) {
        return registrationRepository.findTop10ByDifficultyOrderByScoreScoreDesc(difficulty).stream()
                .filter(r -> Objects.nonNull(r.getScore()))
                .map(r -> LeaderboardEntry.builder()
                        .name(r.getName())
                        .score(r.getScore()).build())
                .collect(Collectors.toList());
    }

    private Integer getScore(boolean correct) {
        if (correct) return 3;
        return -1;
    }
}
