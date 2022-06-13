package examples.testRunner;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("testRunner").relativeTo(getClass());
    }
}
