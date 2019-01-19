package no.bank.quiz.repository;

import no.bank.quiz.domain.QuizDifficulty;
import no.bank.quiz.domain.Registration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RegistrationRepository extends CrudRepository<Registration, Integer> {
    List<Registration> findAllByDifficulty(QuizDifficulty difficulty);
    List<Registration> findTop10ByDifficultyOrderByScoreScoreDesc(QuizDifficulty difficulty);

}
