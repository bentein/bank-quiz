package no.bank.quiz.identity.resource;

import io.micrometer.prometheus.PrometheusMeterRegistry;
import no.bank.quiz.identity.annotation.Counted;
import no.bank.quiz.identity.domain.Identity;
import no.bank.quiz.identity.service.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/identity")
public class IdentityController {

    @Autowired
    private PrometheusMeterRegistry registry;

    @Autowired
    private IdentityService identityService;

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    @Counted(value = "post_requests_identity")
    public Integer createIdentity() {
        return identityService.createIdentity();
    }

    @GetMapping("/{identityId}")
    public Identity getIdentity(@PathVariable Integer identityId) {
        return identityService.getIdentity(identityId);
    }
}
