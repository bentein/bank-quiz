package no.bank.quiz.repository;

import no.bank.quiz.domain.Identity;
import org.springframework.data.repository.CrudRepository;

public interface IdentityRepository extends CrudRepository<Identity, Integer> { }
