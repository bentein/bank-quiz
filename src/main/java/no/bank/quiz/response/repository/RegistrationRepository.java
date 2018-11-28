package no.bank.quiz.response.repository;

import no.bank.quiz.response.domain.QuizDifficulty;
import no.bank.quiz.response.domain.UserRegistration;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RegistrationRepository extends CrudRepository<UserRegistration, Integer> {
    List<UserRegistration> findAllByDifficulty(QuizDifficulty difficulty);
}
