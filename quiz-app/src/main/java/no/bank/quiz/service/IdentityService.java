package no.bank.quiz.service;

import no.bank.quiz.domain.Identity;

public interface IdentityService {
    Integer createIdentity();
    Identity getIdentity(Integer identityId);
}
