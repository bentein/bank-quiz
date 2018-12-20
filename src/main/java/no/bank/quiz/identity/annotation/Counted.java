package no.bank.quiz.identity.annotation;

import io.micrometer.prometheus.PrometheusMeterRegistry;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Counted {
    String value();
}

@Aspect
@Component
class CountedAspect {

    @Autowired
    private PrometheusMeterRegistry registry;

    @Before(value = "@annotation(anno)", argNames = "anno")
    public void handle(Counted counted) {

        registry.counter(counted.value()).increment();
    }
}