package no.bank.quiz.service;

import no.bank.quiz.domain.Quiz;
import no.bank.quiz.exception.ErrorCode;
import no.bank.quiz.domain.Registration;
import no.bank.quiz.exception.TooManyAttemptsException;
import no.bank.quiz.repository.QuizRepository;
import no.bank.quiz.repository.RegistrationRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class RegistrationServiceDefault implements RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    @Autowired
    private QuizRepository quizRepository;

    @Override
    public Integer registerUser(Registration registration) {
        registration.setTimestamp(System.currentTimeMillis());
        Integer attempts =
                registrationRepository.findAllByIdentityIdAndQuizId(registration.getIdentityId(), registration.getQuizId()).size();

        Integer allowedAttempts =
                quizRepository.findById(registration.getQuizId()).map(Quiz::getAttempts).orElse(0);

        if (allowedAttempts > attempts || allowedAttempts == 0) {
            return registrationRepository.save(registration).getId();
        } else {
            throw new TooManyAttemptsException(ErrorCode.TOO_MANY_ATTEMPTS.name());
        }
    }

    @Override
    @Transactional
    public Registration getUserRegistration(Integer registrationId) {
        Registration registration = registrationRepository.findById(registrationId)
                .orElseThrow(() -> new ResourceNotFoundException(ErrorCode.REGISTRATION_NOT_FOUND.name())).loadResponses();
        registration.getResponses().size();
        return registration;
    }

    @Override
    public void deleteRegistration(Integer registrationId) {
        registrationRepository.deleteById(registrationId);
    }
}
