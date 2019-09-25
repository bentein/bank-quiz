package no.bank.quiz.service;

import no.bank.quiz.domain.QuizResponse;
import no.bank.quiz.repository.ResponseRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResponseService {

    private final ResponseRepository responseRepository;

    public ResponseService(ResponseRepository responseRepository) {
        this.responseRepository = responseRepository;
    }

    public void saveResponse(QuizResponse response) {
        response.setTimestamp(System.currentTimeMillis());
        responseRepository.save(response);
    }

    public List<QuizResponse> findResponseWithFreeTextBetween(String a, String b) {
        return responseRepository.findAllByFreeTextBetween(a,b);
    }
}
