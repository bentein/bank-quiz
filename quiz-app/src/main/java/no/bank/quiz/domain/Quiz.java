package no.bank.quiz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "quiz")
@NoArgsConstructor
@AllArgsConstructor
public class Quiz {

    @Id
    private String id;
    private String owner;
    private String description;
    private int attempts;

    @OneToMany(
            mappedBy = "quizId",
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    private List<QuizQuestion> questions;
}
