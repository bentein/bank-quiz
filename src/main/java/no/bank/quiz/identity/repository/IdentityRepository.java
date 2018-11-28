package no.bank.quiz.identity.repository;

import no.bank.quiz.identity.domain.Identity;
import org.springframework.data.repository.CrudRepository;

public interface IdentityRepository extends CrudRepository<Identity, Integer> {}
