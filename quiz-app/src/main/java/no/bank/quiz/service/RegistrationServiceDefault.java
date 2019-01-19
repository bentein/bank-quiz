package no.bank.quiz.service;

import no.bank.quiz.exception.ErrorCode;
import no.bank.quiz.domain.Registration;
import no.bank.quiz.repository.RegistrationRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class RegistrationServiceDefault implements RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

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
