package no.bank.quiz.response.service;

import no.bank.quiz.response.domain.QuizResponse;
import no.bank.quiz.response.repository.ResponseRepository;
import org.springframework.stereotype.Service;

@Service
public class ResponseServiceDefault implements ResponseService {
    private ResponseRepository responseRepository;

    public ResponseServiceDefault(ResponseRepository responseRepository) {
        this.responseRepository = responseRepository;
    }

    @Override
    public void saveResponse(QuizResponse response) {
        response.setTimestamp(System.currentTimeMillis());
        responseRepository.save(response);
    }
}
