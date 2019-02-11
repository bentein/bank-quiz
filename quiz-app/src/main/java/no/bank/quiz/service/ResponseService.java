package no.bank.quiz.service;

import no.bank.quiz.domain.QuizResponse;

import java.util.List;

public interface ResponseService {
    void saveResponse(QuizResponse response);
    List<QuizResponse> findResponseWithFreeTextBetween(String a, String b);
}
