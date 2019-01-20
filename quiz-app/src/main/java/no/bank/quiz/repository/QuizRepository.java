package no.bank.quiz.repository;

import no.bank.quiz.domain.Quiz;
import no.bank.quiz.domain.QuizQuestion;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuizRepository extends CrudRepository<Quiz, String> {}
