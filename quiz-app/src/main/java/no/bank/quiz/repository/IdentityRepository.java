package no.bank.quiz.repository;

import no.bank.quiz.domain.UserIdentity;
import org.springframework.data.repository.CrudRepository;

public interface IdentityRepository extends CrudRepository<UserIdentity, Integer> { }
