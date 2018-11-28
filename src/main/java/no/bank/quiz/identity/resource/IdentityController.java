package no.bank.quiz.identity.resource;

import no.bank.quiz.identity.domain.Identity;
import no.bank.quiz.identity.service.IdentityService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/identity")
public class IdentityController {

    private IdentityService identityService;

    public IdentityController(IdentityService identityService) {
        this.identityService = identityService;
    }

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public Integer createIdentity() {
        return identityService.createIdentity();
    }

    @GetMapping("/{identityId}")
    public Identity getIdentity(@PathVariable Integer identityId) {
        return identityService.getIdentity(identityId);
    }
}
