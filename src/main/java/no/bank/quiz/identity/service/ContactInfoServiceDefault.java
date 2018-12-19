package no.bank.quiz.identity.service;

import io.micrometer.core.annotation.Timed;
import no.bank.quiz.identity.domain.ContactInfo;
import no.bank.quiz.identity.repository.ContactInfoRepository;
import org.springframework.stereotype.Service;

@Service
public class ContactInfoServiceDefault implements ContactInfoService {

    private ContactInfoRepository contactInfoRepository;

    public ContactInfoServiceDefault(ContactInfoRepository contactInfoRepository) {
        this.contactInfoRepository = contactInfoRepository;
    }

    @Override
    @Timed
    public void updateContactInfo(ContactInfo contactInfo) {
        contactInfoRepository.save(contactInfo);
    }

    @Override
    @Timed
    public void deleteContactInfo(Integer identityId) {
        contactInfoRepository.deleteById(identityId);
    }
}
