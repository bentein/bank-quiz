package no.bank.quiz.identity.repository;

import no.bank.quiz.identity.domain.QuizDifficulty;
import no.bank.quiz.identity.domain.Registration;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RegistrationRepository extends CrudRepository<Registration, Integer> {
    List<Registration> findAllByDifficulty(QuizDifficulty difficulty);
}
