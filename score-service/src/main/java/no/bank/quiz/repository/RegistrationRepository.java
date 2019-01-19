package no.bank.quiz.repository;

import no.bank.quiz.domain.QuizDifficulty;
import no.bank.quiz.domain.Registration;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RegistrationRepository extends JpaRepository<Registration, Integer> {
    List<Registration> findTop10ByDifficultyOrderByScoreScoreDesc(QuizDifficulty difficulty);
}
