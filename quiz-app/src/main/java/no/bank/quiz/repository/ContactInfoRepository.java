package no.bank.quiz.repository;

import no.bank.quiz.domain.ContactInfo;
import org.springframework.data.repository.CrudRepository;

public interface ContactInfoRepository extends CrudRepository<ContactInfo, Integer> {}
