package no.bank.quiz.repository;

import no.bank.quiz.domain.QuizAnswer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnswerRepository extends JpaRepository<QuizAnswer, Integer> {
}
