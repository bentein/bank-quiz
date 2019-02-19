package no.bank.quiz.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.TimeZone;

@Data
@Builder
@Entity
@Table(name = "registration")
@JsonInclude(JsonInclude.Include.NON_NULL)
@NoArgsConstructor
@AllArgsConstructor
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "identity_id")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private Integer identityId;
    private String name;
    private String quizId;

    @OneToOne
    @PrimaryKeyJoinColumn
    private QuizScore score;

    @OneToMany(
            mappedBy = "id.registrationId",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
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

    public Integer getScore() {
        return Optional.ofNullable(score).orElse(QuizScore.builder().build()).getScore();
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
