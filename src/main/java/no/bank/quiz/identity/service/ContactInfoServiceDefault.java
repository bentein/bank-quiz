package no.bank.quiz.identity.service;

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
    public void updateContactInfo(ContactInfo contactInfo) {
        contactInfoRepository.save(contactInfo);
    }
}
