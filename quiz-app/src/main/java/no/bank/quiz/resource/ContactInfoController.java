package no.bank.quiz.resource;

import no.bank.quiz.domain.ContactInfo;
import no.bank.quiz.service.ContactInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/contactinfo")
public class ContactInfoController {

    @Autowired
    private ContactInfoService contactInfoService;

    @PostMapping
    @ResponseStatus(value = HttpStatus.CREATED)
    public void registerContactInfo(@RequestBody ContactInfo contactInfo) {
        contactInfoService.updateContactInfo(contactInfo);
    }

    @DeleteMapping("/{identityId}")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void deleteContactInfo(@PathVariable Integer identityId) {
        contactInfoService.deleteContactInfo(identityId);
    }
}
