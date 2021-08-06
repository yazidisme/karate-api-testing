import com.github.javafaker.Faker;

import java.util.Random;

public class DataGenerator {

    private static final Faker faker = new Faker();

    public static String characters(int minimumLength, int maximumLength, boolean includeUppercase, boolean includeDigit) {
        return faker
                .lorem()
                .characters(
                        minimumLength,
                        maximumLength,
                        includeUppercase,
                        includeDigit
                );
    }

    public static String sentence(int wordCount) {
        return faker
                .lorem()
                .sentence(
                        wordCount
                );
    }

    public static String name() {
        return faker
                .name()
                .fullName();
    }

    public static String email() {
        return faker
                .internet()
                .emailAddress();
    }

    public static int pickRandomInt(int[] value) {
        Random random = new Random();
        int pickValue = random.nextInt(value.length);
        return value[pickValue];
    }
}
