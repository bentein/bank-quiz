package no.bank.workshop.quiz.domain;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name="question")
public class QuizQuestion {

    @Builder
    public QuizQuestion(String description, QuestionDifficulty difficulty, List<QuizAnswer> answers) {
        this.description = description;
        this.difficulty = difficulty;
        this.answers = answers;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String description;

    @Enumerated(EnumType.STRING)
    private QuestionDifficulty difficulty;

    @OneToMany(
            mappedBy = "question",
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER)
    private List<QuizAnswer> answers;
}
