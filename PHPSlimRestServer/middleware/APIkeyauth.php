<?php

// this has changed for SLim 3 and only the function_ invoke is recognised for the add on middleware processes

class SlimAPIkeyauth 
{


public function __invoke($request,$response, $next)
{
	if ($request->hasHeader('Authorization')) {

$headerValueString = $request->getHeaderLine('Authorization');
$AuthKey = $headerValueString;
//sends the name to response
$response ->getBody()->write($AuthKey. ' ');

$APIkey = '1234';

 if ($AuthKey === $APIkey) {
// Test if authorized
$response ->getBody()->write('Authorized - ');

//Its all good, allows the connected route(GET,PUT,DELETE,POST) to continue... calls the Route linked to the middleware
$response= $next($request,$response);
Return $response;
}else{
//Disallow any transactions from carrying on and sends the response (error)    
$response ->getBody()->write('UnAuthorized ');
// Set any response to be sent back
Return $response;
}
}
}
}
?>