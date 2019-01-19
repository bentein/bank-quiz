package no.bank.quiz.service;


import no.bank.quiz.domain.ContactInfo;

public interface ContactInfoService {
    void updateContactInfo(ContactInfo contactInfo);
    void deleteContactInfo(Integer identityId);
}
