package no.bank.quiz.repository;

import no.bank.quiz.domain.QuizResponse;
import no.bank.quiz.domain.QuizResponseId;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResponseRepository extends CrudRepository<QuizResponse, QuizResponseId> {

    List<QuizResponse> findByIdRegistrationId(Integer registrationId);
}
