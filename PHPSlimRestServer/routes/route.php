<?php
/*
This is the url to call - adjust the URL to match your own Url requirements

**basic Authorization**
http://private.localhost/htdocs/finalrestdev/public/user
username  A.N.
password Other

**Key API Authorization**
http://private.localhost/htdocs/finalrestdev/public/pricing
Header to Authorization  API key = 1234

**Key JWT Authorization**

step 1 gets the Key with basic authorization
http://private.localhost/htdocs/finalrestdev/public/jwtuser
username temp
password temporary

step 2 sends Key with pricing request
http://private.localhost/htdocs/finalrestdev/public/jwtpricing
Send Token in header 'Authorization'
*/

// This also demonstrates how you can integrate different Authorizations in one Route.....  

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

//add the files
require '../middleware/basicauth.php';
require '../middleware/APIkeyauth.php';
require '../middleware/JWT.php';
//call the middleware classes
$auth = new SlimBasicAuth();
$keyauth = new SlimAPIkeyAuth();
$JWTauth = new SlimJWTAuth();



//add the middleware

//Technically the last added middleware is the first to be executed
//if it were used to run within the script.
//Here we are going to run the middleware for different specific routes.



$app->get('/pricing',function($request,$response,$args){

//Add all the processes to send the total pricing data 

$response = 'hello pricing';
return $response;

//this adds the middleware APIKeyauth.php process.
})->add($keyauth);



$app->get('/user',function($request,$response,$args){

$response = 'user';
return $response;
//this adds the middleware basicAauth.php process.
//adding it at the end of your route gives flexibility to use different middleware for different routes.
})->add($auth);


$app->get('/jwtuser',function($request,$response,$args){
$GetToken = '';
//send the token and leave this response blank as the token needs to be sent back 
$response = '';
return $response;
//this adds the middleware JWTAuth.php process.
})->add($JWTauth);


// responds with a comment and will only be authorized if the JWT token is relevent

$app->get('/jwtpricing',function($request,$response,$args){
//get request string
$headerValueString = $request->getHeaderLine('Authorization');
$AuthToken = $headerValueString;

$JWTauth = new SlimJWTAuth();
// initializes boolean checktoken function
if ($JWTauth->checktoken($AuthToken)){
//resend the Token back to client + a comment add your info here
$response = $AuthToken. '       - Get All the Pricing' ;
return $response;
}else{ 
 $response = 'Unauthorized';
return $response;
}
});

//here you can call pricing by id  - not demonstrated in example

//This is the response based on the Middleware request.
// Shows use of $args option with Slim 3.
$app->get('/pricing/{id}',function($request,$response,$args){
//option one
//$id = $request->getAttribute('id');
//$id = $request->$args['id'];
//option 2 using $args
$response = 'The Blue Pack';
//if ($id == 1){
 
 if ($args['id'] == 1){
 
$response = 'The Red Pack';
}else{
$response = 'error wrong id ' . $args['id']; 
}

return $response;

});





?>