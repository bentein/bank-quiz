package no.bank.quiz.identity.resource;

import no.bank.quiz.identity.domain.ContactInfo;
import no.bank.quiz.identity.domain.Registration;
import no.bank.quiz.identity.service.ContactInfoService;
import no.bank.quiz.identity.service.RegistrationService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/contactinfo")
public class ContactInfoController {

    private ContactInfoService contactInfoService;

    public ContactInfoController(ContactInfoService contactInfoService) {
        this.contactInfoService = contactInfoService;
    }

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public void registerContactInfo(@RequestBody ContactInfo contactInfo) {
        contactInfoService.updateContactInfo(contactInfo);
    }
}
