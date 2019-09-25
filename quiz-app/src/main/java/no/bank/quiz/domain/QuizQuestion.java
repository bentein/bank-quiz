package no.bank.quiz.domain;

import lombok.*;

import javax.persistence.*;
import java.util.List;
import java.util.Optional;

@NoArgsConstructor
@Data
@Entity
@Table(name = "question")
@AllArgsConstructor
public class QuizQuestion {

    @Builder
    public QuizQuestion(String description, String quizId, List<QuizAnswer> answers) {
        this.description = description;
        this.quizId = quizId;
        this.answers = answers;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String quizId;

    @Enumerated(EnumType.STRING)
    private QuestionType type;
    private String description;

    @OneToMany(
            mappedBy = "question",
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER)
    private List<QuizAnswer> answers;

    public Optional<QuizAnswer> getCorrectAnswer() {
        return answers.stream()
                .filter(QuizAnswer::getIsCorrect)
                .findAny();
    }
}
