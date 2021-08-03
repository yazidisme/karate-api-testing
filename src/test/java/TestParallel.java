import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TestParallel {

    @Test
    public void runTestParallel() {
        Results results = Runner.path("classpath:users").tags("~@ignore").parallel(5);
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }
}
