package no.bank.quiz.service;

import no.bank.quiz.domain.QuizResponse;
import no.bank.quiz.repository.ResponseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResponseServiceDefault implements ResponseService {

    @Autowired
    private ResponseRepository responseRepository;

    @Override
    public void saveResponse(QuizResponse response) {
        response.setTimestamp(System.currentTimeMillis());
        System.out.println(response);
        responseRepository.save(response);
    }
}
