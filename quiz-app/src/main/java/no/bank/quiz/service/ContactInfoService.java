package no.bank.quiz.service;

import no.bank.quiz.domain.ContactInfo;
import no.bank.quiz.repository.ContactInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactInfoService {

    private final ContactInfoRepository contactInfoRepository;

    public ContactInfoService(ContactInfoRepository contactInfoRepository) {
        this.contactInfoRepository = contactInfoRepository;
    }

    public void updateContactInfo(ContactInfo contactInfo) {
        contactInfoRepository.save(contactInfo);
    }

    public void deleteContactInfo(Integer identityId) {
        contactInfoRepository.deleteById(identityId);
    }
}
