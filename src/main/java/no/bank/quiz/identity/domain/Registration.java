package no.bank.quiz.identity.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;
import java.util.TimeZone;

@Data
@Builder
@Entity
@Table(name = "registration")
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "identity_id")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private Integer identityId;
    private String name;

    @Enumerated(EnumType.STRING)
    private QuizDifficulty difficulty;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER)
    @JoinColumn(name = "registration_id")
    private List<QuizResponse> responses;

    private long timestamp;

    @Transient
    @JsonIgnore
    @Getter(AccessLevel.NONE)
    @Setter(AccessLevel.NONE)
    private boolean loadResponses;

    public Registration loadResponses() {
        this.loadResponses = true;
        return this;
    }

    public List<QuizResponse> getResponses() {
        if (loadResponses){
            return responses;
        }
        return null;
    }

    public LocalDateTime getTimestamp() {
        return LocalDateTime.ofInstant(Instant.ofEpochMilli(timestamp),
                TimeZone.getTimeZone("CET").toZoneId());
    }
}
