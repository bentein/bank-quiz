package no.bank.quiz.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;

@Data
@Builder
@Entity
@Table(name = "contact_info")
@NoArgsConstructor
@AllArgsConstructor
public class ContactInfo {

    @Id
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private Integer identityId;
    private String fullName;
    private String email;
    private String mobile;

    @Type(type = "numeric_boolean")
    private boolean contact;

}
