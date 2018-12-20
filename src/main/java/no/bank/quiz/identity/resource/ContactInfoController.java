package no.bank.quiz.identity.resource;

import io.micrometer.core.instrument.Counter;
import io.micrometer.prometheus.PrometheusMeterRegistry;
import no.bank.quiz.identity.domain.ContactInfo;
import no.bank.quiz.identity.service.ContactInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;

@RestController
@RequestMapping("/contactinfo")
public class ContactInfoController {

    @Autowired
    private PrometheusMeterRegistry registry;

    @Autowired
    private ContactInfoService contactInfoService;

    private Counter postHits;
    private Counter deleteHits;

    @PostConstruct
    public void init() {
        postHits = registry.counter("post_requests_contact_info");
        deleteHits = registry.counter("delete_requests_contact_info");
    }

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public void registerContactInfo(@RequestBody ContactInfo contactInfo) {
        postHits.increment();
        contactInfoService.updateContactInfo(contactInfo);
    }

    @DeleteMapping("/{identityId}")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void deleteContactInfo(@PathVariable Integer identityId) {
        deleteHits.increment();
        contactInfoService.deleteContactInfo(identityId);
    }
}
