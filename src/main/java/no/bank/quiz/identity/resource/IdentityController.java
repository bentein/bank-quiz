package no.bank.quiz.identity.resource;

import io.micrometer.core.instrument.Counter;
import io.micrometer.prometheus.PrometheusMeterRegistry;
import no.bank.quiz.identity.domain.Identity;
import no.bank.quiz.identity.service.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;

@RestController
@RequestMapping("/identity")
public class IdentityController {

    @Autowired
    private PrometheusMeterRegistry registry;

    @Autowired
    private IdentityService identityService;

    private Counter postHits;

    @PostConstruct
    public void init() {
        postHits = registry.counter("post_requests_identity");
    }

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public Integer createIdentity() {
        postHits.increment();
        return identityService.createIdentity();
    }

    @GetMapping("/{identityId}")
    public Identity getIdentity(@PathVariable Integer identityId) {
        return identityService.getIdentity(identityId);
    }
}
