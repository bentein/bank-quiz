package no.bank.quiz.service;

import no.bank.quiz.domain.UserIdentity;
import no.bank.quiz.exception.ErrorCode;
import no.bank.quiz.repository.IdentityRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class IdentityService {

    private final IdentityRepository identityRepository;

    public IdentityService(IdentityRepository identityRepository) {
        this.identityRepository = identityRepository;
    }

    public Integer createIdentity() {
        return identityRepository.save(UserIdentity.builder().build()).getId();
    }

    @Transactional
    public UserIdentity getIdentity(Integer identityId) {
        return identityRepository.findById(identityId).orElseThrow(() -> new ResourceNotFoundException(ErrorCode.IDENTITY_NOT_FOUND.name()));
    }
}
