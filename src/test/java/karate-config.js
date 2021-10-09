function fn() {

    var config = {
        urlBase: 'https://jsonplaceholder.typicode.com/'
    };
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    /**
        remove all karate config from all features, then uncomment code below for another global config
    **/
//    karate.configure('logPrettyRequest', true);
//    karate.configure('logPrettyResponse', true);
//    karate.configure('report', { showLog: true, showAllSteps: false });

    /**
        set the feature file in the karate.call() function for global afterFeature and or afterScenario
    **/
//    karate.configure('afterFeature', function() { karate.call('YOUR_FEATURE_FILE') });
//    karate.configure('afterScenario', function() { karate.call('YOUR_FEATURE_FILE') });

    return config;
}
