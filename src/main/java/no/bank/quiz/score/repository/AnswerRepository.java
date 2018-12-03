package no.bank.quiz.score.repository;

import no.bank.quiz.score.domain.QuizAnswer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnswerRepository extends JpaRepository<QuizAnswer, Integer> {
}
