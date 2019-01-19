package no.bank.quiz.resource;

import no.bank.quiz.domain.Identity;
import no.bank.quiz.service.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/identity")
public class IdentityController {

    @Autowired
    private IdentityService identityService;

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public Integer createIdentity() {
        return identityService.createIdentity();
    }

    @Secured("ROLE_USER")
    @GetMapping("/{identityId}")
    public Identity getIdentity(@PathVariable Integer identityId) {
        return identityService.getIdentity(identityId);
    }
}
