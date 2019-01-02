package no.bank.quiz.identity.service;

import no.bank.quiz.identity.domain.Registration;
import no.bank.quiz.identity.exception.ErrorCode;
import no.bank.quiz.identity.repository.RegistrationRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

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
    @Transactional
    public Registration getUserRegistration(Integer registrationId) {
        Registration registration = registrationRepository.findById(registrationId)
                .orElseThrow(() -> new ResourceNotFoundException(ErrorCode.REGISTRATION_NOT_FOUND.name())).loadResponses();
        registration.getResponses().size();
        return registration;
    }
}
