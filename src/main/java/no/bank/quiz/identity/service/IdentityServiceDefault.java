package no.bank.quiz.identity.service;

import no.bank.quiz.identity.domain.Identity;
import no.bank.quiz.identity.exception.ErrorCode;
import no.bank.quiz.identity.repository.IdentityRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class IdentityServiceDefault implements IdentityService {

    private IdentityRepository identityRepository;

    public IdentityServiceDefault(IdentityRepository identityRepository) {
        this.identityRepository = identityRepository;
    }

    @Override
    public Integer createIdentity() {
        return identityRepository.save(Identity.builder().build()).getId();
    }

    @Override
    @Transactional
    public Identity getIdentity(Integer identityId) {
        return identityRepository.findById(identityId).orElseThrow(() -> new ResourceNotFoundException(ErrorCode.IDENTITY_NOT_FOUND.name()));
    }
}
