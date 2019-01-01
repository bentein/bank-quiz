package no.bank.quiz.identity.service;

import no.bank.quiz.identity.domain.ContactInfo;
import no.bank.quiz.identity.repository.ContactInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactInfoServiceDefault implements ContactInfoService {

    @Autowired
    private ContactInfoRepository contactInfoRepository;

    @Override
    public void updateContactInfo(ContactInfo contactInfo) {
        contactInfoRepository.save(contactInfo);
    }

    @Override
    public void deleteContactInfo(Integer identityId) {
        contactInfoRepository.deleteById(identityId);
    }
}
