package no.bank.quiz.identity.resource;

import io.micrometer.prometheus.PrometheusMeterRegistry;
import no.bank.quiz.identity.annotation.Counted;
import no.bank.quiz.identity.domain.ContactInfo;
import no.bank.quiz.identity.service.ContactInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/contactinfo")
public class ContactInfoController {

    @Autowired
    private PrometheusMeterRegistry registry;

    @Autowired
    private ContactInfoService contactInfoService;

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    @Counted(value = "post_requests_contact_info")
    public void registerContactInfo(@RequestBody ContactInfo contactInfo) {
        contactInfoService.updateContactInfo(contactInfo);
    }

    @DeleteMapping("/{identityId}")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    @Counted(value = "delete_requests_contact_info")
    public void deleteContactInfo(@PathVariable Integer identityId) {
        contactInfoService.deleteContactInfo(identityId);
    }
}
