package no.bank.quiz.service;

import no.bank.quiz.domain.QuizResponse;
import no.bank.quiz.repository.ResponseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResponseServiceDefault implements ResponseService {

    @Autowired
    private ResponseRepository responseRepository;

    @Override
    public void saveResponse(QuizResponse response) {
        response.setTimestamp(System.currentTimeMillis());
        responseRepository.save(response);
    }

    @Override
    public List<QuizResponse> findResponseWithFreeTextBetween(String a, String b) {
        return responseRepository.findAllByFreeTextBetween(a,b);
    }
}
