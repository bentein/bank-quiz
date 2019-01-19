package no.bank.quiz.service;


import no.bank.quiz.domain.Registration;

public interface RegistrationService {

    Integer registerUser(Registration registration);
    Registration getUserRegistration(Integer id);
}
