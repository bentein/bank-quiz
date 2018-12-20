package no.bank.quiz.identity.resource;

import no.bank.quiz.identity.annotation.Counted;
import no.bank.quiz.identity.domain.Registration;
import no.bank.quiz.identity.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/registration")
public class RegistrationController {

    @Autowired
    private RegistrationService registrationService;

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    @Counted(value = "post_requests_registration")
    public Integer registerAttempt(@RequestBody Registration registration) {
        return registrationService.registerUser(registration);
    }

    @GetMapping("/{registrationId}")
    public Registration getAttempt(@PathVariable Integer registrationId) {
        return registrationService.getUserRegistration(registrationId);
    }
}
