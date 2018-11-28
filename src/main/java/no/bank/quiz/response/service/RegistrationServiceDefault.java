package no.bank.quiz.response.service;

import no.bank.quiz.response.domain.UserRegistration;
import no.bank.quiz.response.exception.RegistrationNotFoundException;
import no.bank.quiz.response.repository.RegistrationRepository;
import org.springframework.stereotype.Service;

@Service
public class RegistrationServiceDefault implements RegistrationService {
    private RegistrationRepository registrationRepository;

    public RegistrationServiceDefault(RegistrationRepository registrationRepository) {
        this.registrationRepository = registrationRepository;
    }

    @Override
    public UserRegistration getUserRegistration(Integer id) {
        return registrationRepository.findById(id).orElseThrow(RegistrationNotFoundException::new);
    }

    @Override
    public Integer registerUser(UserRegistration registration) {
        registration.setTimestamp(System.currentTimeMillis());
        return registrationRepository.save(registration).getId();
    }

}
