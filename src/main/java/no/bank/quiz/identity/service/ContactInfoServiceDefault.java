package no.bank.quiz.identity.service;

import io.micrometer.core.annotation.Timed;
import io.micrometer.core.instrument.Counter;
import io.micrometer.prometheus.PrometheusMeterRegistry;
import no.bank.quiz.identity.domain.ContactInfo;
import no.bank.quiz.identity.repository.ContactInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Optional;

@Service
public class ContactInfoServiceDefault implements ContactInfoService {

    @Autowired
    private PrometheusMeterRegistry registry;

    @Autowired
    private ContactInfoRepository contactInfoRepository;

    private Counter contactApproved;

    @PostConstruct
    public void init() {
        contactApproved = registry.counter("contact_approved");
    }

    @Override
    @Timed
    public void updateContactInfo(ContactInfo contactInfo) {
        if (contactInfo.isContact()) contactApproved.increment();
        contactInfoRepository.save(contactInfo);
    }

    @Override
    @Timed
    public void deleteContactInfo(Integer identityId) {
        contactInfoRepository.deleteById(identityId);
    }
}
