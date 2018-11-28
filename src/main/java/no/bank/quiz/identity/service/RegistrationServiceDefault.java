package no.bank.quiz.identity.service;

import no.bank.quiz.identity.domain.Registration;
import no.bank.quiz.identity.exception.RegistrationNotFoundException;
import no.bank.quiz.identity.repository.RegistrationRepository;
import org.springframework.stereotype.Service;

@Service
public class RegistrationServiceDefault implements RegistrationService {
    private RegistrationRepository registrationRepository;

    public RegistrationServiceDefault(RegistrationRepository registrationRepository) {
        this.registrationRepository = registrationRepository;
    }

    @Override
    public Integer registerUser(Registration registration) {
        registration.setTimestamp(System.currentTimeMillis());
        return registrationRepository.save(registration).getId();
    }

    @Override
    public Registration getUserRegistration(Integer id) {
        return registrationRepository.findById(id).orElseThrow(RegistrationNotFoundException::new);
    }
}
