package no.bank.quiz.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Data
@Builder
@Entity
@Table(name = "identity")
@NoArgsConstructor
@AllArgsConstructor
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
