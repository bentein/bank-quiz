package no.bank.quiz.repository;

import no.bank.quiz.domain.Registration;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RegistrationRepository extends CrudRepository<Registration, Integer> {
    List<Registration> findAllByQuizId(String quizId);
    List<Registration> findTop10ByQuizIdOrderByScoreScoreDesc(String quizId);

}
