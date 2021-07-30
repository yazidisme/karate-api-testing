function fn() {
    var env = karate.env;
    var config = {
        urlBase: '...'
    };
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}
