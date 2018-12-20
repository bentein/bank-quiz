package no.bank.quiz.identity.resource;

import io.micrometer.core.instrument.Counter;
import io.micrometer.prometheus.PrometheusMeterRegistry;
import no.bank.quiz.identity.domain.Registration;
import no.bank.quiz.identity.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;

@RestController
@RequestMapping("/registration")
public class RegistrationController {

    @Autowired
    private PrometheusMeterRegistry registry;

    @Autowired
    private RegistrationService registrationService;

    private Counter postHits;

    @PostConstruct
    private void init() {
        postHits = registry.counter("post_requests_registration");
    }

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public Integer registerAttempt(@RequestBody Registration registration) {
        postHits.increment();
        return registrationService.registerUser(registration);
    }

    @GetMapping("/{registrationId}")
    public Registration getAttempt(@PathVariable Integer registrationId) {
        return registrationService.getUserRegistration(registrationId);
    }
}
