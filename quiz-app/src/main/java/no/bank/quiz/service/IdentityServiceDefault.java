package no.bank.quiz.service;

import no.bank.quiz.exception.ErrorCode;
import no.bank.quiz.domain.UserIdentity;
import no.bank.quiz.repository.IdentityRepository;
import no.bank.quiz.util.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class IdentityServiceDefault implements IdentityService {

    @Autowired
    private IdentityRepository identityRepository;

    @Override
    public Integer createIdentity() {
        return identityRepository.save(UserIdentity.builder().build()).getId();
    }

    @Override
    @Transactional
    public UserIdentity getIdentity(Integer identityId) {
        return identityRepository.findById(identityId).orElseThrow(() -> new ResourceNotFoundException(ErrorCode.IDENTITY_NOT_FOUND.name()));
    }
}
