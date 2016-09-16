<?php

use GuzzleHttp\Client;

define('COOSTO_API')

$app->get('/', function () use ($app) {
    return $app->version();
});

$app->get('/query/{term}', function($term) use ($app) {

    $client = new Client();

    $response = $client->request('GET', COOSTO_API, [
        'sessionid' => COOSTO_TOKEN,
        'term' => $term
    ]);


    return $response;
});
