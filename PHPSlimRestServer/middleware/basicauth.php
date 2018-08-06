<?php

class SlimBasicAuth 
{

// this has changed for SLim 3 and only the function_ invoke is recognised for the add on middleware processes	


public function __invoke($request,$response, $next)
{
	if (($request->hasHeader('PHP_AUTH_USER')) and 
    ($request->hasHeader('PHP_AUTH_PW'))){
    	//converts to a string output
$headerValueString = $request->getHeaderLine('PHP_AUTH_USER');
$AuthUser = $headerValueString;
//sends the name to response
//$response ->getBody()->write($AuthUser. ' ');
       
       //converts to a string output
$headerValueString = $request->getHeaderLine('PHP_AUTH_PW');
$AuthPass = $headerValueString;
//sends the password to response
//$response ->getBody()->write($AuthPass. ' ');

// Do all your user DB checks here
//Sets one username and password for this example
$username = 'A.N.';
$password = 'Other';

 if ($AuthUser && $AuthPass && $AuthUser === $username && $AuthPass === $password) {
// Checks if authorized

$response ->getBody()->write($AuthUser.' '.$AuthPass. ' is now 
	Authorized ');

//Authorized - Allows the connected route(GET,PUT,DELETE,POST) to continue...
$response= $next($request,$response);
Return $response;
}else{
//Disallow any transactions from carrying on     
$response ->getBody()->write('UnAuthorized ');
Return $response;
}
}
}
}
?>