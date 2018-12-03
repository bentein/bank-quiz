package no.bank.quiz.identity.service;


import no.bank.quiz.identity.domain.ContactInfo;

public interface ContactInfoService {
    void updateContactInfo(ContactInfo contactInfo);
    void deleteContactInfo(Integer identityId);
}
