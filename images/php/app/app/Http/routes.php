<?php

use GuzzleHttp\Client;

define('COOSTO_API_HOST', 'https://edu-coosto.dev.coosto.nl');

$app->get('/', function () use ($app) {
    return $app->version();
});

$app->get('/query/{term}', function($term) use ($app) {

    $client = new Client(['base_uri' => COOSTO_API_HOST]);

    $key = $app->request->input('sessionid');

    $response = $client->request('GET', '/api/1/query/results', [
        'query' => [
            'sessionid' => $key,
            'q' => $term
        ]
    ]);

    return $response;
});
