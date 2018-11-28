package no.bank.quiz.identity.service;


import no.bank.quiz.identity.domain.Registration;

public interface RegistrationService {

    Integer registerUser(Registration registration);
    Registration getUserRegistration(Integer id);
}
