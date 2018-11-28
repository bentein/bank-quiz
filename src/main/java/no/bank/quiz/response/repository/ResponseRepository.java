package no.bank.quiz.response.repository;

import no.bank.quiz.response.domain.QuizResponse;
import no.bank.quiz.response.domain.QuizResponseId;
import org.springframework.data.repository.CrudRepository;

public interface ResponseRepository extends CrudRepository<QuizResponse, QuizResponseId> {
}
