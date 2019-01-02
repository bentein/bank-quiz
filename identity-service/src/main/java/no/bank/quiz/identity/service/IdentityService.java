package no.bank.quiz.identity.service;

import no.bank.quiz.identity.domain.Identity;

public interface IdentityService {
    Integer createIdentity();
    Identity getIdentity(Integer identityId);
}
