package no.bank.quiz.response.service;

import no.bank.quiz.response.domain.UserRegistration;

public interface RegistrationService {

    UserRegistration getUserRegistration(Integer id);
    Integer registerUser(UserRegistration registration);
}
