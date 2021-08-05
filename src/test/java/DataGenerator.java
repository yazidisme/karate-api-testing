import com.github.javafaker.Faker;

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
}
