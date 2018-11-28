package no.bank.quiz.identity.service;

import no.bank.quiz.identity.domain.Identity;
import no.bank.quiz.identity.exception.IdentityNotFoundException;
import no.bank.quiz.identity.repository.IdentityRepository;
import org.springframework.stereotype.Service;

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
    public Identity getIdentity(Integer identityId) {
        return identityRepository.findById(identityId).orElseThrow(IdentityNotFoundException::new);
    }
}
