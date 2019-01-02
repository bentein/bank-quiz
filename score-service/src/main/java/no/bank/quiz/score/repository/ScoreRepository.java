package no.bank.quiz.score.repository;

import no.bank.quiz.score.domain.QuizScore;
import org.springframework.data.repository.CrudRepository;

public interface ScoreRepository extends CrudRepository<QuizScore, Integer> {
}
