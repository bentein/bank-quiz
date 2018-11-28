package no.bank.quiz.response.domain;

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
public class UserRegistration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;

    @Enumerated(EnumType.STRING)
    private QuizDifficulty difficulty;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER)
    @JoinColumn(name = "registration_id")
    private List<QuizResponse> responses;

    private long timestamp;

    public LocalDateTime getTimestamp() {
        return LocalDateTime.ofInstant(Instant.ofEpochMilli(timestamp),
                TimeZone.getTimeZone("CET").toZoneId());
    }

}
