package no.bank.quiz.repository;

import no.bank.quiz.domain.QuestionDifficulty;
import no.bank.quiz.domain.QuizQuestion;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends CrudRepository<QuizQuestion, Integer> {
    List<QuizQuestion> findByDifficulty(QuestionDifficulty difficulty);
}
