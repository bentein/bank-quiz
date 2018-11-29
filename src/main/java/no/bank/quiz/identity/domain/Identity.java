package no.bank.quiz.identity.domain;

import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Data
@Builder
@Entity
@Table(name = "identity")
public class Identity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn
    private ContactInfo contactInfo;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER)
    @JoinColumn(name = "identity_id")
    private Set<Registration> registrations;

}
