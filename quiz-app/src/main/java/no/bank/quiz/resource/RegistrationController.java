package no.bank.quiz.resource;

import no.bank.quiz.domain.Registration;
import no.bank.quiz.service.RegistrationService;
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
    public Integer registerAttempt(@RequestBody Registration registration) {
        return registrationService.registerUser(registration);
    }

    @GetMapping("/{registrationId}")
    public Registration getAttempt(@PathVariable Integer registrationId) {
        return registrationService.getUserRegistration(registrationId);
    }

    @DeleteMapping("/{registrationId}")
    public void deleteAttempt(@PathVariable Integer registrationId) {
        registrationService.deleteRegistration(registrationId);
    }
}
