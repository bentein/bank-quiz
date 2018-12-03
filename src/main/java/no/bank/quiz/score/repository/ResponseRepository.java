package no.bank.quiz.score.repository;

import no.bank.quiz.score.domain.QuizResponse;
import no.bank.quiz.score.domain.QuizResponseId;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResponseRepository extends CrudRepository<QuizResponse, QuizResponseId> {

    List<QuizResponse> findByIdRegistrationId(Integer registrationId);
}
