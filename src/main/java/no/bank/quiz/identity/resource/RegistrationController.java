package no.bank.quiz.identity.resource;

import no.bank.quiz.identity.domain.Registration;
import no.bank.quiz.identity.service.RegistrationService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/registration")
public class RegistrationController {

    private RegistrationService registrationService;

    public RegistrationController(RegistrationService registrationService) {
        this.registrationService = registrationService;
    }

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public Integer registerAttempt(@RequestBody Registration registration) {
        return registrationService.registerUser(registration);
    }

    @GetMapping("/{registrationId}")
    public Registration getAttempt(@PathVariable Integer registrationId) {
        return registrationService.getUserRegistration(registrationId);
    }
}
