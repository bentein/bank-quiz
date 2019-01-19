package no.bank.quiz.repository;

import no.bank.quiz.domain.QuizScore;
import org.springframework.data.repository.CrudRepository;

public interface ScoreRepository extends CrudRepository<QuizScore, Integer> {
}
