package no.bank.quiz.service;

import no.bank.quiz.domain.UserIdentity;

public interface IdentityService {
    Integer createIdentity();
    UserIdentity getIdentity(Integer identityId);
}
