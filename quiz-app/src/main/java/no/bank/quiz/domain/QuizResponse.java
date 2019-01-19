package no.bank.quiz.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.*;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "response")
@JsonPropertyOrder({"registrationId", "questionId", "answerId"})
@AllArgsConstructor
public class QuizResponse {

    public QuizResponse() {
        this.id = QuizResponseId.builder().build();
    }

    @Builder
    public QuizResponse(Integer registrationId, Integer questionId, Integer answerId) {
        this.id = QuizResponseId.builder()
                .registrationId(registrationId)
                .questionId(questionId).build();
        this.answerId = answerId;
    }

    @EmbeddedId
    @Getter(AccessLevel.NONE)
    private QuizResponseId id;
    private Integer answerId;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private long timestamp;

    @JsonIgnore
    public Integer getRegistrationId() {
        return this.id.getRegistrationId();
    }

    public void setRegistrationId(Integer id) {
        this.id.setRegistrationId(id);
    }

    public Integer getQuestionId() {
        return this.id.getQuestionId();
    }

    public void setQuestionId(Integer id) {
        this.id.setQuestionId(id);
    }

}
