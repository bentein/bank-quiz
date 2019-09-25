package no.bank.quiz.service;

import io.micrometer.prometheus.PrometheusMeterRegistry;
import no.bank.quiz.domain.*;
import no.bank.quiz.repository.AnswerRepository;
import no.bank.quiz.repository.RegistrationRepository;
import no.bank.quiz.repository.ResponseRepository;
import no.bank.quiz.repository.ScoreRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ScoreService {

    private final ScoreRepository scoreRepository;
    private final ResponseRepository responseRepository;
    private final AnswerRepository answerRepository;
    private final RegistrationRepository registrationRepository;

    private final PrometheusMeterRegistry registry;

    public ScoreService(ScoreRepository scoreRepository,
                        ResponseRepository responseRepository,
                        AnswerRepository answerRepository,
                        RegistrationRepository registrationRepository,
                        PrometheusMeterRegistry registry) {
        this.scoreRepository = scoreRepository;
        this.responseRepository = responseRepository;
        this.answerRepository = answerRepository;
        this.registrationRepository = registrationRepository;

        this.registry = registry;
    }

    public Integer calculateScore(Integer registrationId) {
        List<QuizResponse> responses = responseRepository.findByIdRegistrationId(registrationId);
        List<Integer> answerIds = responses.stream()
                .map(QuizResponse::getAnswerId)
                .collect(Collectors.toList());
        Map<Integer, Boolean> answers = answerRepository.findAllById(answerIds).stream()
                .collect(Collectors.toMap(QuizAnswer::getId, QuizAnswer::getIsCorrect));

        Integer score = responses.stream()
                .map(r -> {
                    boolean correct = answers.get(r.getAnswerId());
                    registerResult(r.getQuestionId(), correct);
                    return correct;
                })
                .map(this::getScore)
                .reduce(Integer::sum).orElse(0);

        scoreRepository.save(QuizScore.builder()
                .registrationId(registrationId)
                .score(score).build());

        return score;
    }

    public List<LeaderboardEntry> getTopTenLeaderboard(String quizId) {
        return registrationRepository.findTop10ByQuizIdOrderByScoreScoreDesc(quizId).stream()
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

    private void registerResult(int questionId, boolean correct) {
        String counterName = String.format("quiz.response.question.id.%s", questionId);
        registry.counter(counterName).increment(1);

        if(correct) {
            registry.counter(counterName + ".correct").increment(1);
        } else {
            registry.counter(counterName + ".incorrect").increment(1);
        }
    }

}
