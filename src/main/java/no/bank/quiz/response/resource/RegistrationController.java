package no.bank.quiz.response.resource;

import no.bank.quiz.response.domain.UserRegistration;
import no.bank.quiz.response.service.RegistrationService;
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
    public Integer registerAttempt(@RequestBody UserRegistration registration) {
        return registrationService.registerUser(registration);
    }

    @GetMapping("/{registrationId}")
    public UserRegistration getAttempt(@PathVariable Integer registrationId) {
        return registrationService.getUserRegistration(registrationId);
    }
}
