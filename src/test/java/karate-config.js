function fn() {
    var env = karate.env;
    var config = {
        urlBase: 'https://jsonplaceholder.typicode.com/'
    };
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    /**
        remove all karate config from all features, then uncomment code below
    **/
//    karate.configure('logPrettyRequest', true);
//    karate.configure('logPrettyResponse', true);
//    karate.configure('report', { showLog: true, showAllSteps: false });
    return config;
}
