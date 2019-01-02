package no.bank.quiz.identity.repository;

import no.bank.quiz.identity.domain.ContactInfo;
import org.springframework.data.repository.CrudRepository;

public interface ContactInfoRepository extends CrudRepository<ContactInfo, Integer> {}
